<h1 align="center">🛍️ NextCart — Your Smart Shopping Companion</h1>
<img width="1983" height="793" alt="NextCart Banner" src="https://github.com/user-attachments/assets/a42dc3f7-8d13-4e7e-aec5-f2ad78d19cc5" />

<p align="center">
  <a href="https://flutter.dev"><img src="https://img.shields.io/badge/Flutter-3.10+-02569B?style=for-the-badge&logo=flutter&logoColor=white" /></a>
  <a href="https://dart.dev"><img src="https://img.shields.io/badge/Dart-3.10+-0175C2?style=for-the-badge&logo=dart&logoColor=white" /></a>
  <a href="#"><img src="https://img.shields.io/badge/Architecture-Clean_Architecture-blueviolet?style=for-the-badge" /></a>
  <a href="#"><img src="https://img.shields.io/badge/State_Mgmt-Cubit-orange?style=for-the-badge" /></a>
  <a href="https://github.com/Eslam-Hossam1/nextcart/blob/main/LICENSE"><img src="https://img.shields.io/badge/License-MIT-green?style=for-the-badge" /></a>
</p>

<p align="center">
  <b>NextCart is a modern, production-oriented e-commerce mobile application built with Flutter, Clean Architecture, and Cubit.</b>
  <br/><br/>
  🛍️ Discover products, explore categories, search and filter, manage your cart and favorites, and enjoy a seamless shopping experience.
  <br/><br/>
  💳 Secure payments powered by <b>Stripe</b>, featuring server-side price validation, PaymentIntents, Stripe Customer management, and webhook-driven payment confirmation.
  <br/><br/>
  📦 Full order lifecycle management with payment status tracking, order history, detailed order views, and automated cart synchronization.
  <br/><br/>
  ⚡ Built with <b>Supabase, PostgreSQL, and Edge Functions</b>, leveraging authentication, Row Level Security (RLS), and secure server-side business logic.
</p>

---

## ✨ Key Features

| Feature | Description |
|:---|:---|
| 🏠 **Home Dashboard** | Beautiful home screen with promo banners, popular products, top brands, and categories |
| 🔍 **Smart Search** | Search for any product instantly with a powerful search engine |
| 📦 **Product Details** | Detailed product view with image carousel, expandable descriptions, and pricing |
| 🏷️ **Categories & Brands** | Browse products by categories or filter by your favorite brands |
| 🛒 **Shopping Cart** | Add, remove, and manage items in your cart seamlessly |
| ❤️ **Favorites / Wishlist** | Save products you love and access them anytime |
| 👤 **User Profile** | View and edit your profile with avatar support |
| 🔐 **Authentication** | Full auth flow — Login, Sign Up, Forgot Password |
| 🌗 **Dark & Light Theme** | Beautifully designed dual theme support with Hydrated Cubit persistence |
| 🎨 **Theme Selection** | Choose your preferred theme from a dedicated settings screen |
| 📱 **Responsive Design** | Adaptive UI using a custom `ResponsiveHelper` for all screen sizes |
| ♻️ **Infinite Scroll / Pagination** | Smooth paginated loading for products, search results, and more |

---

## 📸 App Screenshots

### 🌙 Dark Mode

<table>
<tr>
  <td align="center"><img width="200" alt="Splash Screen" src="assets/images/app screens/dark mode/splash dark.jpg" /></td>
  <td align="center"><img width="200" alt="Onboarding 1" src="assets/images/app screens/dark mode/onboarding dark 1.jpg" /></td>
  <td align="center"><img width="200" alt="Onboarding 2" src="assets/images/app screens/dark mode/onboarding dark 2.jpg" /></td>
  <td align="center"><img width="200" alt="Onboarding 3" src="assets/images/app screens/dark mode/onboarding dark 3.jpg" /></td>
</tr>
<tr>
  <td align="center">Splash Screen</td>
  <td align="center">Onboarding 1</td>
  <td align="center">Onboarding 2</td>
  <td align="center">Onboarding 3</td>
</tr>
<tr>
  <td align="center"><img width="200" alt="Login Screen" src="assets/images/app screens/dark mode/login dark.jpg" /></td>
  <td align="center"><img width="200" alt="Sign Up Screen" src="assets/images/app screens/dark mode/sign up dark.jpg" /></td>
  <td align="center"><img width="200" alt="Home Screen" src="assets/images/app screens/dark mode/home dark up.jpg" /></td>
  <td align="center"><img width="200" alt="Home Screen 2" src="assets/images/app screens/dark mode/home down dark.jpg" /></td>
