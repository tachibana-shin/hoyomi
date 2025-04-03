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

- [ ] Page eiga details

- [ ] Fix zoomer read manga

- [ ] Responsive for video player
- [ ] AppBar all page

- [ ] API comment for eiga
- [ ] API follow anime
- [ ] API notification

- [ ] A11y manga reader
- [ ] API playlist
- [ ] API playlist online

- [ ] Search icon for all section
- [ ] Bottom sheet show all options

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

-----
### Setup Serverless
To deploy the serverless application, you need to set up a serverless provider. Here are the steps to set up Deno:

#### Step 1: Configure the Firebase Admin
Please goto `Project Settings`
![image](https://github.com/user-attachments/assets/620edb61-7ce8-43f4-ab6b-01de9b558d01)

1. Click to `Generate new private key`
2. Paste file download to `serverless/service-account-key.json`

#### Step 2: Configre the Xata database
The server required xata database for working
1. Run `cd serverless`
2. Run `xata init` and select project. The command auto create new file `.env`
3. Add `XATA_DATABASE_URL` from `setting project` xata to `.env`

-----
### Setup Application

#### Step 1 (Required in mobile platform)
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

#### Step 2 (Required in desktop platform)
Goto https://console.cloud.google.com/apis/credentials and get `Client ID` and `Client secret` from `OAuth 2.0 Client IDs` (Use `Web application`)

Set to `.env`
```env
GOOGLE_CLIENT_ID=<Client ID>
GOOGLE_CLIENT_SECRET=<Client secret>
```
#### Step 3
Set to `.env`
```env
BASE_API_GENERAL=<URL base API general serverless>
```

### GitHub Actions

To release the application, the following `secrets` must be provided:
### General
- `ENV_CONTENT` - Content of the `.env` file. (not encode base64)

### **For Android**
- `KEYSTORE_CONTENT` - Base64-encoded content of the `keystore.jks` file.
- `KEYSTORE_PASSWORD` - Password used to sign the `keystore.jks` file.
- `KEYSTORE_ALIAS` - Alias used to sign the `keystore.jks` file.
- `GOOGLE_SERVICES_JSON` - Base64-encoded content of the `google-services.json` file (automatically generated by `flutterfire`).

### **For iOS**
- `GOOGLE_SERVICE_INFO_PLIST` - Base64-encoded content of the `GoogleService-Info.plist` file (automatically generated by `flutterfire`).

> **Note**: The `google-services.json` (for Android) and `GoogleService-Info.plist` (for iOS) files are automatically created when you run the `flutterfire configure` command during Firebase setup.