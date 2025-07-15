component {
    this.name = "AgricultureEMS";
    this.applicationTimeout = createTimeSpan(0,2,0,0);
    this.sessionManagement = true;
    this.sessionTimeout = createTimeSpan(0,0,30,0);
    this.datasource = "agricultureEMS";
    this.mappings["/components"] = getDirectoryFromPath(getCurrentTemplatePath()) & "components";
    
    function onApplicationStart() {
        application.started = now();
        return true;
    }
    
    function onSessionStart() {
        session.started = now();
    }
    
    function onRequestStart(required string targetPage) {
        if(structKeyExists(url, "reload")) {
            applicationStop();
            location(url=cgi.script_name, addToken=false);
        }
    }
    
    function onError(any exception, string eventName) {
        writeDump(arguments.exception);
    }
}
