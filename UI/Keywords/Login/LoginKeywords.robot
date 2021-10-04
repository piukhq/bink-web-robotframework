*** Settings ***
Library  SeleniumLibrary
Library  Collections

Variables   LoginObject.yaml
*** Variables ***
${REMOTE_URL}                  https://bularaghavan:9733a73c-cb14-42df-92f1-176df8de2c54@ondemand.eu-central-1.saucelabs.com:443/wd/hub
${DESIRED_CAPABILITIES}        name:MacOS + C,platform:macOS 11.00,browserName:chrome,version:latest,tunnelIdentifier:bularaghavan_tunnel_id
@{tmp}

*** Keywords ***
Bink Web Page is loaded in Saucelabs
    [Arguments]       ${url}        ${browser}      ${DESIRED_CAPABILITIES}
    Set Selenium Speed                  0.5s
#	Open Browser	                    ${url}        ${browser}    remote_url=https://bularaghavan:9733a73c-cb14-42df-92f1-176df8de2c54@ondemand.eu-central-1.saucelabs.com:443/wd/hub   desired_capabilities=name:MacOS + C,platform:macOS 11.00,browserName:chrome,version:latest,tunnelIdentifier:bularaghavan_tunnel_id
    Open Browser     ${url}        ${browser}    remote_url=${REMOTE_URL}   desired_capabilities=${DESIRED_CAPABILITIES}
    Wait Until Element is Visible	    ${login.username}   10s
	Maximize Browser Window

Bink Web Page is loaded
    [Arguments]       ${url}        ${browser}
    Set Selenium Speed                  0.5s
	Open Browser	                    ${url}        ${browser}
    Wait Until Element is Visible	    ${login.username}   10s
	Maximize Browser Window


I enter my email_address and password in the relevant fields
    [Arguments]          ${email}     ${password}
    Input Text	                        ${login.username}	${email}
	Input Text	                        ${login.password}	${password}

I click the Login button
	Click Element	                    ${login.loginButton}
	Builtin.sleep       5s

I am logged into my account
    Wait Until Element is Visible	     ${LoyaltyCard.WasabiHeroImg}     10s

I can see my Loyalty Card
    Click Element                        ${LoyaltyCard.WasabiHeroImg}
    Wait Until Element is Visible	     ${LoyaltyCard.WasabiAltHeroImg}    5s
    CLick Element                        ${LoyaltyCard.AltHeroCloseButton}





