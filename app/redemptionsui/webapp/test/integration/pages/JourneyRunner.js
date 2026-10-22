sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"redemptionsui/test/integration/pages/RedemptionsList.gen",
	"redemptionsui/test/integration/pages/RedemptionsObjectPage.gen"
], function (JourneyRunner, RedemptionsListGenerated, RedemptionsObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('redemptionsui') + '/test/flp.html#app-preview',
        pages: {
			onTheRedemptionsListGenerated: RedemptionsListGenerated,
			onTheRedemptionsObjectPageGenerated: RedemptionsObjectPageGenerated
        },
        async: true
    });

    return runner;
});

