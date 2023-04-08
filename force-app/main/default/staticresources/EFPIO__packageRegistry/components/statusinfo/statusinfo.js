(function(){
	'use strict';

	angular.module('packageRegistry').component('statusinfo', {
	    bindings: {
	        tileType: '@',
	        registryName: '@',
	        fullyQualifiedClassName: '@'
        },
        controllerAs: 'vm',
        controller: function(config, label, $interval, packageRegistryDataService) {
        	
            var vm = this;
            
            vm.getCssFromName = getCssFromName;

            vm.timerState = '';
            // // vm.TileTypeFriendly = '';
            // // vm.TileTypeCss = '';
            
            // vm.registryName = '';
            // vm.fullyQualifiedClassName = '';
            
            vm.ResultCount = 0;
            
        	vm.labels = label.getLabels();
	        
	        //default values
    	    vm.RefreshValue = config.get().defaultRefreshValue;
            vm.DaysBackValue = config.get().defaultDaysBackValue;
            
            vm.Timer = null;
            vm.upstartTimer = upstartTimer;
            vm.stopTimer = stopTimer;
	        vm.stop = stop;
            
            vm.$onInit = function() {
                vm.ResultCount = 0;
        	    getCount();
        	    vm.upstartTimer();
            }
            
        	function getCount(){
        	    
        	    //stop the timer while we receive the data and process it
        	    vm.stopTimer();
               
                // console.log(vm.registryName);

        	    packageRegistryDataService.getEventLogQuantityByType(vm.registryName, vm.tileType, parseInt(vm.DaysBackValue), vm.fullyQualifiedClassName).then(function(response) {
                    
                    var data = JSON.parse(response);
                    
                    var resultCountAsInteger = parseInt(data.Count);
                    
                    vm.ResultCount = resultCountAsInteger;
                    
                    if(resultCountAsInteger < 0){
                        //there was an error, so stop polling
                        vm.stop();
                        
                    }else{
                        //start the timer again
                        vm.upstartTimer();
                    }
                    
                    
                });
        	   
        	}
        	
        	function upstartTimer() {

                // console.log(vm.registryName);
                // console.log(vm.status.registryName);
                // console.log(vm.registryName);

        	    vm.stopTimer();
                vm.timerState = '';
                //Initialize the Timer to run every 1000 milliseconds i.e. one second.
                vm.Timer = $interval(getCount, (vm.RefreshValue * 1000));
            }
            function stopTimer() {
                //Cancel the Timer.
                if (angular.isDefined(vm.Timer)) {
                    $interval.cancel(vm.Timer);
                }
            }
            function stop() {
                vm.timerState = 'timer-stopped';
                //Cancel the Timer.
                vm.stopTimer();
            }
        	
        	function getCssFromName(typeName){
        	    var cssName = '';
        	    switch (typeName.toUpperCase()) {
                    case 'IN PROGRESS':
                        cssName = "in-progress";
                        break; 
                    case 'SUCCESS':
                        cssName = "success";
                        break; 
                    case 'ERRORED':
                        cssName = "errored";
                        break; 
                    default: //default to errored
                        cssName = "errored";
                }
                return cssName;
        	}
        	
        	
        },
	    templateUrl: function(config){
	        return config.get().templates.statusinfoView
	    }
    });

    
})();