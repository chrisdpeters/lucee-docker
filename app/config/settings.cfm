<cfscript>

// Reload password
set(reloadPassword=server.ENV.WHEELS_RELOAD_PW);

// Data source and ORM
set(dataSourceName="web");
set(useExpandedColumnAliases=true);

// SMTP Server
smtpArgs = {};

for (setting in server.ENV) {
  setting = Trim(setting);
  value = Trim(server.ENV[setting]);

  if (setting.startsWith("SMTP_") && Len(value)) {
    functionKey = Replace(setting, "SMTP_", "");
    smtpArgs[functionKey] = value;
  }
}

if (StructCount(smtpArgs)) {
  set(functionName="sendEmail", argumentCollection=smtpArgs);
}

</cfscript>
