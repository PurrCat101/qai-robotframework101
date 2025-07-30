*** Settings ***
Library    SeleniumLibrary
Library    String

*** Keywords ***
Wait Until Element Is Visible And Click Element
    [Arguments]    ${locator}    ${timeout}=30
    Wait Until Element Is Visible    ${locator}    ${timeout}
    Click Element    ${locator}

Wait Until Text Field Is Visible And Input Text
    [Arguments]    ${locator}    ${text}    ${timeout}=30
    Wait Until Element Is Visible    ${locator}    ${timeout}
    Input Text    ${locator}    ${text}

Open Browser And Go To The Website
    [Arguments]    ${url}
    Open Browser    ${url}    edge    options=add_experimental_option("detach", True)
    Maximize Browser Window
    Title Should Be    Swag Labs
    Wait Until Element Is Visible    xpath=//div[@class="login_logo"]
    Page Should Contain    Swag Labs

Log In To Website
    [Arguments]    ${username}    ${password}
    Wait Until Text Field Is Visible And Input Text    id=user-name    ${username}
    Wait Until Text Field Is Visible And Input Text    id=password    ${password}
    Wait Until Element Is Visible And Click Element    id=login-button
    Wait Until Page Contains    Products

Add Product To Cart
    [Documentation]    Get unique element with product_name as Argument
    [Arguments]    ${product_name}
    Wait Until Element Is Visible And Click Element    xpath=//div[@class="inventory_item"][div/div/a/div[text()="${product_name}"]]//button[text()="Add to cart"]

Verify Item Price In Cart
    [Arguments]    ${product_name}    ${product_price}
    Wait Until Element Is Visible And Click Element    xpath=//a[@class="shopping_cart_link"]

    # Get unique element with product_name 
    Wait Until Element Is Visible    xpath=//div[@class="cart_item_label"][a/div[text()="${product_name}"]]

    ${item_price}=    Get Text    xpath=//div[@class="cart_item_label"][a/div[text()="${product_name}"]]//div[@class="inventory_item_price"]
    Should Be Equal    ${product_price}    ${item_price}
    Log To Console    The ${product_name} is ${item_price}

Proceed With Payment
    [Arguments]    ${first_name}    ${last_name}    ${zip_code}
    Wait Until Element Is Visible And Click Element    id=checkout
    Wait Until Element Is Visible    xpath=//span[text()="Checkout: Your Information"]
    Input Text    id=first-name    ${first_name}
    Input Text    id=last-name    ${last_name}
    Input Text    id=postal-code    ${zip_code}
    Wait Until Element Is Visible And Click Element    id=continue

Validate The Total Price
    ${item_total_price}=    Get Text    xpath=//div[@class="summary_subtotal_label"]
    ${item_total_price}=    Get Regexp Matches    ${item_total_price}    \\d+\\.\\d{2}

    ${tax}=    Get Text    xpath=//div[@class="summary_tax_label"]
    ${tax}=    Get Regexp Matches    ${tax}    \\d+\\.\\d{2}

    ${total_from_website}=    Get Text    xpath=//div[@class="summary_total_label"]
    ${total_from_website}=    Get Regexp Matches    ${total_from_website}    \\d+\\.\\d{2}
    ${total_from_website}=    Evaluate    float(${total_from_website}[0])

    # Calculation
    ${total_sum}=    Evaluate    round(${item_total_price}[0] + ${tax}[0], 2)

    Should Be Equal    ${total_from_website}    ${total_sum}

Continue The Payment And Validate Thank You Message
    Wait Until Element Is Visible And Click Element    id=finish
    Wait Until Element Is Visible    xpath=//span[text()="Checkout: Complete!"]
    Page Should Contain    Thank you for your order!
    Page Should Contain    Your order has been dispatched, and will arrive just as fast as the pony can get there!