</tr>
<tr>
  <td align="center">Login Screen</td>
  <td align="center">Sign Up Screen</td>
  <td align="center">Home Screen</td>
  <td align="center">Home Screen 2</td>
</tr>
<tr>
  <td align="center"><img width="200" alt="Product Details" src="assets/images/app screens/dark mode/product details dark.jpg" /></td>
  <td align="center"><img width="200" alt="Popular Products" src="assets/images/app screens/dark mode/popular products dark.jpg" /></td>
  <td align="center"><img width="200" alt="Categories" src="assets/images/app screens/dark mode/categories dark.jpg" /></td>
  <td align="center"><img width="200" alt="Brands" src="assets/images/app screens/dark mode/brands dark.jpg" /></td>
</tr>
<tr>
  <td align="center">Product Details</td>
  <td align="center">Popular Products</td>
  <td align="center">Categories</td>
  <td align="center">Brands</td>
</tr>
<tr>
  <td align="center"><img width="200" alt="Cart" src="assets/images/app screens/dark mode/cart dark.jpg" /></td>
  <td align="center"><img width="200" alt="Favorites" src="assets/images/app screens/dark mode/favorites darkd.jpg" /></td>
  <td align="center"><img width="200" alt="Profile" src="assets/images/app screens/dark mode/profile dark.jpg" /></td>
  <td align="center"><img width="200" alt="Edit Profile" src="assets/images/app screens/dark mode/edit profile dark.jpg" /></td>
</tr>
<tr>
  <td align="center">Cart Screen</td>
  <td align="center">Favorites</td>
  <td align="center">Profile Screen</td>
  <td align="center">Edit Profile</td>
</tr>
<tr>
  <td align="center"><img width="200" alt="Fire Sale" src="assets/images/app screens/dark mode/fire sale dark.jpg" /></td>
  <td align="center"><img width="200" alt="Checkout" src="assets/images/app screens/dark mode/checkout dark.jpg" /></td>
  <td align="center"><img width="200" alt="Orders" src="assets/images/app screens/dark mode/orders dark.jpg" /></td>
  <td align="center"><img width="200" alt="Order Details" src="assets/images/app screens/dark mode/order details dark.jpg" /></td>
</tr>
<tr>
  <td align="center">Fire Sale</td>
  <td align="center">Checkout</td>
  <td align="center">Orders</td>
  <td align="center">Order Details</td>
</tr>
<tr>
  <td align="center"><img width="200" alt="Payment Methods" src="assets/images/app screens/dark mode/payment mehtods dark.jpg" /></td>
  <td align="center"><img width="200" alt="Payment Card" src="assets/images/app screens/dark mode/payment card dark.jpg" /></td>
  <td align="center"><img width="200" alt="Payment Success" src="assets/images/app screens/dark mode/payment success dark.jpg" /></td>
  <td align="center"></td>
</tr>
<tr>
  <td align="center">Payment Methods</td>
  <td align="center">Payment Card</td>
  <td align="center">Payment Success</td>
  <td align="center"></td>
</tr>
</table>

---

### ☀️ Light Mode

<table>
<tr>
  <td align="center"><img width="200" alt="Onboarding 1" src="assets/images/app screens/light mode/onboarding 1 light.jpg" /></td>
  <td align="center"><img width="200" alt="Onboarding 2" src="assets/images/app screens/light mode/onboarding 2 light.jpg" /></td>
  <td align="center"><img width="200" alt="Onboarding 3" src="assets/images/app screens/light mode/onboarding 3 light.jpg" /></td>
  <td align="center"><img width="200" alt="Login Screen" src="assets/images/app screens/light mode/login light.jpg" /></td>
</tr>
<tr>
  <td align="center">Onboarding 1</td>
  <td align="center">Onboarding 2</td>
  <td align="center">Onboarding 3</td>
  <td align="center">Login Screen</td>
</tr>
<tr>
  <td align="center"><img width="200" alt="Sign Up Screen" src="assets/images/app screens/light mode/sign up light.jpg" /></td>
  <td align="center"><img width="200" alt="Home Screen" src="assets/images/app screens/light mode/home up light.jpg" /></td>
  <td align="center"><img width="200" alt="Home Screen 2" src="assets/images/app screens/light mode/home down light.jpg" /></td>
  <td align="center"><img width="200" alt="Home Screen 3" src="assets/images/app screens/light mode/home up light 2.jpg" /></td>
</tr>
<tr>
  <td align="center">Sign Up Screen</td>
  <td align="center">Home Screen</td>
  <td align="center">Home Screen 2</td>
  <td align="center">Home Screen 3</td>
