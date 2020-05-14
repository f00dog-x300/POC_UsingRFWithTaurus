*** Settings ***
Library           SeleniumLibrary
Library           BuiltIn


*** Variables ***
${URL}            http://blazedemo.com/
${BROWSER}        Chrome

*** Keywords ***
User can search for flights
    Open Browser    url=${URL}    browser=${BROWSER}    options=add_argument("--start-maximized")
    ...    executable_path=Driver/chromedriver
    Select From List By Value    xpath://select[@name='fromPort']    Paris
    Select From List by Value    xpath://select[@name='toPort']    London
    Click Button    css:input[type='submit']
    @{flights}=    Get WebElements    css:table[class='table']>tbody tr
    Should Not Be Empty    ${flights}