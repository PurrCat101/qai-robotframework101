*** Settings ***
Library    SeleniumLibrary    run_on_failure=Nothing
Resource    common_keywords.robot
Variables    test_data.yaml

*** Test Cases ***
Open website and buy "Sauce Labs Onesie"
    Open Browser And Go To The Website    ${URL}
    Log In To Website    ${USERNAME}    ${PASSWORD}
    Add Product To Cart    Sauce Labs Fleece Jacket
    Add Product To Cart    Sauce Labs Bike Light
    Verify Item Price In Cart    Sauce Labs Onesie    $7.99
    Verify Item Price In Cart    Sauce Labs Fleece Jacket    $49.99
    Proceed With Payment    ${FIRST_NAME}    ${LAST_NAME}    ${ZIP_CODE}
    Validate The Total Price
    Continue The Payment And Validate Thank You Message