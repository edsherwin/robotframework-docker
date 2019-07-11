*** Settings ***
Library           Selenium2Library
Library           Dialogs
Library           XvfbRobot
Library           JSONLibrary
Library           OperatingSystem
Library           FakerLibrary
Library           Collections    #Library    HttpLibrary.HTTP
Library           RequestsLibrary
Resource          ../../scalars/facebook/facebook_path.txt

*** Keywords ***
Open Facebook
    Set Selenium Speed    1
    Wait Until Keyword Succeeds    5    5    Wait Until Page Contains Element    ${username_field}
    Element Should Be Visible    ${username_field}

Verify Login form
    Set Selenium Speed    1
    Wait Until Keyword Succeeds    5    5    Wait Until Page Contains Element    ${password_field}
    Element Should Be Visible    ${password_field}
    Element Should Be Visible    ${password_label}
