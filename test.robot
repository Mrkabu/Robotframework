#  selenium2library help: http://robotframework.org/Selenium2Library/Selenium2Library.html
#  pybot -d \sciezka\do\folderu\nazwa_folderu -T --timestampoutputs test.robot

*** Settings ***
Documentation   Test ncplusgo.pl
Library         Selenium2Library
Library         BuiltIn

*** Variables ***
${browser}  chrome
${url}      https://ncplusgo.pl/
${title}    nc+ GO
${timeout}  3s
${login}    jakub.kucharski@ncplus.pl
${pass}     123buraczki
${zaloguj}  xpath=//*[@id="top"]/div/div/div/div/nav/ul/li[2]/a
${terazwtv}  xpath=//*[@id="top"]/div/div/div/div/div/nav/a[2]
${email}  xpath=//*[@id="Email"]
${password}  xpath=//*[@id="Password"]
${loginbutton}  xpath=//*[@id="login-form"]/fieldset/div/div[1]/div[3]/button
${rozumiem}  xpath=//*[@id="Home_Index"]/div[2]/div/div/div/a[2]
${terazwtvelement}  xpath=//*[@id="player-container"]/h1
*** Test Cases ***
First test of ncplusgo
    [Tags]    DEBUG
    [Setup]
        Open Ncplusgo Website in Chrome
        Verify the home page title
        sleep   ${timeout}
        Click on sign-in link
        Sign in
        Accept rozumiem
        Click terazwtv
        sleep   20
    [Teardown]  Close Browser

*** Keywords ***
Open Ncplusgo Website in Chrome
    Open Browser  url=${url}  browser=${browser}
    Maximize Browser Window
    Capture Page Screenshot  1.png
    log to console  Website Navigated succesfully
Verify the home page title
    Title Should be  ${title}
    log to console  Title OK
Click on sign-in link
    Click Element  ${zaloguj}
    Capture Page Screenshot  2.png
    log to console  Clicked
Sign in
    Input text  ${email}  ${login}
    Input password  ${password}  password=${pass}
    Capture Page Screenshot  3.png
    Click Element  ${loginbutton}
    Capture Page Screenshot  4.png
    log to console  Zalogowano
Accept rozumiem
    Capture Page Screenshot  5.png
    Click Element  ${rozumiem}
    Capture Page Screenshot  6.png
    log to console  Kliknieto rozumiem
Click terazwtv
    Click Element  ${terazwtv}
    log to console  Teraz w TV
    Page Should Contain Element  ${terazwtvelement}
    Capture Page Screenshot  7.png
    log to console  Element znajduje sie na stronie
