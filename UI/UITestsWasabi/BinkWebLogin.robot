*** Settings ***
Documentation   To run: robot -d UI/ResultsUI  -i WasabiLogin UI/UITestsWasabi
Test Teardown     Capture Screenshot and Close Window
Resource     ../Keywords/Login/LoginKeywords.robot
Resource     ../Keywords/WasabiClubSupportModal/WasabiClubSupportKeywords.robot

*** Variables ***
${browser}=        chrome
${url} =           https://web.staging.gb.bink.com/staging/wasabi/login?debugLogin=true
${email}=          bularaghavan+test98@gmail.com
${password}=       Password01

*** Test Cases ***
Scenario 1 : As an Existing Bink Web customer with a valid loyalty card & valid payment card, I want to login
to my account
    [Documentation]   Wasabi Login feature
    ...
    ...
    [Tags]
    ...     WasabiLogin
    ...     Regression
    ...     Smoke
    [Setup]      Bink Web Page is loaded      ${url}         ${browser}


    Given I enter my email_address and password in the relevant fields   ${email}     ${password}
    When I click the Login button
    Then I am logged into my account
    And I can see my Loyalty Card


*** Keywords ***
Capture Screenshot and Close Window
    Capture Page Screenshot
    Logout out of Bink Web
    Close Browser Window







