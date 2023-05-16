*** Settings ***
Documentation  Test cases for TRN Database
Library  DatabaseLibrary

Resource  ../Resources/Variables/ConnectionVariables.robot
Resource  ../Resources/Keywords/DatabaseKeywords.robot
Resource  ../Resources/TestData/EmployeesTestData.robot
Resource  ../Resources/TestData/LocationsTestData.robot
Resource  ../Resources/TestData/JobsTestData.robot

Suite Setup  connect to db  ${DriverName}  ${DbServer}  ${DbName}  ${Encrypt}  ${DbUser}  ${DbPassword}
Suite Teardown  disconnect from database


*** Test Cases ***
Check employees count
    ${output} =  query  ${EmployeesCountScript}
    Log  Query result:
    Log Many  ${output}
    should be equal as numbers  ${output}[0][0]   ${EmployeesCountExpectedValue}

Check first employee
    ${output} =  query  ${EmployeesOldestOneScript}
    Log  Query result:
    Log Many  ${output}
    should be equal as numbers  ${output}[0][0]   ${EmployeesOldestOneExpectedValue}[0]
    should be equal as strings  ${output}[0][1]   ${EmployeesOldestOneExpectedValue}[1]
    should be equal as strings  ${output}[0][2]   ${EmployeesOldestOneExpectedValue}[2]
    should be equal as strings  ${output}[0][3]   ${EmployeesOldestOneExpectedValue}[3]
    should be equal as numbers  ${output}[0][4]   ${EmployeesOldestOneExpectedValue}[4]


Check most popular location
    ${output} =  query  ${LocationMostPopularScript}
    Log  Query result:
    Log Many  ${output}
    should be equal as strings  ${output}[0][0]   ${LocationMostPopularExpectedValue}[0]
    should be equal as numbers  ${output}[0][1]   ${LocationMostPopularExpectedValue}[1]

Check locations with null postal code
    ${output} =  query  ${LocationWithNullsScript}
    Log  Query result:
    Log Many  ${output}
    should be equal as strings  ${output}[0][0]   ${LocationWithNullsExpectedValue}[0]
    should be equal as strings  ${output}[0][1]   ${LocationWithNullsExpectedValue}[1]

Check cities from most popular location
    ${output} =  query  ${LocationTopCountryScript}
    Log  Query result:
    Log Many  ${output}
    should be equal as strings  ${output}[0][0]   ${LocationTopCountryExpectedValue}[0]
    should be equal as strings  ${output}[1][0]   ${LocationTopCountryExpectedValue}[1]
    should be equal as strings  ${output}[2][0]   ${LocationTopCountryExpectedValue}[2]


Check max average and min salary
    ${output1} =  query  ${JobsMaxScript}
    Log  Query result:
    Log Many  ${output1}
    should be equal as strings  ${output1}[0][0]   ${JobsMaxExpectedValue}[0]
    should be equal as strings  ${output1}[0][1]   ${JobsMaxExpectedValue}[1]
    should be equal as numbers  ${output1}[0][2]   ${JobsMaxExpectedValue}[2]

    ${output2} =  query  ${JobsAverageScript}
    Log  Query result:
    Log Many  ${output2}
    should be equal as strings  ${output2}[0][0]   ${JobsAverageExpectedValue}[0]
    should be equal as strings  ${output2}[0][1]   ${JobsAverageExpectedValue}[1]
    should be equal as numbers  ${output2}[0][2]   ${JobsAverageExpectedValue}[2]

    ${output3} =  query  ${JobsMinScript}
    Log  Query result:
    Log Many  ${output3}
    should be equal as strings  ${output3}[0][0]   ${JobsMinExpectedValue}[0]
    should be equal as strings  ${output3}[0][1]   ${JobsMinExpectedValue}[1]
    should be equal as numbers  ${output3}[0][2]   ${JobsMinExpectedValue}[2]


Check most popular position in company
    ${output} =  query  ${JobsMostPopularPositionScript}
    Log  Query result:
    Log Many  ${output}
    should be equal as numbers  ${output}[0][0]   ${JobsMostPopularPositionExpectedValue}[0]
    should be equal as strings  ${output}[0][1]   ${JobsMostPopularPositionExpectedValue}[1]
    should be equal as numbers  ${output}[0][2]   ${JobsMostPopularPositionExpectedValue}[2]