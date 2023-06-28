# ``Authenticator``

This framework is designed for authentic user with biometric(Touch Id or Face Id)

## Overview


## Usage
To use Login authentic by biometric in your login class, follow below steps :
. import Authenticator in Header
. Inititalize AuthenticatorCoordinator class with delegate
. extend LocalAuthentication protocol which have 3 methods
    1. notEligibleForAuthentication - User device don't have capability for biometric authentication. Show error dialogue alert.
    2. authenticationSuccess - User successfully authenticate. do your next step(present other viewcontroller)
    3. authenticationFailure - User unable to verified due to other reason - face not match, sunglass, facemask user using. Show error dialogue alert with retry.
