<cfcomponent>
    <!---Sign Up--->
    
    <cffunction name="signUpload" access="remote" returnFormat="plain">
        <cfargument  name="fullName" required="true">
        <cfargument  name="emailId" required="true">
        <cfargument  name="userName" required="true">
        <cfargument  name="password" required="true">
        <cfargument  name="confirmPassword" required="true">
        <cfquery name="checkEmail" datasource="DESKTOP-8VHOQ47">
            SELECT 1 FROM register 
            WHERE emailId=<cfqueryparam value="#arguments.emailId#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        <cfif checkEmail.recordCount>
            <cfreturn false>
        <cfelse>
            <cfquery name="insertValues" datasource="DESKTOP-8VHOQ47">
                INSERT INTO register (fullName, emailId, userName, userPassword,confirmPassword)
                VALUES (
                    <cfqueryparam value="#arguments.fullName#" cfsqltype="CF_SQL_VARCHAR">,
                    <cfqueryparam value="#arguments.emailId#" cfsqltype="CF_SQL_VARCHAR">
                    <cfqueryparam value="#arguments.userName#" cfsqltype="CF_SQL_VARCHAR">,
                    <cfqueryparam value="#arguments.password#" cfsqltype="CF_SQL_VARCHAR">,
                    <cfqueryparam value="#arguments.confirmPassword#" cfsqltype="CF_SQL_VARCHAR">
                )
            </cfquery>
            <cfreturn true>
        </cfif>
    </cffunction>
</cfcomponent>