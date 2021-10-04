*** Settings ***
Library  SeleniumLibrary
Library  Collections

Variables   WasabiClubSupportObject.yaml

*** Keywords ***
I click the Wasabi Club Support Icon
#Click the cog wheel icon for Wasabi Club Support icon
     Wait Until Element is Visible	    ${wasabiClubSupport.wasabiClubSupportIcon}   3s
     Click Element                      ${wasabiClubSupport.wasabiClubSupportIcon}

I click the Logout Button
     Wait Until Element is Visible	    ${wasabiClubSupport.logoutButton}   3s
     Click Element                      ${wasabiClubSupport.logoutButton}

Logout out of Bink Web
    I click the Wasabi Club Support Icon
    I click the Logout Button

Close Browser Window
    Close All Browsers