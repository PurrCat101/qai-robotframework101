*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open Google
    [Arguments]    ${url}    ${browser}
    Open Browser    url=${url}    browser=${browser}

Search text
    [Arguments]    ${text}
    Wait Until Element Is Visible    name=q    
    Wait Until Element Is Visible    name=q    timeout=${None}    error=${None}

    Wait Until Element Is Visible    name=q    timeout=10s    
    Wait Until Element Is Visible    name=q    error=not found element 
    Input Text    name=q    ${text}

Press Enter key
    Press Keys    name=q    RETURN

Validate search results
    [Arguments]    ${expected_text}
    Page Should Contain    ${expected_text}