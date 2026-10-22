using CustomerService as service from '../../srv/service';
annotate service.Redemptions with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'pointsUsed',
                Value : pointsUsed,
            },
            {
                $Type : 'UI.DataField',
                Label : 'redeemDate',
                Value : redeemDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'remarks',
                Value : remarks,
            },
            {
                $Type : 'UI.DataField',
                Value : redeemID,
                Label : 'redeemID',
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
            Label : 'pointsUsed',
            Value : pointsUsed,
        },
        {
            $Type : 'UI.DataField',
            Label : 'redeemDate',
            Value : redeemDate,
        },
        {
            $Type : 'UI.DataField',
            Label : 'remarks',
            Value : remarks,
        },
        {
            $Type : 'UI.DataField',
            Value : redeemID,
            Label : 'redeemID',
        },
        {
            $Type : 'UI.DataField',
            Value : customer_customerID,
            Label : 'customer_customerID',
        },
    ],
);

annotate service.Redemptions with {
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

