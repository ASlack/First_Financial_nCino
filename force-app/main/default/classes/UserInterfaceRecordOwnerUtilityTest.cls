@isTest
private class UserInterfaceRecordOwnerUtilityTest {

    @testSetup static void setup() {
        Id profileID = [SELECT Id FROM Profile WHERE Name = 'System Administrator' LIMIT 1].Id;
        User runningUser = createUser('runninguser', 'runninguser@fake.com', 'runninguser@fake.com', 'ru' , 'ru', profileID, true);
        User originalUserOwner = createUser('originaluserowner', 'originaluserowner@fake.com', 'originaluserowner@fake.com', 'ouo' , 'ouo', profileID, true);
        User newUserOwner = createUser('newuserowner', 'newuserowner@fake.com', 'newuserowner@fake.com', 'nuo' , 'nuo', profileID, true);
      
        nFORCE__Group__c group1 = createGroup('Group A', 'group-a', 'group-001', originalUserOwner.Id);
        nFORCE__Screen__c screen1 = createScreen('Screen A', 'screen-001', originalUserOwner.Id);
        nFORCE__Screen__c screen2 = createScreen('Screen B', 'screen-002', originalUserOwner.Id);
        nFORCE__Screen__c screen3 = createScreen('Screen C', 'screen-003', originalUserOwner.Id);
        nFORCE__Screen__c screen4 = createScreen('Screen D', 'screen-004', originalUserOwner.Id);
        nFORCE__Route__c route1 = createRoute('Route One', 'route-1A', 'test-body1', screen1.Id, 'route-001', originalUserOwner.Id);
        nFORCE__Route__c route2 = createRoute('Route One', 'route-1B', 'test-body2', screen2.Id, 'route-002', originalUserOwner.Id);
        nFORCE__Route__c route3 = createRoute('Route C', 'action-route-1c', 'test-body3', screen3.Id, 'route-003', originalUserOwner.Id);
        nFORCE__Route__c route4 = createRoute('Route C', 'tool-route-1c', 'test-body3', screen4.Id, 'route-004', originalUserOwner.Id);
        nFORCE__Route_Group__c routegroup1 = createRouteGroup(group1.Id, route1.Id, null, 'routegroup-001', originalUserOwner.Id);
        nFORCE__Route_Group__c routegroup2 = createRouteGroup(group1.Id, route2.Id, route2.Id, 'routegroup-002', originalUserOwner.Id);
        nFORCE__Route_Group__c routegroup3 = createRouteGroup(group1.Id, route3.Id, null, 'routegroup-003', originalUserOwner.Id);
        nFORCE__Route_Group__c routegroup4 = createRouteGroup(group1.Id, route4.Id, null, 'routegroup-004', originalUserOwner.Id);
        nFORCE__View__c view1 = createView('view-001', originalUserOwner.Id);
        nFORCE__View__c view2 = createView('view-002', originalUserOwner.Id);
        nFORCE__Screen_Section__c screensection1 = createScreenSection('ScreenSection1', 'LLC_BI__Loan__c', 'MappedSObjectHierarchyResource', screen1.Id, view1.Id, 'screensection-001');
        nFORCE__Screen_Section__c screensection2 = createScreenSection('ScreenSection2', 'LLC_BI__Loan__c', 'MappedSObjectHierarchyResource', screen2.Id, view2.Id, 'screensection-002');
        nFORCE__Screen_Section__c screensection3 = createScreenSection('ScreenSection3', 'LLC_BI__Loan__c', 'MappedSObjectHierarchyResource', screen2.Id, null, 'screensection-003');
        nFORCE__Layout__c layout1 = createLayout('NoLayout', 'Html.Layouts.NoLayout', 'layout-001', originalUserOwner.Id);
        nFORCE__Layout__c layout2 = createLayout('NoLayout', 'Html.Layouts.NoLayout', 'layout-002', originalUserOwner.Id);
        nFORCE__Layout__c layout3 = createLayout('TwoColumnGrid', 'Html.Layouts.TwoColumnGrid', 'layout-003', originalUserOwner.Id);
        nFORCE__Layout__c layout4 = createLayout('NoLayout', 'Html.Layouts.NoLayout', 'layout-004', originalUserOwner.Id);
        nFORCE__Layout__c layout5 = createLayout('TwoColumnGrid', 'Html.Layouts.TwoColumnGrid', 'layout-005', originalUserOwner.Id);
        nFORCE__Section_Configuration__c sectionconfig1 = createSectionConfiguration(screensection1.Id, null, layout1.Id, null, 'ABC937523872', 'LLC_BI__Loan__c', 1.01);
        nFORCE__Section_Configuration__c sectionconfig2 = createSectionConfiguration(screensection2.Id, null, layout2.Id, null, 'DEF283957235', 'LLC_BI__Loan__c', 1.01);
        nFORCE__Section_Configuration__c sectionconfig3 = createSectionConfiguration(screensection2.Id, sectionconfig2.Id, layout3.Id, 'LLC_BI__Collateral__r', 'GHI87346346', 'LLC_BI__Loan__c', 2.01);
        nFORCE__Section_Configuration__c sectionconfig4 = createSectionConfiguration(screensection3.Id, null, layout4.Id, null, 'JKL289357239', 'LLC_BI__Loan__c', 1.01);
        nFORCE__Section_Configuration__c sectionconfig5 = createSectionConfiguration(screensection3.Id, sectionconfig4.Id, layout5.Id, 'LLC_BI__Collateral__r', 'MNO984376487', 'LLC_BI__Loan__c', 2.01);
        //nFORCE__Field_Configuration__c fieldconfig1 = createFieldConfiguration(route1.Id, screensection1.Id, 'Name', 'LLC_BI__Loan__c', 'fieldconfig-001', originalUserOwner.Id);
        //nFORCE__Field_Configuration__c fieldconfig2 = createFieldConfiguration(route2.Id, screensection2.Id, 'Name', 'LLC_BI__Loan__c', 'fieldconfig-002', originalUserOwner.Id);
        nFORCE__Field_Configuration__c fieldconfig1 = createFieldConfiguration(route1.Id, null, 'Name', 'LLC_BI__Loan__c', 'fieldconfig-001', originalUserOwner.Id);
        nFORCE__Field_Configuration__c fieldconfig2 = createFieldConfiguration(route2.Id, null, 'Name', 'LLC_BI__Loan__c', 'fieldconfig-002', originalUserOwner.Id);
        nFORCE__Tile__c tile1 = createTile(originalUserOwner.Id);
        nFORCE__Route_Tile__c routeTile1 = createRouteTile(route1.Id, tile1.Id, 'routetile-011', originalUserOwner.Id);
        nFORCE__Route_Terms__c routeTerm1 = createRouteTerm(route1.Id, 'routeterm-001', originalUserOwner.Id);
    }

