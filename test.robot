#  selenium2library help: http://robotframework.org/Selenium2Library/Selenium2Library.html

*** Settings ***
Documentation   Test ncplusgo.pl
Library         Selenium2Library
Library         BuiltIn

*** Variables ***
${browser}  chrome
${url}      http://ncplusgo.pl/
${title}    nc+ GO
${timeout}  3s
${login}    abcd@abcd
${pass}     abcd
*** Test Cases ***
First test of ncplusgo
    [Tags]    DEBUG
    [Setup]
        Open Ncplusgo Website in Chrome
        Verify the home page title
        sleep   ${timeout}
        Click on sign-in link
        Sign in
        sleep   20
    [Teardown]  Close Browser

*** Keywords ***
Open Ncplusgo Website in Chrome
    Open Browser  url=${url}  browser=${browser}
    Maximize Browser Window
    log to console  Website Navigated succesfully
Verify the home page title
    Title Should be  ${title}
    log to console  Title OK
Click on sign-in link
    Click Element  xpath=//*[@id="top"]/div/div/div/div/nav/ul/li[3]/a
    log to console  Clicked
Sign in
    Input text  xpath=//*[@id="Email"]  ${login}
    Input password  xpath=//*[@id="Password"]  password=${pass}
    Click Element  xpath=//*[@id="login-form"]/fieldset/div/div[1]/div[3]/button
    log to console  Zalogowano