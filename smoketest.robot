*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Launch Jinzio webpage
    SeleniumLibrary.Open Browser    https://app.jinzio.com    chrome

Login Action Check
    Maximize Browser Window
    Click Button    id=loginButton
    Input Text    id=username    robotuser1@mailinator.com
    Input Password    id=password    Test@123
    Click Button    name=action

Create and delete Company
    Wait Until Location Is    https://app.jinzio.com/app/jobs/open
    Click Link    id=company
    Wait Until Element Is Visible    //*[@id="fuse-layout"]/div/div/div[2]/div/div[3]/div[2]/div[1]/div/div[3]/button
    Click Element    id=companyCreateButton
    Input Text    name=name    Auto Test Comp1
    Press Keys    none    TAB    ARROW_DOWN    RETURN
    Input Text    //input[@name="phone"]    1234
    Click Button    id=createCompnaySubmitButton
    Wait Until Element Contains    id=td-name-0    Auto Test Comp1    1s
    Element Text Should Be    id=td-name-0    Auto Test Comp1
    Click Element    id=td-deleteAction-0
    Click Button    class=MuiButton-containedPrimary
    Close Browser

Open MyProfile Test Case
    Open Browser    http://localhost:3000    chrome
    Wait Until Element Contains    id=loginButton    \    5s
    Maximize Browser Window
    Click Button    id=loginButton
    Input Text    id=username    robotuser1@mailinator.com
    Input Password    id=password    Test@123
    Click Button    name=action
    Wait Until Location Is    http://localhost:3000/app/jobs/open
    Click Link    id=profile
    Wait Until Location Is    http://localhost:3000/app/profile
    Wait Until Element Is Visible    id=link-gmail-button
    Click Element    id=link-gmail-button
    Wait Until Element Is Visible    id=view_container

invitations
    Open Browser    http://localhost:3000    chrome
    Wait Until Element Contains    id=loginButton    \    5s
    Maximize Browser Window
    Click Button    id=loginButton
    Input Text    id=username    robotuser1@mailinator.com
    Input Password    id=password    Test@123
    Click Button    name=action
    Wait Until Location Is    http://localhost:3000/app/jobs/open
    Click Link    id=profile
    Wait Until Location Is    http://localhost:3000/app/profile
    Click Element    id=rec-invitations
    Click Element    id=recruiter-invitation-button
    Input Text    id=rec-invitationlist-firstname    Nithya
    Input Text    id=rec-invitationlist-lastname    Chidambaram
    Input Text    id=rec-invitationlist-email    shreenithya1989@gmail.com
    Wait Until Element Is Enabled    id=rec-sendinvitation-button
    Click Element    id=rec-sendinvitation-button
    Close Browser