    @isTest
    static void recordOwnerTestDriver1() {
        User runningUser  = [SELECT Id FROM User WHERE Username = 'runninguser@fake.com' LIMIT 1];
        User originalUserOwner = [SELECT Id FROM User WHERE Username = 'originaluserowner@fake.com' LIMIT 1];
        User newUserOwner = [SELECT Id FROM User WHERE Username = 'newuserowner@fake.com' LIMIT 1];
        nFORCE__Group__c group1 = [SELECT Id FROM nFORCE__Group__c WHERE nFORCE__App__c = 'group-a' LIMIT 1];
        
        System.runAs (runningUser) {
            originalUserOwner.isActive = false;
            update originalUserOwner;
        }
    
        Test.setCurrentPageReference(new PageReference('Page.UserInterfaceDeepClonePage'));
        System.currentPageReference().getParameters().put('id', group1.Id); //objectId
        
        Test.StartTest();
        UserInterfaceRecordOwnerUtility recordOwnerContainer = new UserInterfaceRecordOwnerUtility();
        recordOwnerContainer.source_group.OwnerId = newUserOwner.Id;
        recordOwnerContainer.analyzeOwners();
        Test.StopTest();
    }
    
    @isTest
    static void recordOwnerTestDriver2() {
        User runningUser  = [SELECT Id FROM User WHERE Username = 'runninguser@fake.com' LIMIT 1];
        User originalUserOwner = [SELECT Id FROM User WHERE Username = 'originaluserowner@fake.com' LIMIT 1];
        User newUserOwner = [SELECT Id FROM User WHERE Username = 'newuserowner@fake.com' LIMIT 1];
        nFORCE__Group__c group1 = [SELECT Id FROM nFORCE__Group__c WHERE nFORCE__App__c = 'group-a' LIMIT 1];
        
        System.runAs (runningUser) {
            originalUserOwner.isActive = false;
            update originalUserOwner;
        }
        
        Test.setCurrentPageReference(new PageReference('Page.UserInterfaceDeepClonePage'));
        System.currentPageReference().getParameters().put('id', group1.Id); //objectId
        
        Test.StartTest();
        UserInterfaceRecordOwnerUtility recordOwnerContainer = new UserInterfaceRecordOwnerUtility();
        recordOwnerContainer.source_group.OwnerId = newUserOwner.Id;
        recordOwnerContainer.assignOwners();
        Test.StopTest();
    }
    
