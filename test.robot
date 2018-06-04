#  selenium2library help: http://robotframework.org/Selenium2Library/Selenium2Library.html
#  uruchomienie z timestamp: pybot -d \sciezka\do\folderu\nazwa_folderu -T --timestampoutputs test.robot
#  uruchomienie drugiego test caseu: pybot -i Second_test_of_ncplusgo -d ncplusgo3 -T --timestampoutputs test.robot
#  wskazowki jak poprawnie pisac testy: https://github.com/robotframework/HowToWriteGoodTestCases/blob/master/HowToWriteGoodTestCases.rst
#  robotframework na github: https://github.com/robotframework

*** Settings ***
Documentation   Test ncplusgo.pl
Library         Selenium2Library
Library         BuiltIn

*** Variables ***
${browser}  chrome
${url}      https://ncplusgo.pl/
${title}    nc+ GO
${timeout}  3s
${login}    type here login
${pass}     type here password
${zaloguj}  xpath=//*[@id="top"]/div/div/div/div/nav/ul/li[2]/a
${terazwtv}  xpath=//*[@id="top"]/div/div/div/div/div/nav/a[2]
${email}  xpath=//*[@id="Email"]
${password}  xpath=//*[@id="Password"]
${loginbutton}  xpath=//*[@id="login-form"]/fieldset/div/div[1]/div[3]/button
${rozumiem}  xpath=//*[@id="Home_Index"]/div[2]/div/div/div/a[2]
${terazwtvelement}  xpath=//*[@id="player-container"]/h1
${search}  xpath=//*[@id="top"]/div/div/div/div/nav/ul/li[1]/a/img
${inputsearch}  xpath=//*[@id="search"]
${kruk}  kruk
${krukelement}  xpath=//*[@id="Search_Search"]/main/div/div[2]/ul/li[17]/div/div[3]/h2/a

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

*** Test Cases ***
Second_test_of_ncplusgo
    [Tags]  Second_test_of_ncplusgo
    [Setup]
    Open Ncplusgo Website in Chrome 2
    Click on sign-in link 2
    Log in
    Accept rozumiem 2
    Hover search and search kruk
    sleep  10
    [Teardown]  Close Browser

*** Keywords ***
Open Ncplusgo Website in Chrome 2
    Open Browser  url=${url}  browser=${browser}
    Maximize Browser Window
    Capture Page Screenshot  1.png
    log to console  Website Navigated succesfully
Click on sign-in link 2
    Click Element  ${zaloguj}
    Capture Page Screenshot  2.png
    log to console  Clicked
Log in
    Input text  ${email}  ${login}
    Input password  ${password}  password=${pass}
    Capture Page Screenshot  3.png
    Click Element  ${loginbutton}
    Capture Page Screenshot  4.png
    log to console  Zalogowano
Accept rozumiem 2
    Capture Page Screenshot  5.png
    Click Element  ${rozumiem}
    Capture Page Screenshot  6.png
    log to console  Kliknieto rozumiem
Hover search and search kruk
    Mouse Over  ${search}
    Input Text  ${inputsearch}  ${kruk}
    Press Key  ${inputsearch}  \\13
    Page Should Contain Element  ${krukelement}
    log to console  Wyszukano kruk
