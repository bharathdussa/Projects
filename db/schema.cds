namespace CustomerLoyalty;

entity Customers {
    key customerID : UUID @cds.on.insert: $uuid;
    name           : String(100);
    email          : String(100);
    totalPoints    : Integer default 0;
    tier           : String(20) default 'Bronze';
    transactions   : Composition of many Transactions 
                         on transactions.customer = $self;
    redemptions    : Composition of many Redemptions 
                         on redemptions.customer = $self;
}

entity Transactions {
    key txnID      : UUID @cds.on.insert: $uuid;
    customer       : Association to Customers;
    channel        : String(50);
    amount         : Decimal(10,2);
    txnDate        : DateTime;
    pointsEarned   : Integer;
}

entity Redemptions {
    key redeemID   : UUID @cds.on.insert: $uuid;
    customer       : Association to Customers;
    pointsUsed     : Integer;
    redeemDate     : DateTime;
    remarks        : String(200);
}

entity RewardPolicies {
    key policyID   : UUID @cds.on.insert: $uuid;
    channel        : String(50);
    pointsPerRupee : Decimal(5,2);
    active         : Boolean default true;
}