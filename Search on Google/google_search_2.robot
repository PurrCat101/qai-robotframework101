*** Settings ***
Resource    ./keywords.resource

*** Variables ***
${URL}    https://www.google.com
${BROWSER}    chrome

***Test Cases***
Search for "ข้าวมันไก่" on Google
    [Documentation]    Search for "ข้าวมันไก่" on Google and validate results
    [Tags]    Google Search
    Open Google    ${URL}    ${BROWSER}
    Search text     ข้าวมันไก่
    Press Enter key
    Validate search results     ข้าวมันไก่