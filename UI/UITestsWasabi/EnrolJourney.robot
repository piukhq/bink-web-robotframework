*** Settings ***
Documentation   To run: robot -d UI/ResultsUI -i EnrolJourney UI/UITestsWasabi
Test Teardown     Capture Screenshot and Close Window
Resource     ../Keywords/Login/LoginKeywords.robot
Resource     ../Keywords/EnrolJourney/EnrolKeywords.robot
Resource     ../Keywords/PaymentCards/PaymentCardsKeywords.robot
Resource     ../Keywords/WasabiClubSupportModal/WasabiClubSupportKeywords.robot

*** Variables ***
${browser}=                      chrome
${url}=                          https://web.staging.gb.bink.com/staging/wasabi/login?debugLogin=true
${Email}=                        bularag.havan@gmail.com
${password}=                     Password01
${mailUsername}=                 dwilliams@bink.com
${mailPassword}=                 Qabinktest
${mailTrapUrl}=                  https://mailtrap.io/signin
${cardHolderName}=              Tester
${visaCardNumber}=              4539850226497469
${visaLastFourDigits}=          7469

*** Test Cases ***
Scenario 1 : As a QA, I want to automate the Enrol/Join Wasabi club journey so that I can make use of PLL
    [Documentation]   Wasabi User Enrol Journey feature
    ...
    ...
    [Tags]
    ...     EnrolJourney
    ...     Regression
    ...     Smoke
    Given Bink Web Page is loaded in Saucelabs         ${url}         ${browser}
    And I enter my email_address in the Magic Link field
    And I click the Continue button
    And I load the Mailtrap Account        ${mailTrapUrl}       ${browser}
    And I log into Mailtrap account        ${mailUsername}      ${mailPassword}
    And I click Magic link from my Email inbox
    Then Enrol page is displayed
    And I can enter my details on Enrol Page
    And I can click the Register button
    And I can see Preparing my card page
    And I am logged into my account
    And I can see my Loyalty Card
    And I click the Add a credit/debit card section on LCD
    And I can add Payment card with cardholderName and cardNumber    ${cardHolderName}     ${visaCardNumber}
    And I can delete Payment card        ${visaLastFourDigits}
    And Logout out of Bink Web
    And Clean up Mailtrap Inbox
    And Logout of Mailtrap

*** Keywords ***
Capture Screenshot and Close Window
    Capture Page Screenshot
    Close Browser Window



