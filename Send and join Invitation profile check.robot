*** Settings ***
Library           SeleniumLibrary
Library           DateTime

*** Variables ***
${ROBOT_USER_EMAIL}    robotuser1@mailinator.com
${APP_URL}        http://localhost:3000/

*** Test Cases ***
Send invitaions
    [Tags]    smoketest 1    smoke test 1
    ${DATE_TIME}    Get Current Date    result_format=%Y%m%d%H%M
    Set Global Variable    ${DATE_TIME}
    Open Browser    ${APP_URL}    chrome
    Wait Until Element Contains    id=loginButton    \    5s
    Maximize Browser Window
    Click Button    id=loginButton
    Input Text    id=username    ${ROBOT_USER_EMAIL}
    Input Password    id=password    Test@123
    Click Button    name=action
    Wait Until Location Is    ${APP_URL}app/jobs/open
    Click Link    id=profile
    Wait Until Location Is    ${APP_URL}app/profile
    Wait Until Element Is Visible    id=rec-invitations
    Click Element    id=rec-invitations
    Click Element    id=recruiter-invitation-button
    Input Text    id=rec-invitationlist-firstname    Jinzio
    Input Text    id=rec-invitationlist-lastname    Rec ${DATE_TIME}
    Input Text    id=rec-invitationlist-email    jinzio.rec${DATE_TIME}@mailinator.com
    Wait Until Element Is Enabled    id=rec-sendinvitation-button
    Click Element    id=rec-sendinvitation-button

Join Invitation
    [Tags]    smoketest 1    smoke test 1
    Open Browser    ${APP_URL}join    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    id=email
    Input Text    id=email    jinzio.rec${DATE_TIME}@mailinator.com
    Input Password    id=password    Test@123
    Click Button    name=action
    Click Button    //*[@name="action" and @value="accept"]
    Wait Until Location Is    ${APP_URL}app/task/status/open
    Close Browser

Join Invitation profile check
    [Tags]    smoketest 1    smoke test 1
    Open Browser    ${APP_URL}    chrome
    Wait Until Element Contains    id=loginButton    \    5
    Maximize Browser Window
    Click Button    id=loginButton
    Input Text    id=username    jinzio.rec${DATE_TIME}@mailinator.com
    Input Password    id=password    Test@123
    Click Button    name=action
    Wait Until Location Is    ${APP_URL}app/task/status/open
    Click Link    id=profile
    Wait Until Location Is    ${APP_URL}app/profile
    Wait Until Element Is Visible    id=link-gmail-button
    Mouse Over    id=link-gmail-button
    Wait Until Element Is Visible    id=rec-profile    5s
    Click Element    id=rec-profile
    Wait Until Page Contains    Jinzio
    Element Text Should Be    id=rec-personal-name    Jinzio Rec ${DATE_TIME}
    Close Browser
