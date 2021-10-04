*** Settings ***

Library  SeleniumLibrary
Library  Collections

Variables   PaymentCardsObject.yaml

*** Keywords ***
I click the Add Payment Card button on LCD
#Click the Add + button on LCD to add Payment card
     Wait Until Element is Visible	    ${addPaymentCard.addPayCardIcon}   3s
     Click Element                       ${addPaymentCard.addPayCardIcon}

I can add Payment card with cardholderName and cardNumber
    [Arguments]    ${cardHolderName}    ${cardNumber}
#Input the field values on Add credit/debit card modal
     Click Element                       ${addPaymentCard.addPayModalExpMonth}
     Click Element                       ${addPaymentCard.addPayModalExpYear}
     Input Text                          ${addPaymentCard.addPayModalCardholderName}     ${cardHolderName}
#Select Card Number which is inside Spreedly Iframe
     Select Frame                        tag:iframe
     Input Text                          ${addPaymentCard.addPayModalCardNumber}         ${cardNumber}
     Unselect Frame
#Click Add credit/debit card button
     Wait Until Element is Visible	    ${addPaymentCard.addPayCardButton}    3s
     Click Element                       ${addPaymentCard.addPayCardButton}

I can delete Payment card
#Enter the last 4 digits of the card and click Remove card button.
    [Arguments]    ${lastFourDigits}
     Wait Until Element is Visible	    ${deletePaymentCard.deletePayCardButton}   5s
     Click Element                      ${deletePaymentCard.deletePayCardButton}
     Input Text                         ${deletePaymentCard.deletePayCardNo}     ${lastFourDigits}
     Click Element                      ${deletePaymentCard.removeCardButton}

I click the Add a credit/debit card section on LCD
#Click the Add credit/debit card red button on LCD
     Wait Until Element is Visible	    ${addPaymentCard.addAPaymentCardButton}   3s
     Click Element                       ${addPaymentCard.addAPaymentCardButton}