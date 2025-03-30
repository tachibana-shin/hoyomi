# hoyomi

A new Flutter project.

> [!WARNING]
> App is development

> [!TIP]
> Multi-source, multi-platform manga reading and anime viewing application for free

## Screenshot preview

![1000008167](https://github.com/user-attachments/assets/9fcd09f8-ca21-4a13-ae9a-92dffb67dd36)
![1000008169](https://github.com/user-attachments/assets/1fe91f68-9beb-4d7b-bf48-ccd00b7ca0ba)
![1000008171](https://github.com/user-attachments/assets/1f1f64da-d84c-4e1b-a0ee-cb973be30503)
![1000008173](https://github.com/user-attachments/assets/7f113ae6-99ed-47d7-8de3-a095eaeda119)
![1000008175](https://github.com/user-attachments/assets/715c5308-87db-4e0e-a24f-36618fdb46d6)
![1000008186](https://github.com/user-attachments/assets/1370beb7-0885-4717-a4b0-7016235338f6)
![1000008179](https://github.com/user-attachments/assets/66003d32-a2eb-4347-8a2f-756153441ce3)
![1000008181](https://github.com/user-attachments/assets/c9c80348-e688-4dad-b46a-a2e15596e2ae)
![1000008178](https://github.com/user-attachments/assets/fc761863-f1b3-4397-a508-29ecbdc9641e)
![1000008182](https://github.com/user-attachments/assets/99d4ae8b-a413-4fff-9d34-d69f8aaa1cbd)
![1000008183](https://github.com/user-attachments/assets/2dfc89c9-3c67-48e6-aa8e-c3f2cfdc5931)
![1000008184](https://github.com/user-attachments/assets/581a25c7-5b63-498b-8ec7-93ee2dc9e738)

## Support platform
- [x] Android
- [x] Isar for android SDK <= 23
- [x] iOS side via TrollStore
- [x] iOS side by other methods


## Todo
- [ ] Add background image for `details_comic`
- [ ] Add information `book` for reader
- [ ] Fix logic fake page

- [x] Add time count down for eiga
- [x] Add carousel for eiga
- [ ] Page eiga details

- [ ] Fix zoomer read manga

- [ ] Responsive for video player
- [ ] AppBar all page

- [x] Show modal more episodes
- [x] Show modal more info
- [x] Custom slider video
- [x] API skip opening / ending for eiga
- [ ] API comment for eiga
- [x] Increase font size
- [ ] API follow anime
- [ ] API notification

- [ ] A11y manga reader
- [x] Back button in fullscreen in eiga
- [x] Can't emit event moving progress in eiga
- [x] Can't show controls if controller pending in eiga
- [x] Fix follow eiga
- [x] API season eiga
- [x] API search eiga
- [x] API for history online
- [ ] API playlist
- [ ] API playlist online

- [ ] Search icon for all section
- [ ] Bottom sheet show all options

- [x] Cache for API: eiga info, eiga play, eiga follow...
- [x] Replace circular loading with skeleton
- [x] Fix pull request, circular, future

- [x] Fix infinite scroll
- [x] Fix section not update on change filters

- [x] Fix manga layout

- [x] Page settings for services

- [ ] Add multiple server in eiga
<!-- provider or mobx -->

## Development

### Prerequisites
#### Step 1: Set up the Firebase project
The first step is to set up the Firebase project and enable Google sign-in. if you already have a flutter project, you can skip this step.

1. Go to the [Firebase console](https://console.firebase.google.com/) and create a new project.
2. Click on the `Authentication` link in the left-hand menu, then click on the `Sign-in Method` tab.
3. Enable the `Google` sign-in method.


#### Step 2: Configure the OAuth client
You need your application's client ID and Secret from Google Cloud Console to enable Google sign-in. If you’ve it already then skip this step.

- To get the client ID and secret, follow the steps from the given [link](https://support.google.com/cloud/answer/6158849?hl=en).
- Choose `a web application`.
- In the `Authorized redirect URIs` and `Authorized JavaScript origin`, enter the URL `http://localhost`

### Step 3: Configure the Firebase Admin
Please goto `Project Settings`
![image](https://github.com/user-attachments/assets/620edb61-7ce8-43f4-ab6b-01de9b558d01)

1. Click to `Generate new private key`
2. Paste file download to `serverless/service-account-key.json`

### Step 4: Configre the Xata database
The server required xata database for working
1. Run `xata init` and select project. The command auto create new file `.env`
2. Add `XATA_DATABASE_URL` from `setting project` xata to `.env`

-----
Next

### Step 1 (Required in mobile platform)
> [!TIP]
>
> This project depends Firebase. Please first run
> ```bash
> flutterfire configure
> ```
> 
> and configuring file `/android/app/google-services.json`, `/ios/Runner/GoogleService-Info.plist` (two file auto create by `flutterfire`)

- `/android/app/google-services.json` required for Android
- `/ios/Runner/GoogleService-Info.plist` required for iOS

> [!TIP]
> 
> **NOTE** (If you development for iOS)
>
> Please edit `CFBundleURLSchemes` in `ios/Runner/Info.plist`

### Step 2 (Required in desktop platform)
Goto https://console.cloud.google.com/apis/credentials and get `Client ID` and `Client secret` from `OAuth 2.0 Client IDs` (Use `Web application`)

Set to `.env`
```env
GOOGLE_CLIENT_ID=<Client ID>
GOOGLE_CLIENT_SECRET=<Client secret>
```

## Firebase Configuration

The `google-services.json` (for Android) and `GoogleService-Info.plist` (for iOS) files required for Firebase integration will be automatically generated by `flutterfire`. You do not need to manually create or download these files.

To set up Firebase for your project, follow these steps:

1. Run the `flutterfire` CLI tool:
   ```bash
   flutterfire configure
   ```

2. Select your Firebase project or create a new one.

3. The tool will automatically generate the necessary configuration files and place them in the appropriate directories.

4. Once the setup is complete, you can build and run your app with Firebase integration.

For more details, refer to the [FlutterFire documentation](https://firebase.flutter.dev/docs/cli/).

## GitHub Actions

To release the application, the following `secrets` must be provided:

### **For Android**
- `KEYSTORE_CONTENT` - Base64-encoded content of the `keystore.jks` file.
- `KEYSTORE_PASSWORD` - Password used to sign the `keystore.jks` file.
- `KEYSTORE_ALIAS` - Alias used to sign the `keystore.jks` file.
- `GOOGLE_SERVICES_JSON` - Base64-encoded content of the `google-services.json` file (automatically generated by `flutterfire`).

### **For iOS**
- `GOOGLE_SERVICE_INFO_PLIST` - Base64-encoded content of the `GoogleService-Info.plist` file (automatically generated by `flutterfire`).

> **Note**: The `google-services.json` (for Android) and `GoogleService-Info.plist` (for iOS) files are automatically created when you run the `flutterfire configure` command during Firebase setup.