<cfcomponent>
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
        <cfquery name="checkEmail" datasource="DESKTOP-8VHOQ47">
            SELECT * FROM register 
            WHERE emailId=<cfqueryparam value="#arguments.emailId#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        <cfif checkEmail.recordCount>
            <cfreturn "false">
        <cfelse>
            <cfset local.hashedPassword = Hash(arguments.password, "SHA-256")>
            <cfset local.dummy = "518FFED71D49E52E0E968FF881C0B19B535E40973B13455E3F2E25336F912D41">
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
        <cfif arguments.hiddenContactId GT 0>
            <cfset local.imgPath = ExpandPath("../assets/")>
            <cfset local.img = "">
            <cffile action="upload" filefield="profile" destination="#local.imgPath#" nameconflict="makeunique">
            <cfset local.img =  cffile.serverFile>
            <cfquery name="selectInputs" datasource="DESKTOP-8VHOQ47" result ="editDatassResult">
                UPDATE contactDetails 
                SET firstName=<cfqueryparam value="#arguments.firstName#" cfsqltype="cf_sql_varchar">,
                    larstName=<cfqueryparam value="#arguments.lastName#" cfsqltype="cf_sql_varchar">,
                    gender=<cfqueryparam value="#arguments.gender#" cfsqltype="cf_sql_varchar">,
                    dob=<cfqueryparam value="#arguments.dob#" cfsqltype="cf_sql_varchar">,
                    addressField=<cfqueryparam value="#arguments.address#" cfsqltype="cf_sql_varchar">,
                    street=<cfqueryparam value="#arguments.street#" cfsqltype="cf_sql_varchar">,
                    phoneNumber=<cfqueryparam value="#arguments.phoneNumber#" cfsqltype="cf_sql_varchar">,
                    emailID=<cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">,
                    pincode=<cfqueryparam value="#arguments.pincode#" cfsqltype="cf_sql_varchar">,
                    profilePic=<cfqueryparam value="#local.img#" cfsqltype="CF_SQL_VARCHAR">
                WHERE contactId = <cfqueryparam value="#arguments.hiddenContactId#" cfsqltype="cf_sql_integer">
            </cfquery>
            <cfreturn "true">
        <cfelse>
            <cfquery name="checkEmail" datasource="DESKTOP-8VHOQ47">
                SELECT * FROM contactDetails 
                WHERE emailID=<cfqueryparam value="#arguments.email#" cfsqltype="CF_SQL_VARCHAR">
            </cfquery>
            <cfif checkEmail.recordCount>
                 <cfreturn "false">
            <cfelse>
                <cfset local.imgPath = ExpandPath("../assets/")>
                <cfset local.img = "">
                <cffile action="upload" filefield="profile" destination="#local.imgPath#" nameconflict="makeunique">
                <cfset local.img =  cffile.serverFile>
                <cfquery name="datasInserting" datasource="DESKTOP-8VHOQ47">
                    INSERT INTO contactDetails (title, firstName, larstName, gender, dob, profilePic, addressField, street, phoneNumber, emailID, pincode,userId)
                    VALUES (
                        <cfqueryparam value="#arguments.title#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#arguments.firstName#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#arguments.lastName#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#arguments.gender#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#arguments.dob#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#local.img#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#arguments.address#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#arguments.street#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#arguments.phoneNumber#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#arguments.email#" cfsqltype="CF_SQL_VARCHAR">,
                        <cfqueryparam value="#arguments.pincode#" cfsqltype="CF_SQL_VARCHAR">,
                       <cfqueryparam value="#session.userId#" cfsqltype="CF_SQL_VARCHAR">
                    )
                </cfquery>
            </cfif>
            <cfreturn "true">
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