*** Settings ***
Documentation   Test ncplusgo.pl
Library         Selenium2Library
Library         BuiltIn
Variables  variables.py
Resource  keywords.robot

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
