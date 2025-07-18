*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Wait Until Element Is Visible And Click Element
    [Arguments]    ${locator}    ${timeout}=30
    Wait Until Element Is Visible    ${locator}    ${timeout}
    Click Element    ${locator}

Wait Until Text Field Is Visible And Input Text
    [Arguments]    ${locator}    ${text}    ${timeout}=30
    Wait Until Element Is Visible    ${locator}    ${timeout}
    Input Text    ${locator}    ${text}