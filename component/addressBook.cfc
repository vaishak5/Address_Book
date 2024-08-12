<cfcomponent>
    <!---Email Checking --->
    <cffunction name="isEmailUnique" access="remote" returnFormat="plain">
        <cfargument name="emailId" required="true">
        <cfset var emailExists = false>
        <!--- Checking EMAIL ID in register table --->
        
        <cfquery name="checkRegister" datasource="DESKTOP-8VHOQ47">
            SELECT 1 
            FROM register 
            WHERE emailId = <cfqueryparam value="#arguments.emailId#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        <cfif checkRegister.recordCount>
            <cfset emailExists = true>
        </cfif>
        <!--- Checking EMAIL ID in contactDetails table --->
        
        <cfif not emailExists>
            <cfquery name="checkContactDetails" datasource="DESKTOP-8VHOQ47">
                SELECT 1 
                FROM contactDetails 
                WHERE emailID = <cfqueryparam value="#arguments.emailId#" cfsqltype="CF_SQL_VARCHAR">
            </cfquery>
            <cfif checkContactDetails.recordCount>
                <cfset emailExists = true>
            </cfif>
        </cfif>
        <cfreturn emailExists>
    </cffunction>
    
    <!---Sign Up--->
    <cffunction name="signUpload" access="remote" returnFormat="plain">
        <cfargument  name="fullName" required="true">
        <cfargument  name="emailId" required="true">
        <cfargument  name="userName" required="true">
        <cfargument  name="password" required="true">
        <cfargument  name="myfile" required="true">
        <cfset local.imgPath = ExpandPath("../assets/")>
        <cfset local.img = "">
        <cffile action = "upload"  filefield="myfile" destination="#local.imgPath#" nameconflict="makeunique" >
        <cfset local.img =  cffile.serverFile>
        <cfset local.hashedPassword = Hash(arguments.password, "SHA-256")>
        <cfset var emailUnique = isEmailUnique(arguments.emailId)>
        <cfif not emailUnique>
            <cfquery name="insertValues"  datasource="DESKTOP-8VHOQ47">
                INSERT INTO register (fullName,  emailId, password, imgFile, userName)
                VALUES (
                    <cfqueryparam value="#arguments.fullName#" cfsqltype="CF_SQL_VARCHAR">,
                    <cfqueryparam value="#arguments.emailId#" cfsqltype="CF_SQL_VARCHAR">,
                    <cfqueryparam value="#local.hashedPassword#" cfsqltype="CF_SQL_VARCHAR">,
                    <cfqueryparam value="#local.img#" cfsqltype="CF_SQL_VARCHAR">,
                    <cfqueryparam value="#arguments.userName#" cfsqltype="CF_SQL_VARCHAR">
                )
            </cfquery>  
            <cfreturn "true">
            <cfelse>
                <cfreturn "false">
        </cfif>
    </cffunction> 

    <!---LOG IN--->
    <cffunction name="checkLogin" access="remote" returnFormat="plain">
        <cfargument name="emailId" required="true">
        <cfargument name="password" required="true">
        <cfset local.hashPassword=Hash(arguments.password,"SHA-256")>
        <cfquery name="checkuserId" datasource="DESKTOP-8VHOQ47">
            SELECT userId,fullName,imgFile FROM register
            WHERE emailId=<cfqueryparam value="#arguments.emailId#" cfsqltype="CF_SQL_VARCHAR">
            AND password=<cfqueryparam value="#local.hashPassword#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        <cfif checkuserId.recordCount>
            <cfset session.userId=checkuserId.userId>
            <cfset session.fullName=checkuserId.fullName>
            <cfset session.imgFile = checkuserId.imgFile>
            <cfset session.login=true>
            <cfreturn "true">
        <cfelse>
            <cfset session.login=false>
            <cfreturn "false">
        </cfif>
    </cffunction>

    <!---Log out--->
    <cffunction  name="doLogout" returntype="any" access="remote">
        <cfset session.login=false>
        <cflocation url="../loginPage.cfm">
    </cffunction>

    <!---Adding new datas to the field--->
    <cffunction name="dataUpload" access="remote" returnFormat="plain">
    <cfargument name="hiddenContactId" required="true"> 
    <cfargument name="title" required="true"> 
    <cfargument name="firstName" required="true">
    <cfargument name="lastName" required="true">
    <cfargument name="gender" required="true">
    <cfargument name="dob" required="true">
    <cfargument name="address" required="true">
    <cfargument name="street" required="true">
    <cfargument name="phoneNumber" required="true">
    <cfargument name="email" required="true">
    <cfargument name="pincode" required="true">
    <cfset var emailUnique = isEmailUnique(arguments.email)>
    <cfset var local.imgPath = ExpandPath("../assets/")>
    <cfset var local.img = "">
    <cfif arguments.hiddenContactId GT 0>
        <!--- Update existing record --->
        <cfif not emailUnique>
            <cffile action="upload" filefield="profile" destination="#local.imgPath#" nameconflict="makeunique">
            <cfset local.img = cffile.serverFile>
            <cfquery name="updateQuery" datasource="DESKTOP-8VHOQ47">
                UPDATE contactDetails 
                SET firstName = <cfqueryparam value="#arguments.firstName#" cfsqltype="cf_sql_varchar">,
                    larstName = <cfqueryparam value="#arguments.lastName#" cfsqltype="cf_sql_varchar">,
                    gender = <cfqueryparam value="#arguments.gender#" cfsqltype="cf_sql_varchar">,
                    dob = <cfqueryparam value="#arguments.dob#" cfsqltype="cf_sql_varchar">,
                    addressField = <cfqueryparam value="#arguments.address#" cfsqltype="cf_sql_varchar">,
                    street = <cfqueryparam value="#arguments.street#" cfsqltype="cf_sql_varchar">,
                    phoneNumber = <cfqueryparam value="#arguments.phoneNumber#" cfsqltype="cf_sql_varchar">,
                    emailID = <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">,
                    pincode = <cfqueryparam value="#arguments.pincode#" cfsqltype="cf_sql_varchar">,
                    profilePic = <cfqueryparam value="#local.img#" cfsqltype="cf_sql_varchar">
                WHERE contactId = <cfqueryparam value="#arguments.hiddenContactId#" cfsqltype="cf_sql_integer">
            </cfquery>
            <cfreturn true>
        <cfelse>
            <cfreturn false>
        </cfif>
    <cfelse>
        <!--- Insert new record --->
        <cfif not emailUnique>
            <cffile action="upload" filefield="profile" destination="#local.imgPath#" nameconflict="makeunique">
            <cfset local.img = cffile.serverFile>
            <cfquery name="insertQuery" datasource="DESKTOP-8VHOQ47">
                INSERT INTO contactDetails (title, firstName, larstName, gender, dob, profilePic, addressField, street, phoneNumber, emailID, pincode, userId)
                VALUES (
                    <cfqueryparam value="#arguments.title#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.firstName#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.lastName#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.gender#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.dob#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#local.img#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.address#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.street#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.phoneNumber#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.pincode#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#session.userId#" cfsqltype="cf_sql_varchar">
                )
            </cfquery>

            <cfreturn true>
        <cfelse>
            <cfreturn false>
        </cfif>
    </cfif>
