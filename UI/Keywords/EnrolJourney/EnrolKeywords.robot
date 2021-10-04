*** Settings ***
Library     SeleniumLibrary
Library     RequestsLibrary
Library     Collections
Library     JSONLibrary
Library     OperatingSystem
Library     XML
Library     String

Variables   EmailString.py
Variables   EnrolObject.yaml

*** Variables ***
${auto}                        Automation
${bink}                        @bink.com
${emailString}                 ${emailStr}
${mailtrap}                    2705a98811-9a0461
${inbox}                       @inbox.mailtrap.io
${title1}                      Join Wasabi Club
${title2}                      Preparing your card
${dobDate}                     11
${dobMonth}                    10
${dobYear}                     1923
${first}                       first
${last}                        last
${lcdText}                     Add a credit/debit card
${REMOTE_URL}                  https://bularaghavan:9733a73c-cb14-42df-92f1-176df8de2c54@ondemand.eu-central-1.saucelabs.com:443/wd/hub

@{tmp}
   ...  name:MacOS + C
   ...  platform:macOS 11.00
   ...  browserName:chrome
   ...  tunnelIdentifier:bularaghavan_tunnel_id
   ...  version:latest

${capabilities}                ${EMPTY.join(${_tmp})}

*** Keywords ***
I enter my email_address in the Magic Link field
    ${emailStr}=  Catenate    ${mailtrap}+${emailString}${inbox}
    Set Test Variable     ${email}     ${emailStr}
    Input Text            ${magicLink.email}        ${email}

I click the Continue button
    Wait Until Element is Visible	    ${magicLink.continueButton}   5s
    Click Element                       ${magicLink.continueButton}
    Close Window

I load the Mailtrap Account
    [Arguments]      ${mailTrapUrl}       ${browser}
    Open Browser     ${mailTrapUrl}      ${browser}
    Maximize Browser Window

I load the Mailtrap Account in Sauce Labs
    [Arguments]      ${mailTrapUrl}       ${browser}
#    Open Browser     ${mailTrapUrl}      ${browser}     remote_url=${remote_url}   desired_capabilities=name:MacOS + C,platform:macOS 11.00,browserName:chrome,version:latest,tunnelIdentifier:bularaghavan_tunnel_id
     Open Browser     ${mailTrapUrl}      ${browser}     remote_url=${REMOTE_URL}    desired_capabilities=${DESIRED_CAPABILITIES}
     Maximize Browser Window

I log into Mailtrap account
    [Arguments]     ${mailUsername}     ${mailPassword}
    Wait Until Element is Visible        xpath=//button[text()='Accept']         15s
    Click Element         xpath=//button[text()='Accept']
    Input Text            xpath=//input[@type='email']       ${mailUsername}
    Input Text            xpath=//input[@type='password']     ${mailPassword}
    Click Element         xpath=//input[@type='submit']


I click Magic link from my Email inbox
    Wait Until Element is Visible          xpath=//a[contains(text(),'Inboxes')]    10s
    Click Element            xpath=//a[contains(text(),'Inboxes')]
 #  Wait Until Element is Visible       ${mailtrap.mailtrapInboxes}    5s
 #  Click Element        ${mailtrap.mailtrapInboxes}
    Wait Until Element is Visible       xpath=//a[@title ='Bink Web Automation Inbox']     5s
    Click Element        xpath=//a[@title ='Bink Web Automation Inbox']
    Sleep   20s
    Wait Until Element is Visible  xpath=//*[local-name()='svg'][@class='i4w4pc3 i4w4pc3--reload']       5s
    Click Element         xpath=//*[local-name()='svg'][@class='i4w4pc3 i4w4pc3--reload']
    Wait Until Element is Visible       xpath=//span[text()='Access your Wasabi Club account']   5s
    Click Element        xpath=//span[text()='Access your Wasabi Club account']
    Select Frame         tag:iframe
 #   Scroll Element Into View   xpath=//*[@id='bodyCell']/table[4]/tbody/tr[1]/td/table/tbody/tr[2]/td/a/img
    Wait Until Element is Visible   xpath=//td[@class='ctaButton']   timeout=5s
    Set Focus To Element        xpath=//td[@class='ctaButton']
    Click Element         xpath=//td[@class='ctaButton']


I can enter my details on Enrol Page Old
    Wait Until Element is Visible       ${joinWasabi.firstName}


I can enter my details on Enrol Page
    Wait Until Element is Visible       ${joinWasabi.firstName}   5s
    Input Text                          ${joinWasabi.firstName}        ${first}
    Input Text                          ${joinWasabi.lastName}         ${last}
    Select From List By Value           ${joinWasabi.dobDD}            ${dobDate}
    Select From List By Value           ${joinWasabi.dobMM}            ${dobMonth}
    Select From List By Value          ${joinWasabi.dobYY}            ${dobYear}
    Click Element                       ${joinWasabi.checkboxBinkTC}
    Click Element                       ${joinWasabi.checkboxRetTC}

I can click the Register button
    Wait Until Element is Visible       ${joinWasabi.registerButton}  5s
    Click Element                       ${joinWasabi.registerButton}

Enrol page is displayed
    Switch Window       NEW
    Sleep       5s
    Page should contain     ${title1}

I can see Preparing my card page
    Page should contain     ${title2}
    Sleep       10s

I can see my LCD Page
   Page should contain      ${lcdText}

Clean up Mailtrap Inbox
    Switch Window         MAIN
    Wait Until Element is Visible   xpath=//*[local-name()='svg'][@class='i4w4pc3 i4w4pc3--clear-inbox']      10s
    Click Element         xpath=//*[local-name()='svg'][@class='i4w4pc3 i4w4pc3--clear-inbox']
 #Accepts OK on the alert.
    Alert should be present

Logout of Mailtrap
    Wait Until Element is Visible        xpath=//span[text()='All messages are deleted in the inbox']       5s
    Click Element         xpath=//span[text()='All messages are deleted in the inbox']
    Wait Until Element is Visible   xpath=//span[text()='Demetris Williams']       15s
    Click Element         xpath=//span[text()='Demetris Williams']
    Wait Until Element is Visible        xpath=//*[local-name()='svg'][@class='i4w4pc3 i4w4pc3--clear-inbox']   10s
    Click Element            xpath=//*[local-name()='svg'][@class='i4w4pc3 i4w4pc3--leave i4w4pc3--primary']



