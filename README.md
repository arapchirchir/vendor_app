# Letsy Vendor

A Flutter vendor management app for multi-vendor commerce and food delivery businesses. This project is built for shop owners and vendors to manage products, orders, payouts, store setup, promotions, customer communication, and business operations from a single mobile app.

## Overview

This app is a vendor-focused companion to a multivendor marketplace platform and includes support for:

- Product and category management
- Order tracking and status updates
- Delivery staff management
- Store banners and advertisements
- Coupons, campaigns, and promotions
- Wallet, payouts, and bank information
- Store profile and business setup
- Chat and push notifications
- Subscription and business plan management
- Rental module support for vehicle services

## Project details

- App name: Letsy Vendor
- Platform: Flutter
- SDK: Flutter 3.10+ (3.44.2 recommended)
- Package name: `sixam_mart_store`
- Backend/API base URL: `https://admin.letsy.co.ke`

## Features

### Store management
- Add, update, and manage items and categories
- Assign products to categories and manage stock
- Manage store banners, ads, and reels
- Update business information and status

### Orders and fulfilment
- View active, completed, and historical orders
- Update order status and invoice details
- Manage delivery personnel and assignment
- Handle order edits and cancellations

### Revenue and payments
- Wallet tracking and payment history
- Withdrawal methods and disbursement reports
- Payment flow for vendor subscriptions and business plans

### Growth and marketing
- Campaign participation and promotional plans
- Coupon management
- Product reviews and performance-related content
- AI-based product data generation modules

### Communication and support
- Vendor chat and messaging features
- Push notifications for app events
- Profile, settings, and language localization

## Repository structure

```text
lib/
  common/              # shared widgets and models
  features/            # feature modules (auth, orders, products, chat, payments, etc.)
  helper/              # route, notification, DI helpers
  theme/               # light/dark theme setup
  util/                # app constants, messages, images
  main.dart            # app entry point
assets/                # images, fonts, language files, JSON assets
android/               # Android project
ios/                   # iOS project
web/                   # web project
test/                  # app tests
```

## Requirements

Before running the app, make sure you have:

- Flutter SDK installed
- Android Studio or VS Code with Flutter plugins
- Xcode for iOS development (macOS only)
- Firebase project configured if you use push notifications

## Setup

1. Clone the repository

```bash
git clone <repository-url>
cd vendor-app
```

2. Install dependencies

```bash
flutter pub get
```

3. Configure app settings

Update the API base URL and platform-specific settings if needed:

- `lib/util/app_constants.dart`
- Firebase initialization in `lib/main.dart`

4. Run the app

```bash
flutter run
```

For a specific device or emulator:

```bash
flutter devices
flutter run -d <device-id>
```

## Useful commands

```bash
flutter clean
flutter pub get
flutter analyze
flutter test
```

## Notes

- This project is tightly coupled to a backend API and uses Firebase for push notifications.
- The app includes modules for restaurant, marketplace, and rental vendor flows, and some features may be enabled or disabled based on backend configuration.
- If you are integrating a new environment, update the API endpoint and Firebase configuration before running the app.

## License

This project currently does not include a license file in the repository. If you plan to distribute or reuse it publicly, add an appropriate license before release.
