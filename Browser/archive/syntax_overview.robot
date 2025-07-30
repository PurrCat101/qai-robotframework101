*** Settings ***
Library    SeleniumLibrary
Resource    common_keywords.robot
Suite Setup    Log To Console    Starting Syntax Overview Suite
Suite Teardown    Log To Console    Ending Syntax Overview Suite
Test Setup    Log To Console    Starting Syntax Overview Test
Test Teardown    Log To Console    Ending Syntax Overview Test

*** Variables ***
${URL}    https://www.saucedemo.com/
@{NAMES}    Alice    Bob    Charlie
&{USER}     name=Alice    age=30

*** Test Cases ***
Test Logging To Console
    Log To Console    ${URL}
    Log To Console    ${NAMES}
    Log To Console    ${USER}
    Log    ${URL}
    Log    ${NAMES}
    Log    ${USER}