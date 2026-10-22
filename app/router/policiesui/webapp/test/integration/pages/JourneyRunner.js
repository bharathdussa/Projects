sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"policiesui/test/integration/pages/RewardPoliciesList.gen",
	"policiesui/test/integration/pages/RewardPoliciesObjectPage.gen"
], function (JourneyRunner, RewardPoliciesListGenerated, RewardPoliciesObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('policiesui') + '/test/flp.html#app-preview',
        pages: {
			onTheRewardPoliciesListGenerated: RewardPoliciesListGenerated,
			onTheRewardPoliciesObjectPageGenerated: RewardPoliciesObjectPageGenerated
        },
        async: true
    });

    return runner;
});

