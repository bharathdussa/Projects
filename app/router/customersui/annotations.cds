using CustomerService as service from '../../srv/service';
annotate service.Customers with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'name',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'email',
                Value : email,
            },
            {
                $Type : 'UI.DataField',
                Label : 'totalPoints',
                Value : totalPoints,
            },
            {
                $Type : 'UI.DataField',
                Label : 'tier',
                Value : tier,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Transactions}',
            ID : 'Transactions',
            Target : '@UI.FieldGroup#Transactions',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Redemptions',
            ID : 'Redemptions',
            Target : '@UI.FieldGroup#Redemptions',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'name',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'email',
            Value : email,
        },
        {
            $Type : 'UI.DataField',
            Label : 'totalPoints',
            Value : totalPoints,
        },
        {
            $Type : 'UI.DataField',
            Label : 'tier',
            Value : tier,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'CustomerService.EntityContainer/createNewCustomer',
            Label : 'createNewCustomer',
        },
    ],
    UI.FieldGroup #Transactions : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : transactions.amount,
                Label : 'amount',
            },
            {
                $Type : 'UI.DataField',
                Value : transactions.channel,
                Label : 'channel',
            },
            {
                $Type : 'UI.DataField',
                Value : transactions.pointsEarned,
                Label : 'pointsEarned',
            },
            {
                $Type : 'UI.DataField',
                Value : transactions.txnID,
                Label : 'txnID',
            },
            {
                $Type : 'UI.DataField',
                Value : transactions.txnDate,
                Label : 'txnDate',
            },
        ],
    },
    UI.FieldGroup #Redemptions : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : redemptions.remarks,
                Label : 'remarks',
            },
            {
                $Type : 'UI.DataField',
                Value : redemptions.redeemID,
                Label : 'redeemID',
            },
            {
                $Type : 'UI.DataField',
                Value : redemptions.redeemDate,
                Label : 'redeemDate',
            },
            {
                $Type : 'UI.DataField',
                Value : redemptions.pointsUsed,
                Label : 'pointsUsed',
            },
        ],
    },
);

