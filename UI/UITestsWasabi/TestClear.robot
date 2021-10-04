*** Settings ***
Documentation   For test purpose
#Test Teardown    Capture Screenshot
Suite Teardown   Teardown Actions
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

Scenario 1 :
    [Documentation]   Wasabi User Enrol Journey feature
    ...
    ...
    [Tags]


    Given I load the Mailtrap Account   ${mailTrapUrl}       ${browser}
    And I log into Mailtrap account     ${mailUsername}      ${mailPassword}
    And I click Magic link from my Email inbox
    And Clean up Mailtrap Inbox
    And Logout of Mailtrap

*** Keywords ***
Teardown Actions
    Capture Page Screenshot
    Run Keyword     Close Browser Window