</tr>
<tr>
  <td align="center"><img width="200" alt="Product Details" src="assets/images/app screens/light mode/product details light.jpg" /></td>
  <td align="center"><img width="200" alt="Popular Products" src="assets/images/app screens/light mode/popular products light.jpg" /></td>
  <td align="center"><img width="200" alt="Categories" src="assets/images/app screens/light mode/categories light.jpg" /></td>
  <td align="center"><img width="200" alt="Brands" src="assets/images/app screens/light mode/brands light.jpg" /></td>
</tr>
<tr>
  <td align="center">Product Details</td>
  <td align="center">Popular Products</td>
  <td align="center">Categories</td>
  <td align="center">Brands</td>
</tr>
<tr>
  <td align="center"><img width="200" alt="Cart" src="assets/images/app screens/light mode/cart light.jpg" /></td>
  <td align="center"><img width="200" alt="Favorites" src="assets/images/app screens/light mode/favorites light.jpg" /></td>
  <td align="center"><img width="200" alt="Profile" src="assets/images/app screens/light mode/profile light.jpg" /></td>
  <td align="center"><img width="200" alt="Edit Profile" src="assets/images/app screens/light mode/edit profile light.jpg" /></td>
</tr>
<tr>
  <td align="center">Cart Screen</td>
  <td align="center">Favorites</td>
  <td align="center">Profile Screen</td>
  <td align="center">Edit Profile</td>
</tr>
<tr>
  <td align="center"><img width="200" alt="Fire Sale" src="assets/images/app screens/light mode/fire sale light.jpg" /></td>
  <td align="center"><img width="200" alt="Checkout" src="assets/images/app screens/light mode/checkout light.jpg" /></td>
  <td align="center"><img width="200" alt="Orders" src="assets/images/app screens/light mode/orders light.jpg" /></td>
  <td align="center"><img width="200" alt="Order Details" src="assets/images/app screens/light mode/order details light.jpg" /></td>
</tr>
<tr>
  <td align="center">Fire Sale</td>
  <td align="center">Checkout</td>
  <td align="center">Orders</td>
  <td align="center">Order Details</td>
</tr>
<tr>
  <td align="center"><img width="200" alt="Payment Methods" src="assets/images/app screens/light mode/payment methods light.jpg" /></td>
  <td align="center"><img width="200" alt="Payment Card" src="assets/images/app screens/light mode/payment card light.jpg" /></td>
  <td align="center"><img width="200" alt="Payment Success" src="assets/images/app screens/light mode/payment successful light.jpg" /></td>
  <td align="center"></td>
</tr>
<tr>
  <td align="center">Payment Methods</td>
  <td align="center">Payment Card</td>
  <td align="center">Payment Success</td>
  <td align="center"></td>
</tr>
</table>

---

## 🏛️ Architecture Overview

NextCart follows **Clean Architecture** principles with a strict separation of concerns. Each feature is self-contained with its own **Domain**, **Data**, and **Presentation** layers.

```mermaid
%%{init: {
  "flowchart": { "nodeSpacing": 50, "rankSpacing": 65 },
  "themeVariables": { "fontSize": "16px", "primaryColor": "#E8F0FE", "primaryTextColor": "#001640", "primaryBorderColor": "#3F80FF", "lineColor": "#3F80FF" }
}}%%
flowchart TD
  A["🛍️ NextCart App"]

  A --> CORE
  A --> FEATURES

  subgraph CORE["🔧 core/"]
    C1["networking/"]
    C2["errors/"]
    C3["widgets/"]
    C4["theme/"]
    C5["services/"]
    C6["usecases/"]
    C7["routing/"]
    C8["di/"]
    C9["extensions/"]
    C10["helpers/"]
    C11["models/"]
    C12["entities/"]
    C13["params/"]
  end

  subgraph FEATURES["📦 features/"]
    F1["auth"]
    F2["onboarding"]
    F3["home"]
    F4["products"]
    F5["product_details"]
    F6["categories"]
    F7["category_products"]
    F8["brands"]
    F9["brand_products"]
    F10["search"]
    F11["cart"]
    F12["favorites"]
    F13["profile"]
    F14["edit_profile"]
    F15["forgot_password"]
    F16["theme_selection"]
    F17["main"]
  end

  F1 --> LAYERS
  subgraph LAYERS["Each Feature Contains:"]
    L1["📐 domain/ — entities, params, repos, usecases"]
    L2["💾 data/ — models, datasources, repos"]
    L3["🎨 presentation/ — views, widgets, manager"]
  end
```

---

## 🧱 Project Structure

