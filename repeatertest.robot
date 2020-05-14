*** Settings ***
Documentation     Attempting to try to use the
Resource          blazetest.robot
Resource          repeater.robot
Suite Teardown    Close All Browsers

*** Test Cases ***
Testing how to repeat tests
    Run keywords several times    5    User can search for flights
