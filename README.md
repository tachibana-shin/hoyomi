## 📱 Hoyomi — Your Ultimate Anime & Manga Companion

<p align="center">
 <img width=200px height=200px src="https://github.com/user-attachments/assets/93daccd8-7ad3-408e-b184-178738219430"/>
</p>

<h1 align="center"> Hoyomi </h1>

**Hoyomi** is a modern, open-source application designed to provide a seamless experience for **watching anime** and **reading manga**. It's built to be **lightweight**, **fast**, and **fully cross-platform**, running smoothly on Android, iOS, Linux, macOS, Windows, and the web.

> [!WARNING]
> This application is currently under active development.

---

### ✨ Features

- 🎥 **Stream anime** with advanced subtitle support (custom fonts, colors, styles).
- 📚 **Read manga** from diverse sources with a clean, scrollable reader.
- 🌐 **Multi-platform**: Enjoy content on mobile, desktop, and web.
- 🎨 **Highly customizable UI**: Personalize your experience with dark/light themes, font settings, and subtitle styles.
- 💬 **Offline support**: Cache and view anime/manga offline (feature in development).
- 🧩 **Plugin-friendly**: Extend functionality with community-built integrations using TypeScript.
- 🔐 **Privacy-first**: No tracking, no ads, and no personal data collection.

---

### ⬇️ Download & Installation