```
lib/
│
├── main.dart                    # App entry point
├── app_initializer.dart         # Service locator, Bloc observer, Hydrated storage init
├── nextcart_app.dart             # Root MaterialApp with theme & router
│
├── core/
│   ├── networking/              # Supabase config, API helpers
│   ├── errors/                  # Failure models, API error mapping
│   ├── widgets/                 # Shared reusable widgets (buttons, headers, avatars...)
│   ├── theme/                   # App themes, colors, text styles, theme extensions
│   ├── services/                # Auth credentials, secure storage, image picker
│   ├── usecases/                # UseCase<Failure, Entity, Params> & NoParamUseCase
│   ├── routing/                 # GoRouter config, route paths, routing helper
│   ├── di/                      # GetIt service locator setup
│   ├── extensions/              # Responsive extension helpers
│   ├── helpers/                 # Dialog helpers (AwesomeDialog)
│   ├── models/                  # Shared models (ProductModel, etc.)
│   ├── entities/                # Global shared entities
│   ├── params/                  # Shared parameter objects
│   ├── cubit/                   # Global cubits (ThemeCubit)
│   ├── enums/                   # App-wide enumerations
│   ├── Functions/               # Utility functions
│   └── utils/                   # Asset paths, bloc observer, etc.
│
└── features/
    ├── auth/                    # Login & Sign Up
    ├── onboarding/              # Onboarding screens
    ├── home/                    # Home dashboard (banners, popular, brands, categories)
    ├── products/                # Products listing with pagination
    ├── product_details/         # Product detail view with carousel
    ├── categories/              # Categories browser
    ├── category_products/       # Products filtered by category
    ├── brands/                  # Brands browser
    ├── brand_products/          # Products filtered by brand
    ├── search/                  # Product search with pagination
    ├── cart/                    # Shopping cart management
    ├── favorites/               # Wishlist / Favorites
    ├── profile/                 # User profile
    ├── edit_profile/            # Edit profile with image picker
    ├── forgot_password/         # Password recovery flow
    ├── theme_selection/         # Theme switching (Dark/Light)
    └── main/                    # Main shell with bottom navigation
```

---

## 🛠️ Tech Stack & Libraries

| Category | Technologies & Libraries |
|:---|:---|
| **Language** | Dart 3.10+ |
| **Framework** | Flutter 3.10+ |
| **Architecture** | Clean Architecture, Repository Pattern |
| **State Management** | flutter_bloc / Cubit, Hydrated Bloc |
| **Navigation** | GoRouter (declarative, type-safe routing) |
| **Backend** | Supabase |
| **Dependency Injection** | GetIt (Service Locator) |
| **Error Handling** | Dartz (`Either<Failure, T>`) |
| **Local Storage** | Shared Preferences, Flutter Secure Storage |
| **UI Components** | Google Fonts (Poppins), Flutter SVG, Cached Network Image |
| **Image Handling** | Image Picker, Image Cropper |
| **Dialogs** | Awesome Dialog |
| **Loading States** | Skeletonizer, Modal Progress HUD |
| **Splash** | Flutter Native Splash |
| **Utilities** | Equatable, Path Provider |

---

## 🏗️ Architecture Principles

### ✅ Rules We Follow

| Principle | Description |
|:---|:---|
| **Clean Architecture** | Strict separation into Domain → Data → Presentation layers |
| **Cubit Only** | No Riverpod, no raw Bloc events — Cubit is the single state management solution |
| **No Code Generation** | ❌ No `freezed`, no `json_serializable` — all models are hand-written |
| **Either for Errors** | All error handling uses `Either<Failure, T>` from the `dartz` package |
| **Feature Independence** | No feature depends on another feature; only `core/` is shared |
| **Domain Purity** | Domain layer has zero framework imports — pure Dart only |
| **Params Objects** | No primitive parameters passed to use cases — always wrapped in a `Params` object |
| **Composition over Inheritance** | Small, `const` widgets composed together |
| **Responsive Design** | All sizing handled by `ResponsiveHelper` / `SmartScaler` |
| **Theme Extensions** | Colors & text styles accessed via theme extensions — no inline styling |

### 🔒 Dependency Rules

```
Presentation  ──►  Domain  ◄──  Data
                      ▲
                      │
                    Core (shared everywhere)
```

