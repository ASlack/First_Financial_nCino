(function(){
	'use strict';
	angular.module('ncAncillaryProducts').component('ancillaryProductsComponent', {
             controller: ['config', 'label', 'ancillaryProductsService', 'jhjxService', '$window', AncFormController],
             controllerAs: 'vm',
             templateUrl: 'ancillaryProducts_html'
            // Commented out for CORS issue
            //  templateUrl: ['config', function(config) {
            //      return config.get().listView;
            //  }]
         });

    function AncFormController(config, label, ancillaryProductsService, jhjxService, $window) {
        var vm = this;

        vm.labels = label.getLabels();
        vm.config = config.get();
        vm.sharedService = ancillaryProductsService;
        vm.jhjxService = jhjxService;

        vm.picklistArray = [];
        vm.picklistMap = {};


        vm.selectOption = function(picklistColValue, picklistOption){
            if(picklistColValue!= null){
                for(var i = 0; i < picklistColValue.length; i++){
                    picklistColValue[i].isSelected = false;
                }
                for(var i = 0; i < picklistColValue.length; i++){
                    if(picklistColValue[i][vm.config.namespace + 'ElemValue__c'] == picklistOption){
                        picklistColValue[i].isSelected = true;
                    }
                }
            }


        };

        vm.redirect = function(idToRedirectTo){
            console.log('redirecting');
            var pathArray = location.href.split( '/' );
            var protocol = pathArray[0];
            var host = pathArray[2];
            var url = protocol + '//' + host;

            $window.open(url+ '/' + idToRedirectTo);
        }

        if(vm.config.picklistArray==null){
            vm.config.picklistArray = {};

            console.log('AncFormController init');

            for(var i = 0; i < vm.config.svcDictInfo.length; i ++){
                var tempPicklistArray = [];
                var title =  vm.config.svcDictInfo[i][vm.config.namespace + 'Title__c'];
                if(title != null){
                    if(vm.picklistMap[title] == null){
                        vm.picklistMap[title] = [];
                    }
                    vm.picklistMap[title].push(vm.config.svcDictInfo[i]);
                }


            }
            var tempArray = [];
            var counter = 0;
            for (const [key, value] of Object.entries(vm.picklistMap)) {
              if(counter % 2 == 0){
                  if(counter>1){
                      console.log('adding to array');
                      vm.picklistArray.push(tempArray);
                      tempArray = [];
                  }
              }
              value.selectedOption = value[0][vm.config.namespace + 'ElemValue__c'];
              vm.selectOption(value, value.selectedOption);
              for(var i = 0; i < value.selectOption; i ++){
                  if(value){
                      if(i==0){
                          value.isSelected = true;
                      }
                      else{
                          value.isSelected = false;
                      }
                  }
              }
              tempArray.push(value);
              counter++;
            }
             if(tempArray.length > 0){
                 if(tempArray.length % 2 != 0){
                     //hacky thing for spacing
                     tempArray.push(null);
                 }
                vm.picklistArray.push(tempArray);
            }

            vm.config.picklistArray = vm.picklistArray;


        }

    }
})();