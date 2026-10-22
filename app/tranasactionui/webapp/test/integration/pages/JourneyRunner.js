sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"tranasactionui/test/integration/pages/TransactionsList.gen",
	"tranasactionui/test/integration/pages/TransactionsObjectPage.gen"
], function (JourneyRunner, TransactionsListGenerated, TransactionsObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('tranasactionui') + '/test/flp.html#app-preview',
        pages: {
			onTheTransactionsListGenerated: TransactionsListGenerated,
			onTheTransactionsObjectPageGenerated: TransactionsObjectPageGenerated
        },
        async: true
    });

    return runner;
});

