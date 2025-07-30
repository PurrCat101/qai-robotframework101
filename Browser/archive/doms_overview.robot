*** Settings ***
Library    SeleniumLibrary    
Resource    common_keywords.robot
Suite Setup    Log To Console    Starting Syntax Overview Suite
Suite Teardown    Log To Console    Ending Syntax Overview Suite

*** Variables ***
${URL}    https://www.saucedemo.com/
${USERNAME}    standard_user
${PASSWORD}    secret_sauce

*** Test Cases ***
Open Browser And Validate Title And Wordings
    Open Browser    url=${URL}    browser=edge    # options=add_experimental_option("detach", True)
    Title Should Be    Swag Labs
    Wait Until Element Is Visible    xpath=//div[@class="login_logo"]
    Page Should Contain    Swag Labs

Open Browser And Log In With Valid Username And Password
    Open Browser    url=${URL}    browser=edge    # options=add_experimental_option("detach", True)
    Wait Until Element Is Visible    id=user-name
    Input Text    id=user-name    ${USERNAME}
    Wait Until Element Is Visible    id=password
    Input Text    id=password    ${PASSWORD}
    Wait Until Element Is Visible    id=login-button
    Click Element    id=login-button
    Wait Until Page Contains    Products

Open Browser And Log In With Valid Username And Password And Add To Cart
    Open Browser    url=${URL}    browser=edge    # options=add_experimental_option("detach", True)
    Maximize Browser Window
    Wait Until Element Is Visible    id=user-name
    Input Text    id=user-name    ${USERNAME}
    Wait Until Element Is Visible    id=password
    Input Text    id=password    ${PASSWORD}
    Wait Until Element Is Visible    id=login-button
    Click Element    id=login-button
    Wait Until Page Contains    Products
    Wait Until Element Is Visible    xpath=//div[@class="inventory_item"][div/div/a/div[text()="Sauce Labs Onesie"]]//button[text()="Add to cart"]
    Click Element    xpath=//div[@class="inventory_item"][div/div/a/div[text()="Sauce Labs Onesie"]]//button[text()="Add to cart"]