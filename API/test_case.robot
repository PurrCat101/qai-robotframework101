*** Settings ***
Resource    api_keywords.robot

*** Test Cases ***
Get Pokemon from list with index of 0 and get then get the Pokemon's detail
    ${response}=    Get All Pokemon List From API
    ${Pokemon_name}=    Get Pokemon From List    ${response}
    ${Pokemon_detail}=    Get Pokemon's Detail    ${Pokemon_name}
    ${Pokemon_detail_dump}=    Evaluate    json.dumps(${Pokemon_detail}, indent=4)    json
    # Log To Console    ${Pokemon_detail_dump}
    # Validate Pokemon's Height    ${response}    7
    # Validate Pokemon's Weight    ${response}    69

Create User With POST
    Create Session    reqres    https://reqres.in
    ${body}=    Create Dictionary    name=morpheus    job=leader
    ${headers}=    Create Dictionary    x-api-key=reqres-free-v1
    ${response}=    POST On Session    reqres    /api/users    json=${body}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    201
    Log    ${response.json()}

Create User With POST 2
    ${body}=    Create Dictionary    name=morpheus    job=leader
    ${headers}=    Create Dictionary    x-api-key=reqres-free-v1
    ${response}=    POST    https://reqres.in/api/users    json=${body}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    201
    Log    ${response.json()}