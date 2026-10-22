using CustomerService as service from '../../srv/service';
annotate service.Transactions with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'channel',
                Value : channel,
            },
            {
                $Type : 'UI.DataField',
                Label : 'amount',
                Value : amount,
            },
            {
                $Type : 'UI.DataField',
                Label : 'txnDate',
                Value : txnDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'pointsEarned',
                Value : pointsEarned,
            },
            {
                $Type : 'UI.DataField',
                Value : txnID,
                Label : 'txnID',
            },
            {
                $Type : 'UI.DataField',
                Value : customer_customerID,
                Label : 'customer_customerID',
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
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'channel',
            Value : channel,
        },
        {
            $Type : 'UI.DataField',
            Label : 'amount',
            Value : amount,
        },
        {
            $Type : 'UI.DataField',
            Label : 'txnDate',
            Value : txnDate,
        },
        {
            $Type : 'UI.DataField',
            Label : 'pointsEarned',
            Value : pointsEarned,
        },
        {
            $Type : 'UI.DataField',
            Value : customer.customerID,
            Label : 'customerID',
        },
    ],
);

annotate service.Transactions with {
    customer @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Customers',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : customer_customerID,
                ValueListProperty : 'customerID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'email',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'totalPoints',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'tier',
            },
        ],
    }
};

