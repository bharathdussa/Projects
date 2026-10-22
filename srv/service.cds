using { CustomerLoyalty as db } from '../db/schema';

// Secure the entire service so only authenticated users can access it
service CustomerService @(requires: 'authenticated-user') {
    
     
    @restrict: [
        { grant: ['READ'], to: 'Customer' },
        { grant: ['READ', 'CREATE', 'UPDATE'], to: 'RetailStaff' },
        { grant: ['*'], to: 'Admin' }
    ]
    entity Customers as projection on db.Customers;


    @odata.draft.enabled
    @restrict: [
        { grant: ['READ'], to: 'Customer' },
        { grant: ['READ', 'CREATE'], to: 'RetailStaff' },
        { grant: ['*'], to: 'Admin' }
    ]
    entity Transactions as projection on db.Transactions;

    @odata.draft.enabled
    @restrict: [
        { grant: ['READ', 'CREATE'], to: 'Customer' },
        { grant: ['*'], to: 'Admin' }
    ]
    entity Redemptions as projection on db.Redemptions;

    @odata.draft.enabled
    @requires: 'Admin'
    entity RewardPolicies as projection on db.RewardPolicies;

    // Custom action that triggers a pop-up input dialog on the UI
    @restrict: [
    { grant: 'EXECUTE', to: 'RetailStaff' },
    { grant: 'EXECUTE', to: 'Admin' }
    ]
    action createNewCustomer(
        name  : String(100),
        email : String(100),
        tier  : String(20)
    ) returns Customers;
}