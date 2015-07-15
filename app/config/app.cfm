<cfscript>
/*
	Place settings that should go in the Application.cfc's "this" scope here.

	Examples:
	this.name = "MyAppName";
	this.sessionTimeout = CreateTimeSpan(0,0,5,0);
*/

// Setup environment variables.
server.ENV = CreateObject("java", "java.lang.System").getenv();

// Setup data source.
this.DataSources["web"] = {
    type=server.ENV.DB_TYPE,
    host=server.ENV.DB_HOST,
    port=server.ENV.DB_PORT,
    database=server.ENV.DB_DATABASE,
    username=server.ENV.DB_USERNAME,
    password=server.ENV.DB_PASSWORD
};

</cfscript>