*** Settings ***
Library    SeleniumLibrary

***Test Cases***
Search for "ข้าวมันไก่" on Google
    [Documentation]    Search for "ข้าวมันไก่" on Google and validate results
    [Tags]    Google Search
    Open Google
    Search text "ข้าวมันไก่"
    Press Enter key
    Validate search results "ข้าวมันไก่"

*** Keywords ***
Open Google
    Open Browser    url=https://www.google.com    browser=chrome    options=add_experimental_option("detach", True)

Search text "ข้าวมันไก่"
    Input Text    name=q    ข้าวมันไก่

Press Enter key
    Press Keys    name=q    RETURN

Validate search results "ข้าวมันไก่"
    Wait Until Page Contains    ข้าวมันไก่
    # Page Should Contain    ข้าวมันไก่
