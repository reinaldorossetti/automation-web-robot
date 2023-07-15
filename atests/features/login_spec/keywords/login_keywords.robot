*** Settings ***

Resource     ../../../support/baseTest.robot
Variables    ../elements/login_page.yaml

Library    Telnet

*** Keywords ***
Perform the site authentication
    [Arguments]    ${USER_NAME}=${USER}    ${PW}=${PASSWORD}
    Input Text    ${USER_INPUT}        ${USER_NAME}
    Input Password    ${PASSWORD_INPUT}    ${PW}
    Click Element       ${LOGIN_BUTTON}

Perform the site authentication fail by user
    Input Text        ${USER_INPUT}        ${INCORRECT_USER}
    Input Text        ${PASSWORD_INPUT}    ${PASSWORD}
    Click Element     ${LOGIN_BUTTON}

Validate if the login was successful
    Wait Until Element Is Visible        xpath=//*[text()='Products']   timeout=30s
    Wait Until Element Is Visible        ${INVENTORY_LOCATOR}      timeout=30s

Validate if the login was fail
    [Arguments]    ${ERROR_MESSAGE}=${ERROR_TEXT}
    Set Selenium Implicit Wait	         15s
    Wait Until Element Is Visible    xpath=//*[text()='${ERROR_MESSAGE}']  timeout=10s
    Elements in Login Page Fail

Elements in Login Page Fail
    ${elements_img_error}=         Get WebElements    css=${ERROR_IMG}
    ${img_error_count}=            Get Length        ${elements_img_error}
    Should Be Equal                "2"    "${img_error_count}"
    Wait Until Element Is Visible        ${LOGIN_BUTTON}     timeout=15s

Access the page without authentication 
    [Arguments]    ${URL}
    Open Browser     about:blank         ${BROWSER}
    Go to                                ${URL}
