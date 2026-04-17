# ScoutOps Scan

A Flutter iOS app for scanning QR codes and barcodes at FRC (FIRST Robotics Competition) events. Scans match assignment QR codes, parses scouting data, and syncs to a Neon PostgreSQL database.

## Features

- QR code & barcode scanning via camera
- Automatic Base64 + GZIP decoding of compressed QR payloads
- Match info display (alliance, station, match number)
- Scan history with per-match station tracking
- CSV export via iOS share sheet
- Neon database sync over HTTP
- Fully iOS-native build

## Building the IPA

This project uses GitHub Actions to build an unsigned `.ipa` on a macOS runner.

1. Push your code to GitHub
2. Go to **Actions** → **iOS-ipa-build** → **Run workflow**
3. Wait ~4 minutes for the build to complete
4. Download `FlutterIpaExport.ipa` from the **Releases** section

> Requires **Settings → Actions → General → Workflow permissions** set to **Read and write**.

## Installing on Device (Windows)

Since the IPA is unsigned, use a sideloading tool:

- [Sideloadly](https://sideloadly.io) — drag and drop the IPA, sign with your Apple ID
- [AltStore](https://altstore.io) — alternative sideloader

The app is valid for **7 days** per free Apple ID signing. Re-run Sideloadly to re-sign.

## Database Setup

1. Create a free project at [neon.tech](https://neon.tech)
2. Open the app → tap the settings icon (top right)
3. Paste your Neon connection string (`postgresql://...`)
4. Tap **Save & Test Connection**

The app will auto-create the `scouting_data` table on first sync.

## Tech Stack

- Flutter (Dart)
- [mobile_scanner](https://pub.dev/packages/mobile_scanner) — camera scanning
- [Hive](https://pub.dev/packages/hive) — local config storage
- [share_plus](https://pub.dev/packages/share_plus) — CSV export
- [Neon](https://neon.tech) — serverless PostgreSQL
- GitHub Actions — iOS IPA CI pipeline
