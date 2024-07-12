<cfcomponent>    
    <cfset this.applicationTimeout = createTimeSpan(0, 0, 0, 60)> 
    <cfset this.sessionManagement = true> 
    <cfset this.sessionTimeout = createTimeSpan(0, 2, 0, 0)> 
    <cfset this.datasource = "DESKTOP-8VHOQ47">
    <cffunction name="onApplicationStart" returnType="void">
    </cffunction>
    <cffunction name="onSessionStart" returnType="boolean" output="false">
        <cfset session.login=false>
        <cfset session.userId = "">
        <cfreturn true>
    </cffunction>  
</cfcomponent>