    @isTest
    static void recordOwnerTestDriver3() {
        User runningUser  = [SELECT Id FROM User WHERE Username = 'runninguser@fake.com' LIMIT 1];
        User originalUserOwner = [SELECT Id FROM User WHERE Username = 'originaluserowner@fake.com' LIMIT 1];
        User newUserOwner = [SELECT Id FROM User WHERE Username = 'newuserowner@fake.com' LIMIT 1];
        nFORCE__Group__c group1 = [SELECT Id FROM nFORCE__Group__c WHERE nFORCE__App__c = 'group-a' LIMIT 1];
        
        System.runAs (runningUser) {
            originalUserOwner.isActive = false;
            update originalUserOwner;
        }
        
        Id fakeId = '00a0A0000000aa0';
        Test.setCurrentPageReference(new PageReference('Page.UserInterfaceDeepClonePage'));
        System.currentPageReference().getParameters().put('id', fakeId); //objectId
        
        Test.StartTest();
        UserInterfaceRecordOwnerUtility recordOwnerContainer = new UserInterfaceRecordOwnerUtility();
        recordOwnerContainer.source_group.OwnerId = newUserOwner.Id;
        recordOwnerContainer.analyzeOwners();
        Test.StopTest();
    }
    
    @isTest
    static void recordOwnerTestDriver4() {
        User runningUser  = [SELECT Id FROM User WHERE Username = 'runninguser@fake.com' LIMIT 1];
        User originalUserOwner = [SELECT Id FROM User WHERE Username = 'originaluserowner@fake.com' LIMIT 1];
        User newUserOwner = [SELECT Id FROM User WHERE Username = 'newuserowner@fake.com' LIMIT 1];
        nFORCE__Group__c group1 = [SELECT Id FROM nFORCE__Group__c WHERE nFORCE__App__c = 'group-a' LIMIT 1];
        
        System.runAs (runningUser) {
            originalUserOwner.isActive = false;
            update originalUserOwner;
        }
        
        Id fakeId = '00a0A0000000aa0';
        Test.setCurrentPageReference(new PageReference('Page.UserInterfaceDeepClonePage'));
        System.currentPageReference().getParameters().put('id', fakeId); //objectId
        
        Test.StartTest();
        UserInterfaceRecordOwnerUtility recordOwnerContainer = new UserInterfaceRecordOwnerUtility();
        recordOwnerContainer.source_group.OwnerId = newUserOwner.Id;
        recordOwnerContainer.assignOwners();
        Test.StopTest();
    }

    /**OBJECT CREATION METHODS**/
    
    private static User createUser(String lname, String em, String un, String al, String nn, Id prof, Boolean act) {
        User newUser = new User(LastName = lname, Email = em, Username = un, Alias = al, CommunityNickname = nn, ProfileId = prof, isActive = act,
            TimeZoneSidKey = 'GMT', LocaleSidKey = 'en_US', EmailEncodingKey = 'ISO-8859-1', LanguageLocaleKey = 'en_US');
        insert newUser;
        return newUser;
    }

    private static nFORCE__Group__c createGroup(String n, String app, String lky, Id owner) {
        nFORCE__Group__c newGroup = new nFORCE__Group__c(Name = n, nFORCE__App__c = app, nFORCE__lookupKey__c = lky, OwnerId = owner);
        insert newGroup;
        return newGroup;
    }

    private static nFORCE__Route__c createRoute(String n, String app, String body, Id screen, String lky, Id owner) {
        nFORCE__Route__c newRoute = new nFORCE__Route__c(Name = n, nFORCE__App__c = app, nFORCE__Body__c = body, nFORCE__Screen__c = screen, nFORCE__lookupKey__c = lky, OwnerId = owner);
        insert newRoute;
        return newRoute;
    }

