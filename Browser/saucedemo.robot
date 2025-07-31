*** Settings ***
Library    SeleniumLibrary
Resource    ./keywords.resource

*** Variables ***
${URL}    https://www.saucedemo.com/
${USERNAME}    standard_user
${PASSWORD}    secret_sauce
${BROWSER}    chrome
${FIRST_NAME}    John
${LAST_NAME}    Doe
${ZIP_CODE}    12345

*** Test Cases ***
Open website and buy "Sauce Labs Fleece Jacket"
    [Tags]    buy Sauce Labs Fleece Jacket   
    Go to website saucedemo    url=${URL}    browser=${BROWSER}
    Input username and password    username=${USERNAME}    password=${PASSWORD}
    Click Login button
    Add Product To Cart    Sauce Labs Fleece Jacket
    Go to Cart page
    Verify Item Price In Cart    Sauce Labs Fleece Jacket    $49.99
    Proceed checkout
    Input Information    ${FIRST_NAME}    ${LAST_NAME}    ${ZIP_CODE}
    Go to Checkout Overview page
    Validate total price    $53.99
    Finish checkout
    Verify completion message

Open website and buy "Sauce Labs Bike Light" and "Sauce Labs Bolt T-Shirt"
    [Tags]    buy Sauce Labs Bike Light and Sauce Labs Bolt T-Shirt
    Go to website saucedemo    url=${URL}    browser=${BROWSER}
    Input username and password    username=${USERNAME}    password=${PASSWORD}
    Click Login button
    Add Product To Cart    Sauce Labs Bike Light
    Add Product To Cart    Sauce Labs Bolt T-Shirt
    Go to Cart page
    Verify Item Price In Cart    Sauce Labs Bike Light    $9.99
    Verify Item Price In Cart    Sauce Labs Bolt T-Shirt    $15.99
    Proceed checkout
    Input Information    ${FIRST_NAME}    ${LAST_NAME}    ${ZIP_CODE}
    Go to Checkout Overview page
    Validate total price    $28.06    
    Finish checkout
    Verify completion message

