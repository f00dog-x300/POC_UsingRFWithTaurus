*** Settings ***
Documentation     Attempt to make a try and continue function for RF

*** Keywords ***
Run keywords several times
    [Arguments]    ${number of tries}    ${keyword being run}
    ${passes}=    Convert to Integer    0
    ${failures}=    Convert to Integer    0
    FOR    ${n}    IN RANGE    ${number of tries}
        ${test results}=    Run Keyword and Return Status    Run Keyword And Continue On Failure    ${keyword being run}
        Log To Console    Run number ${n + 1}
        Run Keyword If    ${test results}==True    Set Local Variable    ${passes}    ${passes + 1}
        ...    ELSE    Run Keywords    Set Local Variable    ${failures}    ${failures + 1}
        ...    AND    Log to Console    Failure on Run #${n + 1}
        ...    AND    Run keyword And Continue On Failure    ${keyword being run}
    END
    Log To Console    Number of Passes: ${passes}    stream=STDOUT    no_newline=False
    Log To Console    Number of Failures: ${failures}    stream=STDOUT    no_newline=False
