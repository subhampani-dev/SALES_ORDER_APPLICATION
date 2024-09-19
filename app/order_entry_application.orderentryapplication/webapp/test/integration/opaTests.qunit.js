sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'orderentryapplication/orderentryapplication/test/integration/FirstJourney',
		'orderentryapplication/orderentryapplication/test/integration/pages/OrderMasterList',
		'orderentryapplication/orderentryapplication/test/integration/pages/OrderMasterObjectPage'
    ],
    function(JourneyRunner, opaJourney, OrderMasterList, OrderMasterObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('orderentryapplication/orderentryapplication') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheOrderMasterList: OrderMasterList,
					onTheOrderMasterObjectPage: OrderMasterObjectPage
                }
            },
            opaJourney.run
        );
    }
);