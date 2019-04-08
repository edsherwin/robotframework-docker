*** Settings ***
Library           Selenium2Library
Library           Dialogs
Library           XvfbRobot
Library           JSONLibrary
Library           OperatingSystem
Library           FakerLibrary
#Library           HttpLibrary.HTTP
Library           Collections
Library           RequestsLibrary
Resource          ../../resources/scalars/google/_google.txt
Resource          ../../resources/scalars/google/_google.txt

*** Keywords ***
Open Google
    Set Selenium Speed    1
    Wait Until Keyword Succeeds    5    5    Wait Until Page Contains Element    ${Google_Search}
    Element Should Be Visible    ${Google_Search}
    # Element Should Be Visible    ${ProjectPartners_Footer}
    # Element Should Be Visible    ${Browse_Footer}
    # Element Should Be Visible    ${FrequentlyAskedQuestions_Footer}
    # Element Should Be Visible    ${ContactUs_Footer}
    # Element Should Be Visible    ${HowTo_Footer}
    # Element Should Be Visible    ${GetYourBusinessPermit_Footer}
    # Element Should Be Visible    ${GovPhDirectory_Footer}
    # Element Should Be Visible    ${PBD_Footer}
    # Element Should Be Visible    ${FreedomofInfo_Footer}
    # Element Should Be Visible    ${OpenData_Footer}
    # Element Should Be Visible    ${GSC_Footer}
