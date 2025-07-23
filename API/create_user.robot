*** Settings ***
Library    RPA.Excel.Files
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://reqres.in/
${ENDPOINT}    api/users
${USER_DATA_FILE}    excel/user_data.xlsx

*** Test Cases ***
Create User From Excel Data
    [Documentation]    Create a new user from Excel data and send it to the API
    ${data}=    Open User Data File    ${USER_DATA_FILE}
    ${name}    ${job}=    Get First User Data    ${data}
    ${response}=    Create User via API    ${name}    ${job}
    Verify the user creation via API    ${response}    ${name}    ${job}

*** Keywords ***
Open User Data File
    [Documentation]    Open the Excel file containing user data
    [Arguments]    ${USER_DATA_FILE}=excel/user_data.xlsx
    Open Workbook    ${USER_DATA_FILE}
    ${data}=    Read Worksheet    header=True
    RETURN    ${data}

Get First User Data
    [Documentation]    Extract the first user's name and job from the data
    [Arguments]    ${data}
    ${name}=    Set Variable    ${data}[0][name]
    ${job}=     Set Variable    ${data}[0][job]
    RETURN    ${name}    ${job}

Create User via API
    [Arguments]    ${name}    ${job}
    &{user}=    Create Dictionary    name=${name}    job=${job}
    ${headers}=    Create Dictionary    x-api-key=reqres-free-v1    Content-Type=application/json
    ${response}=    POST    ${BASE_URL}${ENDPOINT}    json=${user}    headers=${headers}
    Log    ${response.json()}
    RETURN    ${response}

Verify the user creation via API
    [Arguments]    ${response}    ${expected_name}    ${expected_job}
    Should Be Equal As Integers    ${response.status_code}    201
    Should Be Equal    ${response.json()['name']}    ${expected_name}
    Should Be Equal    ${response.json()['job']}     ${expected_job}


