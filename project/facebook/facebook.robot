*** Settings ***
Resource          ../../resources/keywords/setup/Global_Setup_and_Teardown.robot
Library           RequestsLibrary
Library           Selenium2Library
Library           XvfbRobot
Library           JSONLibrary
Library           OperatingSystem
#Library           HttpLibrary.HTTP
#Library           ../../Library/highlight.py
Library           FakerLibrary
Resource          ../../resources/scalars/facebook/facebook_path.txt
Resource          ../../resources/keywords/facebook/dashboard.robot
*** Test Cases ***
Verify Facebook
    [Documentation]    This TC will open facebook.com
    ...
    ...    @Author: Ed
    [Setup]    Setup    ${URL}
    Open Facebook
    [Teardown]    Teardown

Validate Facebook Form
    [Documentation]    This Test Case check the fields in the form.
    ...
    ...    @Author: Ed
    [Setup]    Setup    ${URL}
    Verify Login form
    [Teardown]    Teardown
