*** Settings ***
Library    SeleniumLibrary
Library    String

*** Keywords ***
Go to website saucedemo
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}    options=add_experimental_option("detach",True);add_experimental_option("prefs", {"profile.password_manager_leak_detection": False})
    Title Should Be    Swag Labs
    Wait Until Element Is Visible    xpath=//div[@class="login_logo"]

Input username and password
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    id=user-name
    Input Text    id=user-name    ${username}
    Wait Until Element Is Visible    id=password
    Input Text    id=password    ${password}

Click Login button
    Wait Until Element Is Visible    id=login-button
    Click Element    id=login-button

Add Product To Cart
    [Arguments]    ${product_name}
    Wait Until Element Is Visible    xpath=//div[@class="inventory_item"][div/div/a/div[text()="${product_name}"]]//button[text()="Add to cart"]
    Click Element    xpath=//div[@class="inventory_item"][div/div/a/div[text()="${product_name}"]]//button[text()="Add to cart"]

Go to Cart page
    Click Element    xpath=//a[@class="shopping_cart_link"]

Verify Item Price In Cart
    [Arguments]    ${product_name}    ${product_price}
    Wait Until Element Is Visible    xpath=//div[@class="cart_item_label"][a/div[text()="${product_name}"]]
    ${item_price}=    Get Text    xpath=//div[@class="cart_item_label"][a/div[text()="${product_name}"]]//div[@class="inventory_item_price"]
    Should Be Equal    ${product_price}    ${item_price}

Proceed checkout
    Wait Until Element Is Visible    id=checkout
    Click Element    id=checkout

Input Information
    [Arguments]    ${first_name}    ${last_name}    ${zip_code}
    Wait Until Element Is Visible    xpath=//span[text()="Checkout: Your Information"]
    Input Text    id=first-name    ${first_name}
    Input Text    id=last-name    ${last_name}
    Input Text    id=postal-code    ${zip_code}

Go to Checkout Overview page
    Click Element    id=continue

Validate Total Price
    ${item_total_price}=    Get Text    xpath=//div[@class="summary_subtotal_label"]
    ${item_total_price}=    Get Regexp Matches    ${item_total_price}    \\d+\\.\\d{2}

    ${tax}=    Get Text    xpath=//div[@class="summary_tax_label"]
    ${tax}=    Get Regexp Matches    ${tax}    \\d+\\.\\d{2}

    ${total_from_website}=    Get Text    xpath=//div[@class="summary_total_label"]
    ${total_from_website}=    Get Regexp Matches    ${total_from_website}    \\d+\\.\\d{2}
    ${total_from_website}=    Evaluate    float(${total_from_website}[0])

    ${total_sum}=    Evaluate    round(${item_total_price}[0] + ${tax}[0], 2)

    Should Be Equal    ${total_from_website}    ${total_sum}   

Finish checkout
    Click Element    id=finish

Verify completion message
    Wait Until Element Is Visible    xpath=//span[text()="Checkout: Complete!"]
    Page Should Contain    Thank you for your order!