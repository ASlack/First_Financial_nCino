(function(){
	
	angular.module('packageRegistry')
		.service('spinnerSharedService', SpinnerSharedService);
		
	SpinnerSharedService.$inject = ['config', 'label'];	
	
	function SpinnerSharedService(config, label) {
	
	    var serviceInfo = this; 
	    
	    serviceInfo.labels = label.getLabels();
	    serviceInfo.showSpinner = false;
        serviceInfo.spinnerMessage = '';
	
		return {
		    setSpinnerState: setSpinnerState,
		    getSpinnerState: getSpinnerState
		};
        
        function setSpinnerState(isEnabled, message){
            serviceInfo.showSpinner = isEnabled,
        	serviceInfo.spinnerMessage = message;
    	}
    	
    	function getSpinnerState(){
    	    return {
    	        showSpinner : serviceInfo.showSpinner,
            	spinnerMessage : serviceInfo.spinnerMessage
    	    }
    	}
    	
		
    	
	}
	
})();