*** Settings ***
Library  String
Library  DatabaseLibrary
Library  ../Libraries/StringHelper.py
Resource  ../Variables/ConnectionVariables.robot


*** Keywords ***

create connection string
    [arguments]  ${DriverName}  ${DbServer}  ${DbName}  ${Encrypt}  ${DbUser}  ${DbPassword}
    ${connection_string} =  Format string  ${ConnectionString}  ${DriverName}  ${DbServer}  ${DbName}  ${Encrypt}  ${DbUser}  ${DbPassword}
    Log  Creating connection string ${connection_string}
    [return]  ${connection_string}

connect to db
    [arguments]  ${DriverName}  ${DbServer}  ${DbName}  ${Encrypt}  ${DbUser}  ${DbPassword}
    ${connection_string} =  create connection string  ${DriverName}  ${DbServer}  ${DbName}  ${Encrypt}  ${DbUser}  ${DbPassword}
    Log  Connecting to database with connection string ${connection_string}
    connect to database using custom params  pyodbc  ${connection_string}

execute script
    [arguments]  ${Script}
    #${compiled_script} =  custom string format  ${Script}  ${ScriptParams}
    #Log  Executing script ${compiled_script}
    ${output} =  query  ${Script}
    Log  Query result:
    Log Many  ${output}
    [return]  ${output}