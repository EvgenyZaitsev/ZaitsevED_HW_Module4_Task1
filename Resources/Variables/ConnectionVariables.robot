*** Variables ***

${DbUser}  TestLogin
${DbPassword}  12345
${DbName}  TRN
${DbServer}  localhost\\SQLEXPRESS
${DriverName}  {ODBC Driver 18 for SQL Server}
${Encrypt}  no
${ConnectionString}  'DRIVER={};SERVER={};DATABASE={};ENCRYPT={};UID={};PWD={}'