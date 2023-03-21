public with sharing class RouteDeepClone {
    transient Savepoint sp;
    private Boolean hasLookupKeys = false;
    private Boolean invalidRouteName = false;
    nFORCE__Route__c new_route;
    nFORCE__Route__c starting_route;
    private String lookupKeyMissingObject = '';

    private Id objectId { get; set; }
    public String RecordId { get; set; }
    public String newRouteAppValue { get; set; }
    
    public Boolean includeFieldConfigs { get; set; }
    public Boolean includeRouteTiles { get; set; }
    public Boolean includeRouteTerms { get; set; }
    
    public List < RouteGroupsWrapper > searchResults { get; set; }
    
    public RouteDeepClone() {
        Map < String, String > params = ApexPages.currentPage().getParameters();
        this.objectId = ID.valueOf(params.get(ID_FIELD));
        this.RecordId = params.get(ID_FIELD);
        Id grID = this.RecordId;
        search();
    }
    
    /* THE ROUTE GROUPS THAT WERE CHECKED (SELECTED) */
    public List < RouteGroupsWrapper > selectedRouteGroups {
        get {
            if (selectedRouteGroups == null) selectedRouteGroups = new List < RouteGroupsWrapper > ();
            return selectedRouteGroups;
        }
        set;
    }

    public PageReference search() {
        if (searchResults == null) {
            searchResults = new List < RouteGroupsWrapper > ();
        } else {
            searchResults.clear();
        }

        String qry = 'SELECT Id, Name, nFORCE__Route__r.Name, nFORCE__Route__r.nFORCE__App__c, nFORCE__Order__c, nFORCE__Parent_Route__r.Name, ' +
            'nFORCE__Is_Default_Context_Child__c, nFORCE__Is_Hidden__c FROM nFORCE__Route_Group__c ' +
            'WHERE nFORCE__Route__c = ' + '\'' + RecordId + '\'' +
            ' ORDER BY Name ASC';

        for (nFORCE__Route_Group__c rg: Database.query(qry)) {
            RouteGroupsWrapper rgw = new RouteGroupsWrapper(rg);
            searchResults.add(rgw);
        }
        return null;
    }

    public void doRouteDeepClone() {
        /*** RETRIEVE SOURCE RECORDS ***/
        //getting starting Route
        String source_route_query = getCreatableFieldsSOQL('nFORCE__Route__c', 'Id = \'' + RecordId + '\'');
        nFORCE__Route__c source_route = Database.query(source_route_query);
        starting_route = source_route;
        List < nFORCE__Route__c > source_routes = new List < nFORCE__Route__c >();
        source_routes.add(source_route);
        
        //getting route groups that were checked, if any
        for (RouteGroupsWrapper cw: searchResults) {
            if (cw.checked)
                selectedRouteGroups.add(new RouteGroupsWrapper(cw.rtgrp));
        }
        
       String source_route_groups_query = '';
        List < nFORCE__Route_Group__c > source_route_groups = null;
        if (selectedRouteGroups.size() > 0) { //Was at least 1 Route Group manually selected from the list?
            Set < Id > selected_RouteGroupIDs = new Set < Id > ();
            for (RouteGroupsWrapper rg: selectedRouteGroups) { //Loop through Route Groups that were checked on the VF Page
                selected_RouteGroupIDs.add(rg.rtgrp.Id);
            }

            source_route_groups_query = getCreatableFieldsSOQL('nFORCE__Route_Group__c', 'Id IN : selected_RouteGroupIDs');
            source_route_groups = Database.query(source_route_groups_query);
        } else { //None manually selected - just clone ALL Route Groups
            //leave source_route_groups null
        }
        
        //getting Field Config records that only have a Route reference
        String source_field_configs_query = getCreatableFieldsSOQL('nFORCE__Field_Configuration__c', 'nFORCE__Route__c IN : source_routes AND nFORCE__Screen_Section__c = null');
        List < nFORCE__Field_Configuration__c > source_field_configs = Database.query(source_field_configs_query);
        
        String source_route_tiles_query = getCreatableFieldsSOQL('nFORCE__Route_Tile__c', 'nFORCE__Route__c IN : source_routes');
        List < nFORCE__Route_Tile__c > source_route_tiles = Database.query(source_route_tiles_query);
        
        String source_route_terms_query = getCreatableFieldsSOQL('nFORCE__Route_Terms__c', 'nFORCE__Route__c IN : source_routes');
        List < nFORCE__Route_Terms__c > source_route_terms = Database.query(source_route_terms_query);

        Set < Id > source_screenIDs = new Set < Id > ();
        source_screenIDs.add(source_route.nFORCE__Screen__c);

        String source_screens_query = getCreatableFieldsSOQL('nFORCE__Screen__c', 'Id IN : source_screenIDs');
        List < nFORCE__Screen__c > source_screens = Database.query(source_screens_query);

        String source_screen_sections_query = getCreatableFieldsSOQL('nFORCE__Screen_Section__c', 'nFORCE__Screen__c IN : source_screenIDs');
        List < nFORCE__Screen_Section__c > source_screen_sections = Database.query(source_screen_sections_query);

        Set < Id > source_viewIDs = new Set < Id > ();
        Set < Id > source_screenSectionIDs = new Set < Id > ();
        for (nFORCE__Screen_Section__c ss: source_screen_sections) {
            source_viewIDs.add(ss.nFORCE__Screen_View__c);
            source_screenSectionIDs.add(ss.Id);
        }

        //for cloning over conditional Screen Sections
        String source_child_screen_sections_query = getCreatableFieldsSOQL('nFORCE__Screen_Section__c', 'nFORCE__Parent_Screen_Section__c IN : source_screenSectionIDs');
        List < nFORCE__Screen_Section__c > source_child_screen_sections = Database.query(source_child_screen_sections_query);

        for (nFORCE__Screen_Section__c ss: source_child_screen_sections) {
            source_screenSectionIDs.add(ss.Id); //adding the SS IDs to the list for later use
        }
        source_screen_sections.addAll(source_child_screen_sections);

        Set < Id > source_parentScreenIDs = new Set < Id > ();
        for (nFORCE__Screen_Section__c css: source_child_screen_sections) {
            if (!source_screenIDs.contains(css.nFORCE__Screen__c)) {
                source_parentScreenIDs.add(css.nFORCE__Screen__c);
            }
        }

        String source_parent_screens_query = getCreatableFieldsSOQL('nFORCE__Screen__c', 'Id IN : source_parentScreenIDs');
        List < nFORCE__Screen__c > source_parent_screens = Database.query(source_parent_screens_query);
        source_screens.addAll(source_parent_screens);
        source_ScreenIDs.addAll(source_parentScreenIDs);
        //end setup for cloning over conditional Screen Sections

        String source_views_query = getCreatableFieldsSOQL('nFORCE__View__c', 'Id IN : source_viewIDs');
        List < nFORCE__View__c > source_views = Database.query(source_views_query);

        String source_section_configs_query = getCreatableFieldsSOQL('nFORCE__Section_Configuration__c', 'nFORCE__Screen_Section__c IN : source_screenSectionIDs');
        List < nFORCE__Section_Configuration__c > source_section_configs = Database.query(source_section_configs_query);

        //getting Field Config records that only have a Screen Section reference, combining with other FC list
        String source_ss_field_configs_query = getCreatableFieldsSOQL('nFORCE__Field_Configuration__c', 'nFORCE__Screen_Section__c IN : source_screen_sections AND nFORCE__Route__c = null');
        List < nFORCE__Field_Configuration__c > source_ss_field_configs = Database.query(source_ss_field_configs_query);
        source_field_configs.addAll(source_ss_field_configs);

        Set < Id > source_layoutIDs = new Set < Id > ();
        for (nFORCE__Section_Configuration__c sc: source_section_configs) {
            source_layoutIDs.add(sc.nFORCE__Layout__c);
        }

        String source_layouts_query = getCreatableFieldsSOQL('nFORCE__Layout__c', 'Id IN : source_layoutIDs');
        List < nFORCE__Layout__c > source_layouts = Database.query(source_layouts_query);

        hasLookupKeys = checkLookupkeys(source_route_groups, source_routes, source_field_configs, source_route_tiles, source_route_terms, source_screens, 
            source_screen_sections, source_views, source_section_configs, source_layouts);
        
        /*** CLONING OPERATIONS ***/            
        if (hasLookupKeys) {
            sp = Database.setSavepoint();

            Map < Id, String > route_apps_map = new Map < Id, String > (); //to compare source routes to new routes
            List < nFORCE__Route__c > new_routes = new List < nFORCE__Route__c > ();
            List < nFORCE__Route__c > all_routes = [SELECT Id, nFORCE__App__c FROM nFORCE__Route__c];
            Set < String > route_app_set = new Set < String > ();
            for (nFORCE__Route__c r: all_routes) {
                route_app_set.add(r.nFORCE__App__c);
            }

            nFORCE__Route__c temp_route;
            for (nFORCE__Route__c r: source_routes) {
                String routeAppValue = '';
                temp_route = r.clone(false, false, false, false);
                temp_route.nFORCE__App__c = simplifyName(newRouteAppValue);

                Integer route_count = 2;
                System.debug('***route appValue: ' + routeAppValue);
                while (route_app_set.contains(routeAppValue)) { //attempting to work around duplicate App values by appending a numeric value
                    System.debug('***route appValue dupe: ' + routeAppValue);
                    routeAppValue += String.valueOf(route_count);
                    temp_route.nFORCE__App__c = routeAppValue;
                    System.debug('***route appValue adjusted: ' + temp_route.nFORCE__App__c);
                    route_count++;
                }

                route_app_set.add(routeAppValue);

                //leaving original screen, for now
                temp_route.nFORCE__lookupKey__c = generateRandomString(4);
                new_routes.add(temp_route);

                route_apps_map.put(r.Id, routeAppValue);
            }
            System.debug('***C***');
            handleUniqueFields(new_routes, 'nFORCE__Route__c');
            insert new_routes;
            new_route = new_routes[0];
            
            if(source_route_groups != null) {
                List < nFORCE__Route_Group__c > new_route_groups = new List < nFORCE__Route_Group__c > ();
                nFORCE__Route_Group__c temp_route_group;
                for (nFORCE__Route_Group__c rg: source_route_groups) {
                    temp_route_group = rg.clone(false, false, false, false);
                    temp_route_group.nFORCE__Route__c = new_route.Id;
                    temp_route_group.nFORCE__lookupKey__c = generateRandomString(4);
                    new_route_groups.add(temp_route_group);
                }
                System.debug('***B***');
                handleUniqueFields(new_route_groups, 'nFORCE__Route_Group__c');
                insert new_route_groups; //These route groups are still pointing to original routes, for now
            }

            Map < Id, String > screen_map = new Map < Id, String > ();
            List < nFORCE__Screen__c > new_screens = new List < nFORCE__Screen__c > ();
            nFORCE__Screen__c temp_screen;
            for (nFORCE__Screen__c s: source_screens) {
                temp_screen = s.clone(false, false, false, false);
                temp_screen.nFORCE__lookupKey__c = generateRandomString(4);
                new_screens.add(temp_screen);

                screen_map.put(s.Id, temp_screen.nFORCE__lookupKey__c);
            }
            System.debug('***E***');
            handleUniqueFields(new_screens, 'nFORCE__Screen__c');
            insert new_screens;

            for (nFORCE__Route__c r: new_routes) { //update Routes to use correct new Screen
                for (Id screen_id: screen_map.keySet()) {
                    if (r.nFORCE__Screen__c == screen_id) {
                        for (nFORCE__Screen__c s: new_screens) {
                            if (s.nFORCE__lookupKey__c == screen_map.get(screen_id)) {
                                r.nFORCE__Screen__c = s.Id;
                            }
                        }
                    }
                }
            }
            System.debug('***F***');
            update new_routes;

            Map < Id, String > screen_section_map = new Map < Id, String > ();
            List < nFORCE__Screen_Section__c > new_screen_sections = new List < nFORCE__Screen_Section__c > ();
            nFORCE__Screen_Section__c temp_screen_section;
            for (nFORCE__Screen_Section__c ss: source_screen_sections) {
                temp_screen_section = ss.clone(false, false, false, false);
                temp_screen_section.nFORCE__lookupKey__c = generateRandomString(4);
                new_screen_sections.add(temp_screen_section);

                //populate map, will later be used for section configs
                screen_section_map.put(ss.Id, temp_screen_section.nFORCE__lookupKey__c);
            }
            System.debug('***G***');
            handleUniqueFields(new_screen_sections, 'nFORCE__Screen_Section__c');
            insert new_screen_sections;

            Map < Id, String > view_map = new Map < Id, String > ();
            List < nFORCE__View__c > new_views = new List < nFORCE__View__c > ();
            nFORCE__View__c temp_view;
            for (nFORCE__View__c sv: source_views) {
                temp_view = sv.clone(false, false, false, false);
                temp_view.nFORCE__lookupKey__c = generateRandomString(4);
                new_views.add(temp_view);

                view_map.put(sv.Id, temp_view.nFORCE__lookupKey__c);
            }
            System.debug('***H***');
            handleUniqueFields(new_views, 'nFORCE__View__c');
            insert new_views;

            for (nFORCE__Screen_Section__c ss: new_screen_sections) { //set correct Screen on Screen Section
                for (Id screen_id: screen_map.keySet()) {
                    if (ss.nFORCE__Screen__c == screen_id) {
                        for (nFORCE__Screen__c s: new_screens) {
                            if (s.nFORCE__lookupKey__c == screen_map.get(screen_id)) {
                                ss.nFORCE__Screen__c = s.Id;
                            }
                        }
                    }
                }
            }

            for (nFORCE__Screen_Section__c ss: new_screen_sections) { //set correct View on Screen Section
                for (Id view_id: view_map.keySet()) {
                    if (ss.nFORCE__Screen_View__c == view_id) {
                        for (nFORCE__View__c v: new_views) {
                            if (v.nFORCE__lookupKey__c == view_map.get(view_id)) {
                                ss.nFORCE__Screen_View__c = v.Id;
                            }
                        }
                    }
                }
            }

            for (nFORCE__Screen_Section__c ssn: new_screen_sections) { //set correct Parent Screen Section on Screen Section
                for (Id screen_section_id: screen_section_map.keySet()) {
                    if (ssn.nFORCE__Parent_Screen_Section__c == screen_section_id) {
                        for (nFORCE__Screen_Section__c ssn2: new_screen_sections) {
                            if (ssn2.nFORCE__lookupKey__c == screen_section_map.get(screen_section_id)) {
                                ssn.nFORCE__Parent_Screen_Section__c = ssn2.Id;
                            }
                        }
                    }
                }
            }

            System.debug('***I***');
            update new_screen_sections;

            /* Adding Field Configs */
            if(includeFieldConfigs) {
                List < nFORCE__Field_Configuration__c > new_field_configs = new List < nFORCE__Field_Configuration__c > ();
                nFORCE__Field_Configuration__c temp_field_config;
                for (nFORCE__Field_Configuration__c fc: source_field_configs) {
                    temp_field_config = fc.clone(false, false, false, false);
                    temp_field_config.nFORCE__lookupKey__c = generateRandomString(4);
                    new_field_configs.add(temp_field_config);
                }
                System.debug('***J***');
                handleUniqueFields(new_field_configs, 'nFORCE__Field_Configuration__c');
                insert new_field_configs; //These Field Configs are still pointing to original routes and screen sections, for now
    
                for (nFORCE__Field_Configuration__c fc: new_field_configs) {
                    for (Id route_id: route_apps_map.keySet()) { //correcting the Field Configs, so they point to new routes...
                        if (fc.nFORCE__Route__c == route_id) {
                            for (nFORCE__Route__c nr: new_routes) {
                                //get new App value related to source route record Id
                                if (nr.nFORCE__App__c == route_apps_map.get(route_id)) {
                                    fc.nFORCE__Route__c = nr.Id;
                                }
                            }
                        }
                    }
    
                    for (Id screen_section_id: screen_section_map.keySet()) { //set correct Screen Section on Field Configs
                        if (fc.nFORCE__Screen_Section__c == screen_section_id) {
                            for (nFORCE__Screen_Section__c ss: new_screen_sections) {
                                if (ss.nFORCE__lookupKey__c == screen_section_map.get(screen_section_id)) {
                                    fc.nFORCE__Screen_Section__c = ss.Id;
                                }
                            }
                        }
                    }
                }
                System.debug('***K***');
                update new_field_configs;
            }
            /* End Field Configs */
            
            /* Adding Route Tiles */
            if(includeRouteTiles) {
                List < nFORCE__Route_Tile__c > new_route_tiles = new List < nFORCE__Route_Tile__c > ();
                nFORCE__Route_Tile__c temp_route_tile;
                for (nFORCE__Route_Tile__c rt: source_route_tiles) {
                    temp_route_tile = rt.clone(false, false, false, false);
                    temp_route_tile.nFORCE__lookupKey__c = generateRandomString(4);
                    new_route_tiles.add(temp_route_tile);
                }
                handleUniqueFields(new_route_tiles, 'nFORCE__Route_Tile__c');
                insert new_route_tiles;
                
                for (nFORCE__Route_Tile__c rt: new_route_tiles) {
                    for (Id route_id: route_apps_map.keySet()) { //correcting the Route Tiles, so they point to new routes...
                        if (rt.nFORCE__Route__c == route_id) {
                            for (nFORCE__Route__c nr: new_routes) {
                                //get new App value related to source route record Id
                                if (nr.nFORCE__App__c == route_apps_map.get(route_id)) {
                                    rt.nFORCE__Route__c = nr.Id;
                                }
                            }
                        }
                    }
                }
                update new_route_tiles;
            }
            /* End Route Tiles */
            
            /* Adding Route Terms */
            if(includeRouteTerms) {
                List < nFORCE__Route_Terms__c > new_route_terms = new List < nFORCE__Route_Terms__c > ();
                nFORCE__Route_Terms__c temp_route_terms;
                for (nFORCE__Route_Terms__c rt: source_route_terms) {
                    temp_route_terms = rt.clone(false, false, false, false);
                    temp_route_terms.nFORCE__lookupKey__c = generateRandomString(4);
                    new_route_terms.add(temp_route_terms);
                }
                handleUniqueFields(new_route_terms, 'nFORCE__Route_Terms__c');
                insert new_route_terms;
                
                for (nFORCE__Route_Terms__c rt: new_route_terms) {
                    for (Id route_id: route_apps_map.keySet()) { //correcting the Route Terms, so they point to new routes...
                        if (rt.nFORCE__Route__c == route_id) {
                            for (nFORCE__Route__c nr: new_routes) {
                                //get new App value related to source route record Id
                                if (nr.nFORCE__App__c == route_apps_map.get(route_id)) {
                                    rt.nFORCE__Route__c = nr.Id;
                                }
                            }
                        }
                    }
                }
                update new_route_terms;
            }
            /* End Route Terms */

            //using screen_section_map that was populated above when new screen sections were originally created
            Map < Id, String > section_config_map = new Map < Id, String > ();
            List < nFORCE__Section_Configuration__c > new_section_configs = new List < nFORCE__Section_Configuration__c > ();
            nFORCE__Section_Configuration__c temp_section_config;
            for (nFORCE__Section_Configuration__c sc: source_section_configs) {
                temp_section_config = sc.clone(false, false, false, false);
                temp_section_config.nFORCE__lookupKey__c = generateRandomString(4);
                new_section_configs.add(temp_section_config);

                //screen section map?
                section_config_map.put(sc.Id, temp_section_config.nFORCE__lookupKey__c);
            }

            for (nFORCE__Section_Configuration__c sc: new_section_configs) { //set correct Screen Section on section config
                for (Id screen_section_id: screen_section_map.keySet()) {
                    if (sc.nFORCE__Screen_Section__c == screen_section_id) {
                        for (nFORCE__Screen_Section__c ss: new_screen_sections) {
                            if (ss.nFORCE__lookupKey__c == screen_section_map.get(screen_section_id)) {
                                sc.nFORCE__Screen_Section__c = ss.Id;
                            }
                        }
                    }
                }
            }
            System.debug('***L***');
            handleUniqueFields(new_section_configs, 'nFORCE__Section_Configuration__c');
            insert new_section_configs;

            //update section configs to use correct hierarchy + layouts
            for (nFORCE__Section_Configuration__c sc: new_section_configs) {
                for (Id section_config_id: section_config_map.keySet()) {
                    if (sc.nFORCE__Parent_Configuration__c == section_config_id) {
                        for (nFORCE__Section_Configuration__c sc2: new_section_configs) {
                            if (sc2.nFORCE__lookupKey__c == section_config_map.get(section_config_id)) {
                                sc.nFORCE__Parent_Configuration__c = sc2.Id;
                            }
                        }
                    }
                }
            }

            //insert layouts in preparation to attach to new section configs
            Map < Id, String > layout_map = new Map < Id, String > ();
            List < nFORCE__Layout__c > new_layouts = new List < nFORCE__Layout__c > ();
            nFORCE__Layout__c temp_layout;
            for (nFORCE__Layout__c ly: source_layouts) {
                temp_layout = ly.clone(false, false, false, false);
                temp_layout.nFORCE__lookupKey__c = generateRandomString(4);
                new_layouts.add(temp_layout);

                layout_map.put(ly.Id, temp_layout.nFORCE__lookupKey__c);
            }
            System.debug('***M***');
            handleUniqueFields(new_layouts, 'nFORCE__Layout__c');
            insert new_layouts;

            for (nFORCE__Section_Configuration__c sc: new_section_configs) { //update Routes to use correct new Screen
                for (Id layout_id: layout_map.keySet()) {
                    if (sc.nFORCE__Layout__c == layout_id) {
                        for (nFORCE__Layout__c ly: new_layouts) {
                            if (ly.nFORCE__lookupKey__c == layout_map.get(layout_id)) {
                                sc.nFORCE__Layout__c = ly.Id;
                            }
                        }
                    }
                }
            }
            System.debug('***N***');
            update new_section_configs;
        }
    }
    
    /*** CHECK LOOKUPKEYS ***/
    public Boolean checkLookupkeys( List < nFORCE__Route_Group__c > rtgrps, List < nFORCE__Route__c > rts, List < nFORCE__Field_Configuration__c > fldcfgs,
        List < nFORCE__Route_Tile__c > rttls, List < nFORCE__Route_Terms__c > rttms, List < nFORCE__Screen__c > scrns, List < nFORCE__Screen_Section__c > scrnsctns, 
        List < nFORCE__View__c > vws, List < nFORCE__Section_Configuration__c > scncfgs, List < nFORCE__Layout__c > lyts) {
        Boolean keyMissing = false;
        for (nFORCE__Route__c rt: rts) {
            if (rt.nFORCE__lookupKey__c == '' || rt.nFORCE__lookupKey__c == null) {
                lookupKeyMissingObject = 'nFORCE__Route__c';
                keyMissing = true;
            }
        }
        for (nFORCE__Route_Group__c rtgrp: rtgrps) {
            if (rtgrp.nFORCE__lookupKey__c == '' || rtgrp.nFORCE__lookupKey__c == null) {
                lookupKeyMissingObject = 'nFORCE__Route_Group__c';
                keyMissing = true;
            }
        }
        if(includeFieldConfigs) {
            for (nFORCE__Field_Configuration__c fldcfg: fldcfgs) {
                if (fldcfg.nFORCE__lookupKey__c == '' || fldcfg.nFORCE__lookupKey__c == null) {
                    lookupKeyMissingObject = 'nFORCE__Field_Configuration__c';
                    keyMissing = true;
                }
            }
        }
        
        if(includeRouteTiles) {
            for (nFORCE__Route_Tile__c rttl: rttls) {
                if (rttl.nFORCE__lookupKey__c == '' || rttl.nFORCE__lookupKey__c == null) {
                    lookupKeyMissingObject = 'nFORCE__Route_Tile__c';
                    keyMissing = true;
                }
            }
        }
        if(includeRouteTerms) {
            for (nFORCE__Route_Terms__c rttm: rttms) {
                if (rttm.nFORCE__lookupKey__c == '' || rttm.nFORCE__lookupKey__c == null) {
                    lookupKeyMissingObject = 'nFORCE__Route_Terms__c';
                    keyMissing = true;
                }
            }
        }
        for (nFORCE__Screen__c scrn: scrns) {
            if (scrn.nFORCE__lookupKey__c == '' || scrn.nFORCE__lookupKey__c == null) {
                lookupKeyMissingObject = 'nFORCE__Screen__c';
                keyMissing = true;
            }
        }
        for (nFORCE__Screen_Section__c scrnsct: scrnsctns) {
            if (scrnsct.nFORCE__lookupKey__c == '' || scrnsct.nFORCE__lookupKey__c == null) {
                lookupKeyMissingObject = 'nFORCE__Screen_Section__c';
                keyMissing = true;
            }
        }
        for (nFORCE__View__c vw: vws) {
            if (vw.nFORCE__lookupKey__c == '' || vw.nFORCE__lookupKey__c == null) {
                lookupKeyMissingObject = 'nFORCE__View__c';
                keyMissing = true;
            }
        }
        for (nFORCE__Layout__c lyt: lyts) {
            if (lyt.nFORCE__lookupKey__c == '' || lyt.nFORCE__lookupKey__c == null) {
                lookupKeyMissingObject = 'nFORCE__Layout__c';
                keyMissing = true;
            }
        }

        if (keyMissing) {
            return false;
        } else {
            return true;
        }
    }
    
    /* RETURN DYNAMIC SOQL QUERY FOR OBJECT */
    public static string getCreatableFieldsSOQL(String objectName, String whereClause) {
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
                selectFields.add(fd.getName());
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
    
    /*** METHOD TO SIMPLIFY A STRING -- LOWERCASE AND NO SPACES ***/
    public String simplifyName(String target) {
        String newName = target.toLowerCase();
        newName = newName.replace(' ', '-');
        newName = newName.replaceAll('[^a-zA-Z0-9\\s+]', '-');
        return newName;
    }
    
    public static void handleUniqueFields(List<SObject> lst, String objectName) {
        Map < String, Schema.SObjectField > fMap = Schema.getGlobalDescribe().get(objectName.toLowerCase()).getDescribe().Fields.getMap();
        list < string > selectFields = new list < string > ();
        if (fMap != null) {
            for (Schema.SObjectField ft: fMap.values()) { // loop through all field tokens (ft)
                Schema.DescribeFieldResult fd = ft.getDescribe(); // describe each field (fd)
                if(fd.IsUnique() && !EXPECTED_UNIQUE_FIELDS.contains(fd.getName())) {
                    for(SObject s: lst) {
                        s.put(fd.getName(), generateRandomString(4));
                    }
                }
            }        
        }
    }

    /*** METHOD TO GENERATE A RANDOM STRING TO SERVE AS LOOKUPKEYS ***/
    public static String generateRandomString(Integer len) {
        final String chars = '0123456789';
        String randStr = '';
        while (randStr.length() < len) {
            Integer idx = Math.mod(Math.abs(Crypto.getRandomInteger()), chars.length());
            randStr += chars.substring(idx, idx + 1);
        }
        randStr = randStr + Datetime.now().getTime();
        return randStr;
    }

    public PageReference prRedirect() {
        try {
            String testInput = newRouteAppValue.deleteWhiteSpace();

            if (testInput.length() > 0) {
                sp = Database.setSavepoint();
                doRouteDeepClone();

                if (hasLookupKeys) {
                    PageReference route_page = new ApexPages.StandardController(new_route).view();
                    route_page.setRedirect(true);
                    System.debug('**REDIRECT_TEST**: ' + route_page);
                    return route_page;
                } else {
                    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Missing lookupKeys found on the following object: ' + lookupKeyMissingObject));
                    return null;
                }
            } else {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Please enter a new Route App value.'));
                return null;
            }
        } catch (Exception e) {
            Database.rollback(sp);
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Clone error:  ' + e));
            return null;
        }
    }

    transient private static final String ID_FIELD = 'id';
    private static final List< String > EXPECTED_UNIQUE_FIELDS = new List < String > { 'nFORCE__lookupKey__c', 'nFORCE__App__c' };
}