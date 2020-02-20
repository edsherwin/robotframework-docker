*** Settings ***
Resource          ../../resources/keywords/setup/Global_Setup_and_Teardown.robot
Library           RequestsLibrary
Library           Selenium2Library
#Library           XvfbRobot
Library           JSONLibrary
Library           OperatingSystem
Library           FakerLibrary    #Library    HttpLibrary.HTTP    #Library    ../../Library/highlight.py
Resource          ../../resources/scalars/facebook/facebook_path.txt
Resource          ../../resources/keywords/facebook/dashboard.robot

*** Test Cases ***
Open Google
    [Documentation]    This Test Case will open Google.com
    ...
    ...    @Author: Ed Sherwin
    [Setup]    Setup    ${URL}
    Open Google
    [Teardown]    Teardown

# Vefify Facebook Login Form
#     [Documentation]    This Test Case check the fields in the form.
#     ...
#     ...    @Author: Ed
#     [Setup]    Setup    ${URL}
#     Verify Login form
#     [Teardown]    Teardown

# Verfiy Signup Form
#     [Documentation]    This Test Case will verify the fields in the signup form.
#     ...
#     ...    @Author: Ed
#     [Setup]    Setup    ${URL}
#     Verify Sign Up form
#     [Teardown]    Teardown