- **Presentation** depends on **Domain** only
- **Data** depends on **Domain** and **Core**
- **Domain** depends on **nothing** (pure Dart)
- **Core** is accessible from all layers

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) `3.10+`
- [Dart SDK](https://dart.dev/get-dart) `3.10+`
- Android Studio / VS Code with Flutter extensions
- An Android emulator or physical device

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/Eslam-Hossam1/nextcart.git
```

### 2️⃣ Open the Project

```bash
cd nextcart
```

Open in **Android Studio** or **VS Code**.

### 3️⃣ Install Dependencies

```bash
flutter pub get
```

### 4️⃣ Run the App

```bash
flutter run
```

---

## 🎨 Theming

NextCart supports **Dark** and **Light** themes with seamless switching powered by **Hydrated Cubit** (persisted across app restarts).

| | Light Theme | Dark Theme |
|:---|:---|:---|
| **Primary** | `#3F80FF` 🔵 | `#3F80FF` 🔵 |
| **Secondary** | `#FE0017` 🔴 | `#FE0017` 🔴 |
| **Scaffold BG** | `#FFFFFF` ⬜ | `#121212` ⬛ |
| **Main Text** | `#001640` 🌑 | `#ECEFF4` 🌕 |
| **Font Family** | Poppins | Poppins |

Custom colors are managed through **ThemeExtensions** (`CustomColors`) for consistent access across the entire app.

---

## 🗺️ App Navigation Flow

NextCart uses **GoRouter** for declarative, type-safe navigation with a **StatefulShellRoute** for the main bottom navigation bar.

```mermaid
flowchart TD
    A([Launch]) --> B[Splash Screen]
    B --> C{First time?}
    C -- Yes --> D[Onboarding]
    C -- No --> E{Logged in?}
    D --> E
    E -- No --> F[Login]
    F --> G[Sign Up]
    F --> H[Forgot Password]
    H --> I[Reset Password]
    I --> F
    G --> J
    E -- Yes --> J

    J[Main Shell] --> K[Home]
    J --> L[Cart]
    J --> M[Favorites]
    J --> N[Profile]

    K --> O[Search]
    K --> P[Product Details]
    K --> Q[Categories]
    K --> R[Brands]

    Q --> S[Category Products]
    R --> T[Brand Products]
    S --> P
    T --> P
    M --> P

    L --> U[Checkout]
    U --> V[Payment Methods]
    V --> W[Payment Success]
    V --> X[Payment Pending]
    W --> Y[Order Details]
    X --> Y

    N --> Z[Edit Profile]
    N --> AA[Theme Selection]
    N --> AB[Orders]
    AB --> Y
```

---

## 🧪 Testing

```bash
flutter test
```

---

## 📂 Feature Breakdown

| Feature | Domain | Data | Presentation | Description |
|:---|:---:|:---:|:---:|:---|
| **Auth** | ✅ | ✅ | ✅ | Login, Sign Up with form validation |
| **Onboarding** | ✅ | — | ✅ | First-time user introduction screens |
| **Home** | — | — | ✅ | Dashboard with banners, brands, categories, popular products |
| **Products** | ✅ | ✅ | ✅ | Product listing with infinite scroll pagination |
| **Product Details** | ✅ | ✅ | ✅ | Carousel, expandable description, pricing |
| **Categories** | ✅ | ✅ | ✅ | Category browsing & filtering |
| **Category Products** | ✅ | ✅ | ✅ | Products by selected category |
| **Brands** | ✅ | ✅ | ✅ | Brand browsing & filtering |
| **Brand Products** | ✅ | ✅ | ✅ | Products by selected brand |
| **Search** | ✅ | ✅ | ✅ | Real-time product search with pagination |
| **Cart** | — | — | ✅ | Shopping cart management |
| **Favorites** | — | — | ✅ | Wishlist with saved products |
| **Profile** | ✅ | ✅ | ✅ | View user profile info |
| **Edit Profile** | ✅ | ✅ | ✅ | Update name, avatar (image picker + cropper) |
| **Forgot Password** | ✅ | ✅ | ✅ | Email-based password reset flow |
| **Theme Selection** | — | — | ✅ | Switch between Dark / Light mode |

---

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/amazing-feature`)
3. **Commit** your changes (`git commit -m 'Add amazing feature'`)
4. **Push** to the branch (`git push origin feature/amazing-feature`)
5. **Open** a Pull Request

> [!TIP]
> Please follow the project's Clean Architecture conventions and ensure all new features include proper domain, data, and presentation layers.

---

## 📄 License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details.

---

## 👨‍💻 Author

**Eslam Hossam**

<p>
  <a href="https://github.com/Eslam-Hossam1"><img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white" /></a>
</p>

---

<p align="center">
  Made with ❤️ and Flutter 💙
  <br/>
  ⭐ Star this repo if you found it helpful!
</p>
