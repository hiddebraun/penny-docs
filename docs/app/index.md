# App Development


## Developing

```bash
npx expo start -c
```


## Building

### Building development version of app


Need a running development server for this

```bash
# Local build (needs Android studio)
npx expo run:android (--no-build-cache)

# Local build (needs Xcode and iOs Simulator)
npx expo run:ios (--no-build-cache)

```

**Android**

```bash
eas build --platform android --profile development
```
**iOS**

```bash
eas build --platform ios --profile development
```

### Building preview version of app

```bash
eas build --platform android --profile preview
```

```bash
eas build --platform ios --profile preview
```

#### Building locally using EAS

```bash
# Development
eas build --local --platform android --profile development

## Preview 
eas build --local --platform android --profile preview
```

**iOS Simulator**

```bash
# For iOS Simulator
eas build --platform ios --profile ios-simulator --local

# Untar/gzip the build file > Penny.app
tar -zxvf build-xxxxxxxxxx.tar.gz

# Install it
xcrun simctl install booted Penny.app
```

## Sharing with Team / Device registration for previewing

Build a preview version of the app. Expo shares a link (+ QR code) that you share. The link guides team members to install the preview build on their device.

Apple / iOS devices need to be registered separately with the Apple Developer account using:

```bash
 eas device:create (list|view|rename|delete)
```

**More info**

- [Internal Distribution Builds](https://docs.expo.dev/tutorial/eas/internal-distribution-builds/)
- [Sharing Preview build with team](https://docs.expo.dev/review/overview/)
- [Iphone Device registration](https://expo.dev/register-device/50145e0f-3d2c-484f-865a-3d04c7955500)



## Updating

### Pushing updates to preview app and channel

```bash
eas update --branch preview --message "Nieuwe update"
```

## Build/ project troubleshooting 

### Android

- Hele android of ios folder wissen
- ```npx prebuild --platform android```
- ```cd android && ./gradlew clean```


### Checking versions

```bash
npx expo install --check
```