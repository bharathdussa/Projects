const cds = require('@sap/cds');

module.exports = (srv) => {

    const {
        Customers,
        Transactions,
        Redemptions,
        RewardPolicies
    } = srv.entities;

    // ========================================
    // CUSTOM ACTION: CREATE NEW CUSTOMER
    // ========================================
    srv.on('createNewCustomer', async (req) => {
        const { name, email, tier } = req.data;

        // Generate a unique ID for the new customer record
        const customerID = cds.utils.uuid();

        // Prepare the entry payload
        const newCustomer = {
            customerID: customerID,
            name: name,
            email: email,
            tier: tier || 'Bronze',
            totalPoints: 0
        };

        // Insert directly into the database
        await INSERT.into(Customers).entries(newCustomer);

        // Return the created record to refresh the UI table view
        return await SELECT.one.from(Customers).where({ customerID: customerID });
    });

    // ========================================
    // CREATE TRANSACTION
    // Calculate loyalty points
    // ========================================
    srv.before("CREATE", "Transactions", async (req) => {
        const {
            customer_customerID,
            channel,
            amount
        } = req.data;

        if (!customer_customerID) {
            return req.reject(
                400,
                "Customer is required"
            );
        }

        if (amount === undefined || amount <= 0) {
            return req.reject(
                400,
                "Amount must be greater than zero"
            );
        }

        if (!channel) {
            return req.reject(
                400,
                "Channel is required"
            );
        }

        const policy = await SELECT.one
            .from(RewardPolicies)
            .where({
                channel: channel,
                active: true
            });

        if (!policy) {
            return req.reject(
                400,
                `No active reward policy found for channel: ${channel}`
            );
        }

        req.data.pointsEarned =
            Math.floor(
                Number(amount) *
                Number(policy.pointsPerRupee)
            );

        if (!req.data.txnDate) {
            req.data.txnDate = new Date();
        }
    });

    // ========================================
    // AFTER CREATE TRANSACTION
    // Add points to customer
    // ========================================
    srv.after("CREATE", "Transactions", async (data) => {
        const {
            customer_customerID,
            pointsEarned
        } = data;

        if (!customer_customerID ||
            pointsEarned === undefined) {
            return;
        }

        await UPDATE(Customers)
            .set({
                totalPoints: {
                    "+=": pointsEarned
                }
            })
            .where({
                customerID: customer_customerID
            });
    });

    // ========================================
    // CREATE REDEMPTION
    // Validate points
    // ========================================
    srv.before("CREATE", "Redemptions", async (req) => {
        const {
            customer_customerID,
            pointsUsed
        } = req.data;

        if (!customer_customerID) {
            return req.reject(
                400,
                "Customer is required"
            );
        }

        if (pointsUsed === undefined || pointsUsed <= 0) {
            return req.reject(
                400,
                "Points used must be greater than zero"
            );
        }

        const customer = await SELECT.one
            .from(Customers)
            .where({
                customerID: customer_customerID
            });

        if (!customer) {
            return req.reject(
                404,
                "Customer not found"
            );
        }

        if (customer.totalPoints < pointsUsed) {
            return req.reject(
                400,
                `Insufficient points. Available points: ${customer.totalPoints}`
            );
        }

        if (!req.data.redeemDate) {
            req.data.redeemDate = new Date();
        }
    });

    // ========================================
    // AFTER CREATE REDEMPTION
    // Deduct points
    // ========================================
    srv.after("CREATE", "Redemptions", async (data) => {
        const {
            customer_customerID,
            pointsUsed
        } = data;

        if (!customer_customerID ||
            pointsUsed === undefined) {
            return;
        }

        await UPDATE(Customers)
            .set({
                totalPoints: {
                    "-=": pointsUsed
                }
            })
            .where({
                customerID: customer_customerID
            });
    });

};
