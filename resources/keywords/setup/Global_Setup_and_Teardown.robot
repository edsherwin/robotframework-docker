*** Settings ***
Library           JSONLibrary
Library           OperatingSystem
#Library           HttpLibrary.HTTP
Library           Dialogs
Library           XvfbRobot
Library           Selenium2Library
Library           RequestsLibrary

*** Keywords ***
Setup
    [Arguments]    ${URL}
    Start Virtual Display    1920    1080
    Open Browser    ${URL}    Chrome
    #Run Keyword If    '''${BROWSER}'''=='''chrome'''    Open Chrome In Headless    ${URL}
    #Run Keyword Unless    '''${BROWSER}'''=='''chrome'''    Start Virtual Display    1920    1080
    #Run Keyword Unless    '''${BROWSER}'''=='''chrome'''    Open Browser    ${URL}    ${BROWSER}
    #Run Keyword Unless    '''${BROWSER}'''=='''chrome'''    Open Browser    ${URL}    chrome

Teardown
    Close Browser

Open Chrome In Headless
    [Arguments]    ${URL}
    ${chrome options} =    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome options}    add_argument    headless
    Call Method    ${chrome options}    add_argument    disable-gpu
    Call Method    ${chrome options}    add_argument    no-sandbox
    Call Method    ${chrome options}    add_argument    disable-extensions
    Call Method    ${chrome options}    add_argument    disable-dev-shm-usage
    Create Webdriver    Chrome    chrome_options=${chrome options}
    Go To    ${URL}
