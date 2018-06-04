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
    Input password  ${password}  password=${pas}
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
    Input password  ${password}  password=${pas}
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
