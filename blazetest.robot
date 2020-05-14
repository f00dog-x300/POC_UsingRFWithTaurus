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

Run keywords several times
    [Arguments]    ${number of tries}    ${keyword being run}
    ${passes}=    Convert to Integer    0
    ${failures}=    Convert to Integer    0
    FOR    ${n}    IN RANGE    ${number of tries}
        ${test results}=    Run Keyword and Return Status    Run Keyword And Continue On Failure    ${keyword being run}
        Log To Console    Run number ${n + 1}
        Run Keyword If    ${test results}==True    Set Local Variable    ${passes}    ${passes + 1}
        ...    ELSE    Run Keyword    Set Local Variable    ${failures}    ${failures + 1}
    END
    Log To Console    Number of Passes: ${passes}    stream=STDOUT    no_newline=False
    Log To Console    Number of Failures: ${failures}    stream=STDOUT    no_newline=False

Add amount
    [Arguments]    ${bool}
    Run Keyword If    ${bool}==True
