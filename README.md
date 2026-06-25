<h1 align="center">
  <br>
  🩺 MediPass
  <br>
</h1>

<h4 align="center">Your Digital Medical Passport & Smart Health Companion</h4>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white" />
  <img src="https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white" />
  <img src="https://img.shields.io/badge/Firebase-Auth-FFCA28?style=for-the-badge&logo=firebase&logoColor=black" />
  <img src="https://img.shields.io/badge/Gemini_AI-2.5_Flash-4285F4?style=for-the-badge&logo=google&logoColor=white" />
  <img src="https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web-informational?style=for-the-badge" />
</p>

---

## 📌 About The Project

**MediPass** is a modern, cross-platform digital health application built with Flutter. It serves as a secure, centralized hub for your personal medical information — giving you instant access to your health records, a scannable QR emergency ID, and an intelligent AI-powered skin analysis tool, all from one place.

> Built for the real world — whether you're visiting a doctor, handling a medical emergency, or just tracking your daily health.

---

## ✨ Key Features

### 🪪 Digital Medical Passport (QR ID)
- Every user gets a unique **Patient ID** (e.g., `MP-88234-PK`)
- A **QR Code** is auto-generated that emergency responders or doctors can scan to instantly access:
  - Name, Age, Blood Group
  - Emergency Contact Number
  - Patient Identification Code

### 🔬 Smart Skin Analysis (Dual-Mode AI)

The highlight of MediPass — an intelligent skin health scanner with **two modes**:

| Mode | Description | Internet Required? |
|------|-------------|-------------------|
| **On-Device Analyzer** | Uses pixel-level computer vision (redness ratio + texture variance) to detect conditions | ❌ No |
| **Cloud AI Analyzer** | Powered by **Google Gemini 2.5 Flash** for deep multimodal analysis | ✅ Yes (Free API Key) |

Each result includes: **Condition Name**, **Confidence Score**, **Severity Level**, **Observed Characteristics**, and **Wellness Recommendations**.

### 📁 Medical Records
- View and access categorized **Prescriptions** and **Lab Reports** in one organized screen
- Clean, tappable record cards with detailed view navigation

### 👨‍👩‍👧 Family Health Profiles
- Link and manage family member profiles (e.g., Mother, Father)
- Keep emergency contacts and linked family health data within reach

### 👤 Personal Health Profile
- Displays personal health card with name, age, blood group, and emergency contact
- Acts as the base identity for the QR Passport

### 🔐 Secure Authentication
- **Firebase Authentication** — Email & Password Sign Up / Login
- Password confirmation on registration
- Display name update after account creation

### ⚙️ Settings & Customization
- Configure your personal **Gemini API Key** for Cloud AI scans (stored securely on-device)
- Toggle between On-Device and Cloud AI analysis modes
- Privacy-first: API keys are never sent to a third-party server

---

## 🧱 Tech Stack

| Layer | Technology |
|-------|-----------|
| **Framework** | Flutter (Dart) |
| **UI Design** | Material 3, Custom Widgets |
| **Authentication** | Firebase Auth |
| **Cloud AI** | Google Gemini 2.5 Flash API |
| **On-Device Analysis** | Dart `image` package (pixel heuristics) |
| **Networking** | `http` package |
| **Local Storage** | `shared_preferences` |
| **Image Input** | `image_picker` (Mobile + Web compatible) |
| **Target Platforms** | Android, iOS, Web, Windows, macOS, Linux |

---

## 📂 Project Structure

