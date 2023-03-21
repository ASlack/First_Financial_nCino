public with sharing class UserInterfaceRecordOwnerUtility {

    transient Savepoint sp;
    
    private Id objectId { get; set; }
    public String RecordId { get; set; }
    nFORCE__Group__c starting_group;
    private nFORCE__Group__c userToOwnerId;
    public nFORCE__Group__c source_group {
        get {
            return userToOwnerId;
        }
        set {
            userToOwnerId = value;
        }
    }
    //public User newOwner { get; set; }
    
    public Decimal inactiveOwnersScreens { get; set; }
    public Decimal inactiveOwnersScreenViews { get; set; }
    public Decimal inactiveOwnersLayouts { get; set; }
    public Decimal inactiveOwnersGroups { get; set; }
    public Decimal inactiveOwnersRoutes { get; set; }
    public Decimal inactiveOwnersRouteGroups { get; set; }
    public Decimal inactiveOwnersFieldConfigs { get; set; }
    public Decimal inactiveOwnersRouteTiles { get; set; }
    public Decimal inactiveOwnersRouteTerms { get; set; }

    public Decimal totalNumberScreens { get; set; }
    public Decimal totalNumberScreenViews { get; set; }
    public Decimal totalNumberLayouts { get; set; }
    public Decimal totalNumberGroups { get; set; }
    public Decimal totalNumberRoutes { get; set; }
    public Decimal totalNumberRouteGroups { get; set; }
    public Decimal totalNumberFieldConfigs { get; set; }
    public Decimal totalNumberRouteTiles { get; set; }
    public Decimal totalNumberRouteTerms { get; set; }
    
    public Boolean showRequiredObjects { get; set; }
    public Boolean showOptionalObjects { get; set; }
    public Boolean inactiveOwners { get; set; }
    
    public UserInterfaceRecordOwnerUtility() {
        Map < String, String > params = ApexPages.currentPage().getParameters();
        this.objectId = ID.valueOf(params.get(ID_FIELD));
        this.RecordId = params.get(ID_FIELD);
        userToOwnerId = new nFORCE__Group__c();
        userToOwnerId.OwnerId = UserInfo.getUserId();
    }
    
    public void retrieveUIRecords(String context) {
        String source_group_query = getFieldsOwnerApplicableSOQL('nFORCE__Group__c', 'Id = \'' + RecordId + '\'');
        nFORCE__Group__c source_group = Database.query(source_group_query);
        starting_group = source_group;

        String source_route_groups_query = getFieldsOwnerApplicableSOQL('nFORCE__Route_Group__c', 'nFORCE__Group__c = \'' + RecordId + '\'');
        List < nFORCE__Route_Group__c > source_route_groups = Database.query(source_route_groups_query);

        Set < Id > source_routeIDs = new Set < Id > ();
        for (nFORCE__Route_Group__c rg: source_route_groups) {
            source_routeIDs.add(rg.nFORCE__Route__c);
        }

        String source_routes_query = getFieldsOwnerApplicableSOQL('nFORCE__Route__c', 'Id IN : source_routeIDs');
        List < nFORCE__Route__c > source_routes = Database.query(source_routes_query);

        source_routes = parseRoutesByApp(source_routes);

        //getting Field Config records that only have a Route reference
        String source_field_configs_query = getFieldsOwnerApplicableSOQL('nFORCE__Field_Configuration__c', 'nFORCE__Route__c IN : source_routeIDs AND nFORCE__Screen_Section__c = null');
        List < nFORCE__Field_Configuration__c > source_field_configs = Database.query(source_field_configs_query);
        
        String source_route_tiles_query = getFieldsOwnerApplicableSOQL('nFORCE__Route_Tile__c', 'nFORCE__Route__c IN : source_routeIDs');
        List < nFORCE__Route_Tile__c > source_route_tiles = Database.query(source_route_tiles_query);
        
        String source_route_terms_query = getFieldsOwnerApplicableSOQL('nFORCE__Route_Terms__c', 'nFORCE__Route__c IN : source_routeIDs');
        List < nFORCE__Route_Terms__c > source_route_terms = Database.query(source_route_terms_query);

        Set < Id > source_screenIDs = new Set < Id > ();
        for (nFORCE__Route__c rt: source_routes) {
            source_screenIDs.add(rt.nFORCE__Screen__c);
        }

        String source_screens_query = getFieldsOwnerApplicableSOQL('nFORCE__Screen__c', 'Id IN : source_screenIDs');
        List < nFORCE__Screen__c > source_screens = Database.query(source_screens_query);

        String source_screen_sections_query = getFieldsDetailObjectsSOQL('nFORCE__Screen_Section__c', 'nFORCE__Screen__c IN : source_screenIDs');
        List < nFORCE__Screen_Section__c > source_screen_sections = Database.query(source_screen_sections_query);

        Set < Id > source_viewIDs = new Set < Id > ();
        Set < Id > source_screenSectionIDs = new Set < Id > ();
        for (nFORCE__Screen_Section__c ss: source_screen_sections) {
            source_viewIDs.add(ss.nFORCE__Screen_View__c);
            source_screenSectionIDs.add(ss.Id);
        }

        //for cloning over conditional Screen Sections
        String source_child_screen_sections_query = getFieldsDetailObjectsSOQL('nFORCE__Screen_Section__c', 'nFORCE__Parent_Screen_Section__c IN : source_screenSectionIDs');
        List < nFORCE__Screen_Section__c > source_child_screen_sections = Database.query(source_child_screen_sections_query);

        for (nFORCE__Screen_Section__c ss: source_child_screen_sections) {
            source_screenSectionIDs.add(ss.Id); //adding the SS IDs to the list for later use
        }
        source_screen_sections.addAll(source_child_screen_sections);

        Set < Id > source_parentScreenIDs = new Set < Id > ();
        for (nFORCE__Screen_Section__c css: source_child_screen_sections) {
            source_parentScreenIDs.add(css.nFORCE__Screen__c);
        }

        String source_parent_screens_query = getFieldsOwnerApplicableSOQL('nFORCE__Screen__c', 'Id IN : source_parentScreenIDs');
        List < nFORCE__Screen__c > source_parent_screens = Database.query(source_parent_screens_query);
        source_screens.addAll(source_parent_screens);
        source_ScreenIDs.addAll(source_parentScreenIDs);
        //end setup for cloning over conditional Screen Sections

        String source_views_query = getFieldsOwnerApplicableSOQL('nFORCE__View__c', 'Id IN : source_viewIDs');
        List < nFORCE__View__c > source_views = Database.query(source_views_query);

        String source_section_configs_query = getFieldsDetailObjectsSOQL('nFORCE__Section_Configuration__c', 'nFORCE__Screen_Section__c IN : source_screenSectionIDs');
        List < nFORCE__Section_Configuration__c > source_section_configs = Database.query(source_section_configs_query);

        //getting Field Config records that only have a Screen Section reference, combining with other FC list
        String source_ss_field_configs_query = getFieldsOwnerApplicableSOQL('nFORCE__Field_Configuration__c', 'nFORCE__Screen_Section__c IN : source_screen_sections AND nFORCE__Route__c = null');
        List < nFORCE__Field_Configuration__c > source_ss_field_configs = Database.query(source_ss_field_configs_query);
        source_field_configs.addAll(source_ss_field_configs);

        Set < Id > source_layoutIDs = new Set < Id > ();
        for (nFORCE__Section_Configuration__c sc: source_section_configs) {
            source_layoutIDs.add(sc.nFORCE__Layout__c);
        }

        System.debug('***1***');
        String source_layouts_query = getFieldsOwnerApplicableSOQL('nFORCE__Layout__c', 'Id IN : source_layoutIDs');
        List < nFORCE__Layout__c > source_layouts = Database.query(source_layouts_query);

        setOwnerResults(source_screens, source_screen_sections, source_section_configs, source_views, source_layouts, source_group, source_route_groups, source_routes, source_field_configs, 
            source_route_tiles, source_route_terms, context);
    }
    
    public void setOwnerResults(List < nFORCE__Screen__c > source_screens, List < nFORCE__Screen_Section__c > source_screen_sections, List < nFORCE__Section_Configuration__c > source_section_configs,
        List < nFORCE__View__c > source_views, List < nFORCE__Layout__c > source_layouts, nFORCE__Group__c source_group, List < nFORCE__Route_Group__c > source_route_groups, List < nFORCE__Route__c > source_routes,
        List < nFORCE__Field_Configuration__c > source_field_configs, List < nFORCE__Route_Tile__c > source_route_tiles, List < nFORCE__Route_Terms__c > source_route_terms, 
        String context) {
        List < nFORCE__Screen__c > inactiveOwner_screens = new List < nFORCE__Screen__c > ();
        List < nFORCE__View__c > inactiveOwner_views = new List < nFORCE__View__c > ();
        List < nFORCE__Layout__c > inactiveOwner_layouts = new List < nFORCE__Layout__c > ();
        List < nFORCE__Group__c > inactiveOwner_groups = new List < nFORCE__Group__c > ();
        List < nFORCE__Route_Group__c > inactiveOwner_route_groups = new List < nFORCE__Route_Group__c > ();
        List < nFORCE__Route__c > inactiveOwner_routes = new List < nFORCE__Route__c > ();
        List < nFORCE__Field_Configuration__c > inactiveOwner_field_configs = new List < nFORCE__Field_Configuration__c > ();
        List < nFORCE__Route_Tile__c > inactiveOwner_route_tiles = new List < nFORCE__Route_Tile__c > ();
        List < nFORCE__Route_Terms__c > inactiveOwner_route_terms = new List < nFORCE__Route_Terms__c > ();
        
        inactiveOwnersGroups = 0;
        totalNumberGroups = 1;
        if (!source_group.Owner.IsActive) {
            inactiveOwnersGroups++;
            inactiveOwner_groups.add(source_group);
        }
        
        inactiveOwnersScreens = 0;
        totalNumberScreens = source_screens.size();
        for (nFORCE__Screen__c s: source_screens) {
            if (!s.Owner.IsActive) {
                inactiveOwnersScreens++;
                inactiveOwner_screens.add(s);
            }
        }
        
        inactiveOwnersRoutes = 0;
        totalNumberRouteGroups = source_routes.size();
        for (nFORCE__Route__c r: source_routes) {
            if (!r.Owner.IsActive) {
                inactiveOwnersRoutes++;
                inactiveOwner_routes.add(r);
            }
        }

        inactiveOwnersRouteGroups = 0;
        totalNumberRoutes = source_route_groups.size();
        for (nFORCE__Route_Group__c rg: source_route_groups) {
            if (!rg.Owner.IsActive) {
                inactiveOwnersRouteGroups++;
                inactiveOwner_route_groups.add(rg);
            }
        }

        inactiveOwnersScreenViews = 0;
        totalNumberScreenViews = source_views.size();
        for (nFORCE__View__c v: source_views) {
            if (!v.Owner.IsActive) {
                inactiveOwnersScreenViews++;
                inactiveOwner_views.add(v);
            }
        }

        inactiveOwnersLayouts = 0;
        totalNumberLayouts = source_layouts.size();
        for (nFORCE__Layout__c l: source_layouts) {
            if (!l.Owner.IsActive) {
                inactiveOwnersLayouts++;
                inactiveOwner_layouts.add(l);
            }
        }

        inactiveOwnersFieldConfigs = 0;
        totalNumberFieldConfigs = source_field_configs.size();
        for (nFORCE__Field_Configuration__c fc: source_field_configs) {
            if (!fc.Owner.IsActive) {
                inactiveOwnersFieldConfigs++;
                inactiveOwner_field_configs.add(fc);
            }
        }
        
        inactiveOwnersRouteTiles = 0;
        totalNumberRouteTiles = source_route_tiles.size();
        for (nFORCE__Route_Tile__c rt: source_route_tiles) {
            if (!rt.Owner.IsActive) {
                inactiveOwnersRouteTiles++;
                inactiveOwner_route_tiles.add(rt);
            }
        }
        
        inactiveOwnersRouteTerms = 0;
        totalNumberRouteTerms = source_route_terms.size();
        for (nFORCE__Route_Terms__c rt: source_route_terms) {
            if (!rt.Owner.IsActive) {
                inactiveOwnersRouteTerms++;
                inactiveOwner_route_terms.add(rt);
            }
        }

        if (context == 'analyze') {
            //Just check to see if any missing lookupkeys were found and show the results and a message
            if (inactiveOwnersScreens > 0 || inactiveOwnersScreenViews > 0 || inactiveOwnersLayouts > 0 || inactiveOwnersGroups > 0 || inactiveOwnersRouteGroups > 0 || inactiveOwnersRoutes > 0 || inactiveOwnersFieldConfigs > 0 || inactiveOwnersRouteTiles > 0 || inactiveOwnersRouteTerms > 0) {
                showRequiredObjects = true;
                showOptionalObjects = true;
                inactiveOwners = true;
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Inactive Owners were found.  Please refer to the analysis.'));
            } else {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM, 'None of the records in this Group have inactive Owners.  Please proceed with the cloning operation.'));
            }
        }
        
        if (context == 'assign') {
            if(userToOwnerId != null) {
                //proceed with actually assigning new owner, hide results and display message
                Id newOwnerId = userToOwnerId.OwnerId;
                System.debug('*** NEWOWNERID: ' + newOwnerId);
                
                System.debug('*** SCREENS SIZE: ' + inactiveOwner_screens.size());
                if (inactiveOwner_screens.size() > 0) {
                    for (nFORCE__Screen__c s: inactiveOwner_screens) {
                        s.OwnerId = newOwnerId;
                    }
                    update inactiveOwner_screens;
                }
                
                System.debug('*** VIEWS SIZE: ' + inactiveOwner_views.size());
                if (inactiveOwner_views.size() > 0) {
                    for (nFORCE__View__c s: inactiveOwner_views) {
                        s.OwnerId = newOwnerId;
                    }
                    update inactiveOwner_views;
                }
                
                System.debug('*** LAYOUTS SIZE: ' + inactiveOwner_layouts.size());
                if (inactiveOwner_layouts.size() > 0) {
                    for (nFORCE__Layout__c s: inactiveOwner_layouts) {
                        s.OwnerId = newOwnerId;
                    }
                    update inactiveOwner_layouts;
                }
    
                if (inactiveOwner_groups.size() > 0) {
                    for (nFORCE__Group__c s: inactiveOwner_groups) {
                        s.OwnerId = newOwnerId;
                    }
                    update inactiveOwner_groups;
                }
    
                if (inactiveOwner_route_groups.size() > 0) {
                    for (nFORCE__Route_Group__c s: inactiveOwner_route_groups) {
                        s.OwnerId = newOwnerId;
                    }
                    update inactiveOwner_route_groups;
                }
    
                if (inactiveOwner_routes.size() > 0) {
                    for (nFORCE__Route__c s: inactiveOwner_routes) {
                        s.OwnerId = newOwnerId;
                    }
                    update inactiveOwner_routes;
                }
    
                if (inactiveOwner_field_configs.size() > 0) {
                    for (nFORCE__Field_Configuration__c s: inactiveOwner_field_configs) {
                        s.OwnerId = newOwnerId;
                    }
                    update inactiveOwner_field_configs;
                }
                
                if (inactiveOwner_route_tiles.size() > 0) {
                    for (nFORCE__Route_Tile__c rt: inactiveOwner_route_tiles) {
                        rt.OwnerId = newOwnerId;
                    }
                    update inactiveOwner_route_tiles;
                }   
    
                if (inactiveOwner_route_terms.size() > 0) {
                    for (nFORCE__Route_Terms__c rt: inactiveOwner_route_terms) {
                        rt.OwnerId = newOwnerId;
                    }
                    update inactiveOwner_route_terms;
                }
                
                showRequiredObjects = false;
                showOptionalObjects = false;
                inactiveOwners = false;
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM, 'New Owner has been assigned successfully.'));
            } else {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Please select a valid user to serve as the new Owner.'));
            }
        }
    }
    
    //Returns a dynamic SOQL statement for the whole object
    public static string getFieldsOwnerApplicableSOQL(String objectName, String whereClause) {
        String selects = '';
        if (whereClause == null || whereClause == '') {
            return null;
        }

        // Get a map of field name and field token
        Map < String, Schema.SObjectField > fMap = Schema.getGlobalDescribe().get(objectName.toLowerCase()).getDescribe().Fields.getMap();
        list < string > selectFields = new list < string > ();

        if (fMap != null) {
            for (Schema.SObjectField ft: fMap.values()) { // loop through all field tokens (ft)
                Schema.DescribeFieldResult fd = ft.getDescribe(); // describe each field (fd)
                //if (fd.isCreateable()){ // field is creatable
                selectFields.add(fd.getName());
                //}
            }
        }

        if (!selectFields.isEmpty()) {
            for (string s: selectFields) {
                selects += s + ',';
            }
            if (selects.endsWith(',')) {
                selects = selects.substring(0, selects.lastIndexOf(','));
            }
        }

        system.debug('**the query** : ' + 'SELECT ' + selects + ' FROM ' + objectName + ' WHERE ' + whereClause);
        return 'SELECT ' + selects + ', Owner.Name, Owner.IsActive FROM ' + objectName + ' WHERE ' + whereClause;
    }
    
    //Returns a dynamic SOQL statement for the whole object
    public static string getFieldsDetailObjectsSOQL(String objectName, String whereClause) {
        String selects = '';
        if (whereClause == null || whereClause == '') {
            return null;
        }

        // Get a map of field name and field token
        Map < String, Schema.SObjectField > fMap = Schema.getGlobalDescribe().get(objectName.toLowerCase()).getDescribe().Fields.getMap();
        list < string > selectFields = new list < string > ();

        if (fMap != null) {
            for (Schema.SObjectField ft: fMap.values()) { // loop through all field tokens (ft)
                Schema.DescribeFieldResult fd = ft.getDescribe(); // describe each field (fd)
                //if (fd.isCreateable()){ // field is creatable
                selectFields.add(fd.getName());
                //}
            }
        }

        if (!selectFields.isEmpty()) {
            for (string s: selectFields) {
                selects += s + ',';
            }
            if (selects.endsWith(',')) {
                selects = selects.substring(0, selects.lastIndexOf(','));
            }
        }

        system.debug('**the query** : ' + 'SELECT ' + selects + ' FROM ' + objectName + ' WHERE ' + whereClause);
        return 'SELECT ' + selects + ' FROM ' + objectName + ' WHERE ' + whereClause;
    }

    /*** Paring down source_routes to exclude unique, single-use/single-App routes that can only appear once in the Org. ***/
    /*** The Route Groups for these routes will still be created, and will point to the original route. ***/
    private List < nFORCE__Route__c > parseRoutesByApp(List < nFORCE__Route__c > source_routes) {
        List < nFORCE__Route__c > new_source_routes = new List < nFORCE__Route__c > ();
        List < String > unique_apps = new List < String > {
            'loan-auto-decision-history',
            'loan-auto-decision-detail',
            'doc-prep',
            'doc-prep-status',
            'doc-prep-closing',
            'doc-prep-review',
            'rate-structure',
            'payment-structure',
            'tool-docman',
            'unidoc'
        };

        for (nFORCE__Route__c sr: source_routes) {
            if (unique_apps.contains(sr.nFORCE__App__c)) {
                //do nothing - want to avoid creating a duplicate route if it has a unique/one-only apps
            } else {
                new_source_routes.add(sr);
            }
        }

        return new_source_routes;
    }
    
    public PageReference analyzeOwners() {
        //Assuming these are false, before actually analyzing
        showRequiredObjects = false;
        showOptionalObjects = false;
        inactiveOwners = false;

        try {
            sp = Database.setSavepoint();
            retrieveUIRecords('analyze');
            return null; //same page
        } catch (exception e) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Error: ' + e));
            return null;
        }
    }
    
    public PageReference assignOwners() {
        try {
            sp = Database.setSavepoint();
            retrieveUIRecords('assign');
            return null; //same page
        } catch (exception e) {
            Database.rollback(sp);
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Error: ' + e));
            return null;
        }
    }

    transient private static final String ID_FIELD = 'id';
}