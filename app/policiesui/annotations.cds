using CustomerService as service from '../../srv/service';
annotate service.RewardPolicies with @(
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
                Label : 'pointsPerRupee',
                Value : pointsPerRupee,
            },
            {
                $Type : 'UI.DataField',
                Label : 'active',
                Value : active,
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
            Label : 'pointsPerRupee',
            Value : pointsPerRupee,
        },
        {
            $Type : 'UI.DataField',
            Label : 'active',
            Value : active,
        },
    ],
);

