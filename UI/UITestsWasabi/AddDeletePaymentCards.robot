*** Settings ***
Documentation   To run: robot -d UI/ResultsUI  -i PaymentCards UI/UITestsWasabi
Test Teardown    Capture Screenshot
Suite Teardown   Close the Browser Window
Resource     ../Keywords/Login/LoginKeywords.robot
Resource     ../Keywords/PaymentCards/PaymentCardsKeywords.robot
Resource     ../Keywords/WasabiClubSupportModal/WasabiClubSupportKeywords.robot

*** Variables ***
#${browser}=                    edge
#${url} =                       https://web.staging.gb.bink.com/staging/wasabi/login?debugLogin=true
${email}=                       bularaghavan+test98@gmail.com
${password}=                    Password01
${cardHolderName}=              Tester
${visaCardNumber}=              4539850226497469
${visaLastFourDigits}=          7469
${masterCardNumber}=            5318409723092358
${mastercardLastFourDigits}=    2358
${americanexpCardNumber}=       340906421443075
${americanexpLastFourDigits}=   3075

*** Test Cases ***
Scenario 1 : As an Existing Bink Web customer with a valid loyalty card I want to login and Add Visa Payment card and Delete Visa Payment card.
    [Documentation]   Wasabi Add/Delete Payment Feature
    ...
    ...
    [Tags]
    ...     PaymentCards
    ...     Regression
    ...     Smoke
    ...     Visa

 #   [Setup]      Bink Web Page is loaded   ${url}         ${browser}

    Given Bink Web Page is loaded     ${url}         ${browser}
    And I enter my email_address and password in the relevant fields   ${email}     ${password}
    And I click the Login button
    Then I am logged into my account
    And I click the Add Payment Card button on LCD
    And I can add Payment card with cardholderName and cardNumber  ${cardHolderName}    ${visaCardNumber}
    And I can delete Payment card   ${visaLastFourDigits}

Scenario 2 : As an Existing Bink Web customer with a valid loyalty card I want to login and Add Mastercard Payment card and Delete Mastercard Payment card.
    [Documentation]   Wasabi Add/Delete Payment Feature
    ...
    ...
    [Tags]
    ...     PaymentCards
    ...     Regression
    ...     Smoke
    ...     Mastercard

    Given I click the Add Payment Card button on LCD
    And I can add Payment card with cardholderName and cardNumber  ${cardHolderName}    ${masterCardNumber}
    And I can delete Payment card   ${mastercardLastFourDigits}

Scenario 3 : As an Existing Bink Web customer with a valid loyalty card I want to login and Add Mastercard Payment card and Delete Mastercard Payment card.
    [Documentation]   Wasabi Add/Delete Payment Feature
    ...
    ...
    [Tags]
    ...     PaymentCards
    ...     Regression
    ...     Smoke
    ...     AmericanExpress

    Given I click the Add Payment Card button on LCD
    And I can add Payment card with cardholderName and cardNumber  ${cardHolderName}    ${americanexpCardNumber}
    And I can delete Payment card   ${americanexpLastFourDigits}
    And Logout out of Bink Web


*** Keywords ***
Capture Screenshot
    Capture Page Screenshot


Close the Browser Window
     Close Browser Window