    private static nFORCE__Route_Group__c createRouteGroup(Id grp, Id route, Id route_group, String lky, Id owner) {
        nFORCE__Route_Group__c newRouteGroup = new nFORCE__Route_Group__c(nFORCE__Group__c = grp, nFORCE__Route__c = route, nFORCE__Parent_Route__c = route_group, nFORCE__lookupKey__c = lky, OwnerId = owner);
        insert newRouteGroup;
        return newRouteGroup;
    }

    private static nFORCE__Screen__c createScreen(String n, String lky, Id owner) {
        nFORCE__Screen__c newScreen = new nFORCE__Screen__c(Name = n, nFORCE__lookupKey__c = lky, OwnerId = owner);
        insert newScreen;
        return newScreen;
    }

    private static nFORCE__Screen_Section__c createScreenSection(String n, String sobj, String resource, Id screen, Id view, String lky) {
        nFORCE__Screen_Section__c newScreenSection = new nFORCE__Screen_Section__c(Name = n, nFORCE__sObject_Type__c = sobj,
            nFORCE__Section_Resource__c = resource, nFORCE__Screen__c = screen, nFORCE__Screen_View__c = view, nFORCE__lookupKey__c = lky);
        insert newScreenSection;
        return newScreenSection;
    }

    private static nFORCE__View__c createView(String lky, Id owner) {
        nFORCE__View__c newView = new nFORCE__View__c(nFORCE__lookupKey__c = lky, OwnerId = owner);
        insert newView;
        return newView;
    }

    private static nFORCE__Section_Configuration__c createSectionConfiguration(Id screensection, Id parent_config, Id layout, String parent_name, String lky, String sotype, Decimal order) {
        nFORCE__Section_Configuration__c newSectionConfig = new nFORCE__Section_Configuration__c(nFORCE__Screen_Section__c = screensection,
            nFORCE__Parent_Configuration__c = parent_config, nFORCE__Parent_Relationship_Name__c = parent_name, nFORCE__lookupKey__c = lky,
            nFORCE__sObject_Type__c = sotype, nFORCE__Display_Order__c = order, nFORCE__Layout__c = layout);
        insert newSectionConfig;
        return newSectionConfig;
    }

    private static nFORCE__Layout__c createLayout(String nm, String genclass, String lky, Id owner) {
        nFORCE__Layout__c newLayout = new nFORCE__Layout__c(Name = nm, nFORCE__Generator_Class__c = genclass, nFORCE__lookupKey__c = lky, OwnerId = owner);
        insert newLayout;
        return newLayout;
    }

    private static nFORCE__Field_Configuration__c createFieldConfiguration(Id route, Id ssection, String fname, String oname, String lky, Id owner) {
        nFORCE__Field_Configuration__c newFieldConfig = new nFORCE__Field_Configuration__c(nFORCE__Route__c = route, nFORCE__Screen_Section__c = ssection,
            nFORCE__Field_Name__c = fname, nFORCE__sObject_Name__c = oname, nFORCE__lookupKey__c = lky, OwnerId = owner);
        insert newFieldConfig;
        return newFieldConfig;
    }
    
    private static nFORCE__Tile__c createTile(Id owner) {
        nFORCE__Tile__c newTile = new nFORCE__Tile__c(Name = 'TestTile1', OwnerId = owner);
        insert newTile;
        return newTile;
    }
    
    private static nFORCE__Route_Tile__c createRouteTile(Id route, Id tile, String lky, Id owner) {
        nFORCE__Route_Tile__c newRouteTile = new nFORCE__Route_Tile__c(nFORCE__Route__c = route, nFORCE__Tile__c = tile, nFORCE__lookupKey__c = lky, OwnerId = owner);
        insert newRouteTile;
        return newRouteTile;
    }
    
    private static nFORCE__Route_Terms__c createRouteTerm(Id route, String lky, Id owner) {
        nFORCE__Route_Terms__c newRouteTerms = new nFORCE__Route_Terms__c(nFORCE__Route__c = route, nFORCE__Document__c = '01A1A0000011AAA', nFORCE__lookupKey__c = lky, OwnerId = owner);
        insert newRouteTerms;
        return newRouteTerms;
    }
}