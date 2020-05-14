*** Settings ***
Library           SeleniumLibrary
Library           BuiltIn
Suite Teardown    Close All Browsers

*** Variables ***
${URL}            http://blazedemo.com/
${BROWSER}        Chrome

*** Test Cases ***
The user can search for flights
    [Tags]    search_flights
    Open Browser    url=${URL}    browser=${BROWSER}    options=add_argument("--start-maximized")
    ...    executable_path=Driver/chromedriver
    Select From List By Value    xpath://select[@name='fromPort']    Paris
    Select From List by Value    xpath://select[@name='toPort']    BLondon
    Click Button    css:input[type='submit']
    @{flights}=    Get WebElements    css:table[class='tabe']>tbody tr
    Should Not Be Empty    ${flights}

*** Keywords ***
