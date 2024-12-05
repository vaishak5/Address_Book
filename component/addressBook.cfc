<cfcomponent>
    <!---Sign Up--->
    
    <cffunction name="signUpload" access="remote" returnFormat="plain">
        <cfargument  name="fullName" required="true">
        <cfargument  name="emailId" required="true">
        <cfargument  name="userName" required="true">
        <cfargument  name="password" required="true">
        <cfquery name="checkEmail" datasource="DESKTOP-8VHOQ47">
            SELECT * FROM register 
            WHERE emailId=<cfqueryparam value="#arguments.emailId#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        <cfif checkEmail.recordCount>
            <cfreturn "false">
        <cfelse>
            <cfquery name="insertValues" result ="aFK" datasource="DESKTOP-8VHOQ47">
                INSERT INTO register (fullName, emailId, userName, password)
                VALUES (
                    <cfqueryparam value="#arguments.fullName#" cfsqltype="CF_SQL_VARCHAR">,
                    <cfqueryparam value="#arguments.emailId#" cfsqltype="CF_SQL_VARCHAR">,
                    <cfqueryparam value="#arguments.userName#" cfsqltype="CF_SQL_VARCHAR">,
                    <cfqueryparam value="#arguments.password#" cfsqltype="CF_SQL_VARCHAR">
                )
            </cfquery>  
            <cfreturn "true">
        </cfif>
    </cffunction>

    <!---LOG IN--->
    <cffunction name="checkLogin" access="remote" returnFormat="plain">
        <cfargument name="emailId" required="true">
        <cfargument name="password" required="true">
        <cfquery name="checkuserId" datasource="DESKTOP-8VHOQ47">
            SELECT userId FROM register
            WHERE emailId=<cfqueryparam value="#arguments.emailId#" cfsqltype="CF_SQL_VARCHAR">
            AND password=<cfqueryparam value="#arguments.password#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        <cfif checkuserId.recordCount>
            <!---<cfset session.role=checkRole.userRole>
            <cfset session.login=true>--->
            <cfreturn "true">
        <cfelse>
            <!---<cfset session.login=false>--->
            <cfreturn "false">
        </cfif>
    </cffunction>
</cfcomponent>