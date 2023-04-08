(function () {
	'use strict';
	angular.module('ncJHJXNav').component('jhjxNavComponent', {
		controller: ['config', 'label', 'jhjxNavService', 'jhjxService', NavViewController],
		controllerAs: 'vm',
		templateUrl: 'JHJXNav_html'
		// Commented out for CORS issue
		//  templateUrl: ['config', function(config) {
		//      return config.get().listView;
		//  }]
	});
	function NavViewController(config, label, jhjxNavService, jhjxService) {
		var vm = this;

		vm.labels = label.getLabels();
		vm.config = config.get();
		vm.sharedService = jhjxNavService;
		vm.jhjxService = jhjxService;

		if (!vm.config.isDebugMode) console.log = function () {};

		console.log('navview init ');
	}
})();
