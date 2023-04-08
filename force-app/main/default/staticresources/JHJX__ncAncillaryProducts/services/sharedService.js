(function(){
    'use strict'

    angular.module('ncAncillaryProducts').service('ancillaryProductsService', SharedService);

    SharedService.$inject = ['remotingManager', 'config', 'messageService', '$window'];

    function SharedService(remotingManager, config, messageService, $window) {
        var vm = this;

        vm.config = config.get();

        vm.service = {
            somevar:true
        }

        return vm.service;



    }
})();