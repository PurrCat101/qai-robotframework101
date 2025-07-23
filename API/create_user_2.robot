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
    Get All Users Data And Create    ${data}

*** Keywords ***
Open User Data File
    [Documentation]    Open the Excel file containing user data
    [Arguments]    ${USER_DATA_FILE}=excel/user_data.xlsx
    Open Workbook    ${USER_DATA_FILE}
    ${data}=    Read Worksheet    header=True
    RETURN    ${data}

Get All Users Data And Create
    [Documentation]    Loop through all users in the data and create each via API
    [Arguments]    ${data}
    FOR    ${row}    IN    @{data}
        ${name}=    Set Variable    ${row}[name]
        ${job}=     Set Variable    ${row}[job]
        ${response}=    Create User via API    ${name}    ${job}
        Verify the user creation via API    ${response}    ${name}    ${job}
    END

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