</cffunction>


    <!---Deleting Particular Row--->
    <cffunction name="deleteDatas" access="remote" returnFormat="plain">
        <cfargument name="contactId" required="true">
        <cfquery name="deleteQuery" datasource="DESKTOP-8VHOQ47">
            SELECT contactId FROM contactDetails 
            WHERE contactId = <cfqueryparam value="#arguments.contactId#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        <cfif deleteQuery.recordCount>
            <cfquery name="deleteItems" datasource="DESKTOP-8VHOQ47">
                delete from contactDetails
                WHERE contactId = <cfqueryparam value="#arguments.contactId#" cfsqltype="CF_SQL_VARCHAR">
            </cfquery>
            <cfreturn true>
        <cfelse>
            <cfreturn false>
        </cfif>
    </cffunction>

    <!---Viewing Particular Row(View Datas)--->
    <cffunction name="viewDatas" access="remote" returnformat="plain">
    <cfargument name="contactId" type="numeric" required="true">
    <cfquery name="contactSet" datasource="DESKTOP-8VHOQ47">
        SELECT *
        FROM contactDetails
        WHERE contactId = <cfqueryparam value="#arguments.contactId#" cfsqltype="cf_sql_integer">
    </cfquery>
    <cfset local.contact = {}>
    <cfif contactSet.recordCount GT 0>
        <cfset local.contact.fullName = contactSet.title & " " & contactSet.firstName & " " & contactSet.larstName>
        <cfset local.contact.gender = contactSet.gender>
        <cfset local.contact.dob = contactSet.dob>
        <cfset local.contact.fullAddress = contactSet.addressField & ","&contactSet.street>
        <cfset local.contact.phoneNumber=contactSet.phoneNumber>
        <cfset local.contact.email=contactSet.emailID>
        <cfset local.contact.pincode=contactSet.pincode>
        <cfset local.contact.profilePic=contactSet.profilePic>
    </cfif>
    <cfset serializedContact = serializeJSON(local.contact)>
    <cfreturn serializedContact>
</cffunction>

<!---Edit Datas--->
    <cffunction name="selectDatas" access="remote" returnformat="PLAIN">
        <cfargument name="contactId" required="true">
        <cfquery name="selectInputs" datasource="DESKTOP-8VHOQ47">
            SELECT *
            FROM contactDetails 
            WHERE contactId = <cfqueryparam value="#arguments.contactId#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfset  local.result = {}>
        <cfif selectInputs.recordCount>
            <cfset local.result['contactId'] = selectInputs.contactId>
            <cfset local.result['title'] = selectInputs.title>
            <cfset local.result['firstName'] = selectInputs.firstName>
            <cfset local.result['lastName'] = selectInputs.larstName> 
            <cfset local.result['gender'] = selectInputs.gender>
            <cfset local.result["dob"] = selectInputs.dob>
            <cfset local.result['address'] = selectInputs.addressField>
            <cfset local.result['street']= selectInputs.street>
            <cfset local.result['phoneNumber']= selectInputs.phoneNumber>
            <cfset local.result['email']=selectInputs.emailID>
            <cfset local.result['pincode']=selectInputs.pincode>
            <cfset local.result['myFile'] = selectInputs.profilePic>
        </cfif>
        <cfset serializedContact = serializeJSON(local.result)>
    <cfreturn serializedContact>
</cffunction>
</cfcomponent>