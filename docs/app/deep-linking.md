# Deep linking into app

See:

## Testing locally

**Using Expo CLI and development build**

```bash
# Android device / emulator
npx uri-scheme open "penny-ai://app/verify-account?code=test123" --android

# iOS simulator
npx uri-scheme open "penny-ai://app/verify-account?code=test123" --ios
```

**Android device/emulator (using ADB)**

```bash
# Custom scheme
adb shell am start -W -a android.intent.action.VIEW -d "penny-ai://app/verify-account?code=test123" com.pennyai.app

# HTTPS deep link (if configured)
adb shell am start -W -a android.intent.action.VIEW -d "https://penny-ai.com/app/verify-account?code=test123" com.pennyai.app
```

**iOS Simulator**

```bash
# Open the deep link
xcrun simctl openurl booted "penny-ai://app/verify-account?code=test123"
```


## Test verification token

Testing token for hidde.braun@gmail.com account:

```eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJoaWRkZS5icmF1bkBnbWFpbC5jb20iLCJleHAiOjE3NjM3Mjg1NzEsInR5cGUiOiJ2ZXJpZmljYXRpb24ifQ.u9FALLJxpm4tQjuOQuzIDSNZ9fWCnZv_dLIQUMugOaI```

**Geldige token via CLI**

```bash
adb shell am start -W -a android.intent.action.VIEW -d "https://penny-ai.com/app/verify-account?code=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJoaWRkZS5icmF1bkBnbWFpbC5jb20iLCJleHAiOjE3NjM3Mjg1NzEsInR5cGUiOiJ2ZXJpZmljYXRpb24ifQ.u9FALLJxpm4tQjuOQuzIDSNZ9fWCnZv_dLIQUMugOaI" com.pennyai.app
```

**Ongeldige token via CLI**

`````bash
adb shell am start -W -a android.intent.action.VIEW -d "https://penny-ai.com/app/verify-account" com.pennyai.app
```

**Ongelidig account via CLI**

```bash
# hidde.braun1@gmail.com
adb shell am start -W -a android.intent.action.VIEW -d "https://penny-ai.com/app/verify-account?code=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJoaWRkZS5icmF1bjFAZ21haWwuY29tIiwiZXhwIjoxNzYzNzM2OTA1LCJ0eXBlIjoidmVyaWZpY2F0aW9uIn0.5PfUSrPIrxpwhrldYSgUeyBIgVhCT7H8KY7-fwB4QmA" com.pennyai.app
```