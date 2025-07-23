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
    Open Workbook    ${USER_DATA_FILE}
    ${data}=    Read Worksheet    header=True
    ${name}=    Set Variable    ${data}[0][name]
    ${job}=     Set Variable    ${data}[0][job]
    Create Session    reqres    ${BASE_URL}
    ${headers}=    Create Dictionary    x-api-key=reqres-free-v1    Content-Type=application/json
    ${payload}=    Create Dictionary    name=${name}    job=${job}
    ${response}=    POST    ${BASE_URL}${ENDPOINT}    headers=${headers}    json=${payload}
    Should Be Equal As Strings    ${response.status_code}    201
    Should Be Equal As Strings    ${response.json()['name']}    ${name}
    Should Be Equal As Strings    ${response.json()['job']}    ${job}

