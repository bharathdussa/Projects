using CustomerService as service from '../../srv/service';

// 1. Transactions Card Data & Navigation
annotate service.Transactions with @(
    UI.LineItem #OVPTransactions: [
        { $Type : 'UI.DataField', Value : channel, Label : 'Channel' },
        { $Type : 'UI.DataField', Value : amount, Label : 'Amount' },
        { $Type : 'UI.DataField', Value : pointsEarned, Label : 'Points Earned' }
    ],
    UI.Identification #NavToTransactions: [
        { $Type: 'UI.DataFieldForIntentBasedNavigation', SemanticObject: 'Transactions', Action: 'manage' }
    ]
);

// 2. Customers Card Data & Navigation
annotate service.Customers with @(
    UI.LineItem #OVPCustomers: [
        { $Type : 'UI.DataField', Value : name, Label : 'Name' },
        { $Type : 'UI.DataField', Value : tier, Label : 'Tier' },
        { $Type : 'UI.DataField', Value : totalPoints, Label : 'Total Points' }
    ],
    UI.Identification #NavToCustomers: [
        { $Type: 'UI.DataFieldForIntentBasedNavigation', SemanticObject: 'Customers', Action: 'manage' }
    ]
);

// 3. Redemptions Card Data & Navigation
annotate service.Redemptions with @(
    UI.LineItem #OVPRedemptions: [
        { $Type : 'UI.DataField', Value : pointsUsed, Label : 'Points Used' },
        { $Type : 'UI.DataField', Value : redeemDate, Label : 'Date' },
        { $Type : 'UI.DataField', Value : remarks, Label : 'Remarks' }
    ],
    UI.Identification #NavToRedemptions: [
        { $Type: 'UI.DataFieldForIntentBasedNavigation', SemanticObject: 'Redemptions', Action: 'manage' }
    ]
);

// 4. Reward Policies Card Data & Navigation
annotate service.RewardPolicies with @(
    UI.LineItem #OVPPolicies: [
        { $Type : 'UI.DataField', Value : channel, Label : 'Channel' },
        { $Type : 'UI.DataField', Value : pointsPerRupee, Label : 'Points/Rupee' },
        { $Type : 'UI.DataField', Value : active, Label : 'Active' }
    ],
    UI.Identification #NavToPolicies: [
        { $Type: 'UI.DataFieldForIntentBasedNavigation', SemanticObject: 'RewardPolicies', Action: 'manage' }
    ]
);