```
lib/
├── main.dart                  # App entry point, Firebase init, routes
├── screens/
│   ├── splash.dart            # Animated splash screen
│   ├── login.dart             # Firebase login
│   ├── signup.dart            # Firebase registration
│   ├── home_screen.dart       # Main dashboard (bottom nav)
│   ├── profile.dart           # User health profile
│   ├── qr.dart                # QR Medical Passport screen
│   ├── records.dart           # Medical records list
│   ├── record_details.dart    # Detailed record view
│   ├── family.dart            # Family members list
│   ├── add_family.dart        # Add new family member
│   ├── skin_analysis.dart     # AI Skin Scanner (Dual Mode)
│   ├── settings.dart          # App settings & API config
│   ├── notifications.dart     # Notifications screen
│   ├── help.dart              # Help & Support
│   ├── about.dart             # About MediPass
│   ├── image_picker_io.dart   # Image picker for mobile
│   └── image_picker_web.dart  # Image picker for web
└── widgets/
    ├── api_config.dart        # Gemini API key manager (SharedPrefs)
    ├── custom_card.dart       # Reusable info card widget
    └── dashboard_widgets.dart # Action tile widget
```

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK `^3.11.0`
- Dart SDK `^3.11.0`
- A Firebase project with **Authentication** enabled (Email/Password)
- *(Optional)* A free Gemini API Key from [Google AI Studio](https://aistudio.google.com/apikey)

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/medipass.git
cd medipass
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Firebase Setup

The app is pre-configured with a Firebase project. To connect your own:
- Create a project at [Firebase Console](https://console.firebase.google.com/)
- Enable **Email/Password Authentication**
- Replace the `FirebaseOptions` values in [`lib/main.dart`](lib/main.dart)

### 4. Run the App

```bash
# Run on connected device or emulator
flutter run

# Run on Chrome (Web)
flutter run -d chrome
```

---

## 🤖 Using the Skin AI Scanner

### Option 1 — Free On-Device Mode (No Setup Required)
1. Open the app → Home → **AI Scanner**
2. Make sure **On-Device** mode is selected (default)
3. Tap **Upload & Analyze** → pick a skin photo
4. Results appear instantly with condition, severity, and care tips

### Option 2 — Cloud AI Mode (Gemini 2.5 Flash)
1. Get a **free** Gemini API Key from [aistudio.google.com](https://aistudio.google.com/apikey) *(No credit card needed)*
2. In the app, go to Settings → **Gemini API Key** → paste and save
3. Toggle **Cloud AI Mode** on in the Skin Analysis screen
4. Upload your skin image — Gemini performs a deep multimodal scan

---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^4.11.0       # Firebase initialization
  firebase_auth: ^6.5.3        # User authentication
  image: ^4.2.0                # On-device pixel analysis
  image_picker: ^1.1.2         # Camera/gallery image selection
  http: ^1.1.0                 # REST API calls (Gemini)
  shared_preferences: ^2.2.2   # Local secure storage
  cupertino_icons: ^1.0.8      # iOS style icons
```

---

## 📸 App Screens

| Screen | Description |
|--------|-------------|
| Splash | Animated branded loading screen |
| Login / Signup | Secure Firebase auth forms |
| Home Dashboard | Overview, AI Scanner & QR shortcuts |
| Medical Records | Prescriptions & Lab Reports |
| Family | Linked family health profiles |
| Profile | Personal health card |
| QR Passport | Scannable emergency identity |
| Skin Analyzer | Dual-mode AI skin health scan |
| Settings | API key config, preferences |

---

## 🔒 Privacy & Security

- **No medical data is stored on external servers** by default
- Gemini API Key is stored **only on the user's device** using `SharedPreferences`
- All image data processed by Cloud AI is sent directly to Google's secure API endpoint and not stored by MediPass
- Firebase Authentication uses industry-standard encryption

---

## 🛠️ Future Enhancements

- [ ] Cloud sync for medical records (Firebase Firestore)
- [ ] Appointment reminders and notification push service
- [ ] Multilingual support (Urdu, Arabic, etc.)
- [ ] PDF export of medical passport
- [ ] Real QR Code generation using a QR package
- [ ] Doctor search and appointment booking module
- [ ] Dark mode support

---

## 👩‍💻 Developer

**Areeba**  
Project: MediPass — Digital Health Companion  
Platform: Android | iOS | Web  
Firebase Project: `medi-pass`

---

## 📄 License

This project is private and intended for academic/portfolio use. All rights reserved © 2024 MediPass.

---

<p align="center">Made with ❤️ using Flutter & Firebase</p>