Get the latest version of Hoyomi from our [releases page](https://github.com/tachibana-shin/hoyomi/releases).

**iOS Sideloading:**
For iOS users, Hoyomi supports sideloading via various tools like AltStore, SideStore, and TrollStore. You can find direct installation links and more details on the [releases page](https://github.com/tachibana-shin/hoyomi/releases).

---

### 🛠️ Development Setup

To set up Hoyomi for development, follow these steps:

#### Prerequisites

-   **Flutter SDK**: Ensure you have Flutter installed and configured.
-   **Firebase CLI**: Required for Firebase project setup.
-   **Deno**: Required for deploying serverless functions.

#### Step 1: Firebase Project Configuration

1.  Create a new project in the [Firebase console](https://console.firebase.google.com/).
2.  Enable `Google` sign-in under `Authentication` -> `Sign-in Method`.
3.  Configure OAuth client credentials in Google Cloud Console:
    *   Choose `Web application`.
    *   Set `Authorized redirect URIs` and `Authorized JavaScript origin` to `http://localhost`.
4.  Generate a Firebase Admin SDK private key (`service-account-key.json`) from `Project Settings` -> `Service accounts`. Place this file in `serverless/service-account-key.json`.

#### Step 2: Database Configuration

Hoyomi's serverless functions require a PostgreSQL database.
1.  Navigate to the `serverless` directory: `cd serverless`.
2.  Add your `DATABASE_URL` to a `.env` file within the `serverless` directory.

#### Step 3: Application Environment Variables

Create a `.env` file in the project root and set the following variables:

```env
GOOGLE_CLIENT_ID=<Your Google OAuth Client ID>
GOOGLE_CLIENT_SECRET=<Your Google OAuth Client Secret>
BASE_API_GENERAL=<URL of your deployed serverless API>
```

#### Step 4: FlutterFire Configuration (Mobile Platforms)

Run `flutterfire configure` to generate platform-specific Firebase configuration files:
-   `/android/app/google-services.json` (for Android)
-   `/ios/Runner/GoogleService-Info.plist` (for iOS)

> **Note for iOS Development:** If developing for iOS, you may need to edit `CFBundleURLSchemes` in `ios/Runner/Info.plist`.

---

### 🤝 Contributing

Hoyomi is an open-source project and welcomes contributions!
-   **Service Development**: Explore examples for creating 3rd-party services using TypeScript:
    -   [lib/core_services/comic/services](lib/core_services/comic/services) - Services for comics, manga, etc.
    -   [lib/core_services/eiga/services](lib/core_services/eiga/services) - Services for eiga (films), etc.
    -   [hoyomi_bridge_ts/example](./hoyomi_bridge_ts/example) - Example TypeScript plugin.
    -   [hoyomi-plugin-animehay](https://github.com/tachibana-shin/hoyomi-plugin-animhay) - An example anime plugin.

#### Creating New Plugins

Hoyomi's architecture allows for easy extension through custom plugins written in TypeScript. You can create new comic or eiga services by following these general steps:

1.  **Define your service interface**: Create a TypeScript file that defines the methods and data structures for your comic or eiga service, adhering to the `hoyomi_bridge_ts` conventions.
2.  **Implement the service logic**: Write the actual logic for fetching data, parsing content, and handling interactions within your TypeScript service.
3.  **Register your plugin**: Use the `hoyomi_bridge_ts` to register your implemented service, making it available to the Hoyomi application.

Refer to the existing examples for detailed implementation patterns:
-   [hoyomi_bridge_ts/example](./hoyomi_bridge_ts/example)
-   [hoyomi-plugin-animehay](https://github.com/tachibana-shin/hoyomi-plugin-animhay)

---

### 📦 Available On

-   ✅ Android
-   ✅ iOS
-   ✅ Windows (.exe)
-   ✅ Linux (.deb, .AppImage)
-   ✅ macOS (.dmg)
-   ✅ Web (PWA)

---

### 📸 Screenshot Preview

<img src="https://github.com/user-attachments/assets/bc0df2fb-91d7-4a49-bfcc-23c576fc9c61" width="120px">
<img src="https://github.com/user-attachments/assets/31e19481-b8c2-423c-be62-1e7322605c50" width="120px">
<img src="https://github.com/user-attachments/assets/3a91eac8-fa1f-403e-b3af-1ba2a83b4ff5" width="120px">
<img src="https://github.com/user-attachments/assets/f2c8a6f5-b510-4376-920e-cab94a921ad6" width="120px">
<img src="https://github.com/user-attachments/assets/c49ce47d-bd98-438b-b166-7680606ee400" width="120px">
<img src="https://github.com/user-attachments/assets/9a8e5175-b07f-4c7a-8624-ac1c6bf1237b" width="120px">
<img src="https://github.com/user-attachments/assets/f9af1188-c57f-4131-a60f-e66c0e3d25e1" width="120px">
<img src="https://github.com/user-attachments/assets/b3f0162f-1c20-4d1f-95c1-e7998cdeb89a" width="120px">
<img src="https://github.com/user-attachments/assets/3c281173-e317-4d4d-98c6-8b18b8a6b438" width="120px">
<img src="https://github.com/user-attachments/assets/0e62df4b-984d-4b27-a22c-ca98a37cedee" width="120px">
<img src="https://github.com/user-attachments/assets/d38e708b-d2f9-4379-a9cd-8de985100f7a" width="120px">
<img src="https://github.com/user-attachments/assets/00c394f7-13ae-4bdb-9119-21e0d78770b7" width="120px">
<img src="https://github.com/user-attachments/assets/d0b7c834-797f-41c1-b253-8cfe753429eb" width="120px">
<img src="https://github.com/user-attachments/assets/0fc95982-e8c8-4dd2-8c58-9c5069152075" width="120px">

---

### 🗺️ Roadmap (Todo)

-   [ ] Add background image for `details_comic`
-   [ ] Add information `book` for reader
-   [ ] Fix logic fake page
-   [ ] Page eiga details
-   [ ] Fix zoomer read manga
-   [ ] Responsive for video player
-   [ ] AppBar all page
-   [ ] API comment for eiga
-   [ ] API follow anime
-   [ ] API notification
-   [ ] A11y manga reader
-   [ ] API playlist
-   [ ] API playlist online
-   [ ] Search icon for all section
-   [ ] Bottom sheet show all options
-   [ ] Add multiple server in eiga

---

### 🛡️ Privacy & EULA

Hoyomi does **not collect**, **store**, or **share** your personal data. Your activity stays on your device. See our full [Privacy Policy](https://github.com/tachibana-shin/hoyomi/blob/main/privacy-policy.md) and [EULA](https://github.com/tachibana-shin/hoyomi/blob/main/EULA.md) for details.

---

### 📄 License

Hoyomi is released under the [MIT License](LICENSE).

---

### ❤️ Built with Flutter. Made with love in Japan-inspired spirit.