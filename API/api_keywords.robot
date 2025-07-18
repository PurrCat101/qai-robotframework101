*** Settings ***
Library    RequestsLibrary
Variables    test_data.yaml

*** Keywords ***
Get All Pokemon List From API
    Create Session    Pokemon    ${URL}
    ${response}=    GET On Session    Pokemon    ${URL}
    RETURN    ${response.json()}

Get Pokemon From List
    [Arguments]    ${response}    ${index}=0
    ${Pokemon_name}=    Set Variable    ${response}[results][${index}][name]
    RETURN    ${Pokemon_name}

Get Pokemon's Detail
    [Arguments]    ${Pokemon_name}
    Create Session    Pokemon    ${URL}
    ${response}=    GET On Session    Pokemon    ${URL}/${Pokemon_name}
    RETURN    ${response.json()}

Validate Pokemon's Height
    [Arguments]    ${response}    ${Pokemon_height}
    ${height}=    Set Variable    ${response}[height]
    Should Be Equal    ${${Pokemon_height}}    ${height}
    Log To Console    Pokemon's height: ${height}

Validate Pokemon's Weight
    [Arguments]    ${response}    ${Pokemon_weight}
    ${weight}=    Set Variable    ${response}[weight]
    Should Be Equal    ${${Pokemon_weight}}    ${weight}
    Log To Console    Pokemon's weight: ${weight}