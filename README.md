# Flutter Mobile Applications

<div align="center">

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/)
[![Mobile](https://img.shields.io/badge/Mobile-Cross%20Platform-blueviolet?style=for-the-badge)](https://flutter.dev/)

**Cross-platform mobile applications built with Flutter and Dart**

</div>

---

## 📚 Table of Contents

- [Overview](#overview)
- [Projects](#projects)
- [Tech Stack](#tech-stack)
- [Installation](#installation)
- [Development](#development)
- [Project Details](#project-details)
- [Best Practices](#best-practices)

---

## 🎯 Overview

This repository contains mobile applications developed with **Flutter** - Google's UI framework for building natively compiled applications for mobile, web, and desktop.

**Key Features:**
✅ Cross-platform compatibility (iOS & Android)  
✅ Native performance
✅ Hot reload for fast development
✅ Beautiful, responsive UI
✅ Native platform integration

---

## 📱 Projects

### **1. MyBlog Application** 📝
*A feature-rich blogging platform for mobile*

**Description:** A modern blog application showcasing Flutter UI capabilities with a clean, intuitive interface.

**Features:**
- Browse blog posts
- Create and edit posts
- Rich text editor
- Image support
- Favorite posts
- Search functionality
- Dark/Light theme

**Technologies:**
- Flutter 3.x
- Dart
- Provider (State Management)
- SQLite (Local storage)
- HTTP (API integration)

**Project Structure:**
```
myblog/
├── lib/
│   ├── screens/          # App screens
│   │   ├── home_screen.dart
│   │   ├── post_detail.dart
│   │   ├── create_post.dart
│   │   └── ...
│   ├── widgets/          # Reusable widgets
│   │   ├── post_card.dart
│   │   ├── custom_app_bar.dart
│   │   └── ...
│   ├── models/           # Data models
│   │   ├── post_model.dart
│   │   ├── user_model.dart
│   │   └── ...
│   ├── providers/        # State management
│   │   ├── post_provider.dart
│   │   ├── auth_provider.dart
│   │   └── ...
│   ├── services/         # API services
│   │   ├── api_service.dart
│   │   ├── storage_service.dart
│   │   └── ...
│   └── main.dart         # App entry point
├── pubspec.yaml          # Dependencies
└── README.md
```

---

## 🛠️ Tech Stack

### **Framework & Language**
```
Flutter 3.x          # UI framework
Dart                 # Programming language
```

### **State Management**
```
Provider             # Simple & powerful
Riverpod             # Advanced alternative
GetX                 # Complete solution
Bloc                 # Event-driven
```

### **Networking & Storage**
```
Http                 # HTTP client
Dio                  # Advanced HTTP
Firebase             # Cloud services
SQLite               # Local database
Hive                 # Fast local storage
```

### **UI & Animation**
```
Animations           # Built-in animations
Lottie              # Animation library
Animations Package  # Complex animations
Curved Animations   # Smooth transitions
```

### **Plugins**
```
image_picker        # Photo/video selection
location            # GPS location
firebase_auth       # Authentication
firebase_storage    # Cloud storage
share_plus          # Share functionality
url_launcher        # Open links/calls
```

---

## 📦 Installation

### **Prerequisites**
- Flutter SDK 3.x
- Dart SDK
- iOS: Xcode (macOS)
- Android: Android Studio + Android SDK
- Git

### **Setup Flutter**

```bash
# Download Flutter
# https://flutter.dev/docs/get-started/install

# Add to PATH
export PATH="$PATH:`pwd`/flutter/bin"

# Verify installation
flutter doctor

# Get Flutter packages
flutter pub get
```

### **Clone Repository**

```bash
git clone https://github.com/sharonaaas27-dev/Flutter-Apps.git
cd Flutter-Apps/myblog

# Get dependencies
flutter pub get

# Run app
flutter run
```

---

## 💻 Development

### **Development Commands**

```bash
# Get dependencies
flutter pub get

# Analyze code
flutter analyze

# Run app on connected device/emulator
flutter run

# Run app in debug mode
flutter run --debug

# Run app in release mode
flutter run --release

# Run tests
flutter test

# Build APK (Android)
flutter build apk

# Build iOS app
flutter build ios

# Build web
flutter build web
```

### **Hot Reload**

```bash
# During flutter run session, press 'r' to hot reload
# Press 'R' for full restart
```

### **Emulator/Simulator**

```bash
# List available devices
flutter devices

# Run on specific device
flutter run -d device_id

# Open iOS simulator
open -a Simulator

# Open Android emulator
emulator -avd Pixel_5_API_31
```

---

## 📋 Project Details

### **MyBlog - Detailed Features**

#### **1. Home Screen**
- List of all blog posts
- Pull-to-refresh
- Pagination/infinite scroll
- Search posts
- Filter by category

#### **2. Post Detail Screen**
- Full post content
- Author information
- Comments section
- Like/favorite functionality
- Share post

#### **3. Create Post Screen**
- Rich text editor
- Image upload
- Tag selection
- Category selection
- Schedule posting
- Save as draft

#### **4. User Profile**
- User information
- Posts statistics
- Followers/Following
- Settings
- Logout

#### **5. Settings**
- Theme (Dark/Light)
- Language
- Notifications
- Privacy settings
- About app

### **Architecture Pattern: MVVM**

```
View (Screens)
    ↓
ViewModel (Provider)
    ↓
Services (API, Storage)
    ↓
Models (Data)
    ↓
API / Database
```

### **State Management Example**

```dart
// Define Provider
final postProvider = StateNotifierProvider<PostNotifier, AsyncValue<List<Post>>>((ref) {
  return PostNotifier();
});

// Consumer Widget
class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsync = ref.watch(postProvider);
    
    return postsAsync.when(
      data: (posts) => ListView.builder(
        itemCount: posts.length,
        itemBuilder: (ctx, idx) => PostCard(post: posts[idx]),
      ),
      loading: () => CircularProgressIndicator(),
      error: (err, stack) => ErrorWidget(error: err),
    );
  }
}
```

---

## 🎨 UI/UX Best Practices

### **Responsive Design**
```dart
// Responsive layout
double getWidth(BuildContext context) {
  final size = MediaQuery.of(context).size;
  if (size.width < 600) return size.width * 0.9;
  if (size.width < 1200) return size.width * 0.8;
  return size.width * 0.7;
}

// Adaptive widgets
class ResponsiveContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return MobileLayout();
        } else if (constraints.maxWidth < 1200) {
          return TabletLayout();
        } else {
          return DesktopLayout();
        }
      },
    );
  }
}
```

### **Smooth Animations**
```dart
class AnimatedPostCard extends StatefulWidget {
  @override
  _AnimatedPostCardState createState() => _AnimatedPostCardState();
}

class _AnimatedPostCardState extends State<AnimatedPostCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0, 0.3),
          end: Offset.zero,
        ).animate(_animation),
        child: PostCard(),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
```

---

## 📚 Project Structure Standards

```
flutter_app/
├── lib/
│   ├── main.dart                  # App entry point
│   ├── models/                    # Data models
│   │   ├── post_model.dart
│   │   └── user_model.dart
│   ├── views/                     # UI screens
│   │   ├── home_view.dart
│   │   ├── post_detail_view.dart
│   │   └── ...
│   ├── viewmodels/                # State management
│   │   ├── home_viewmodel.dart
│   │   ├── post_viewmodel.dart
│   │   └── ...
│   ├── widgets/                   # Reusable widgets
│   │   ├── post_card.dart
│   │   ├── custom_app_bar.dart
│   │   └── ...
│   ├── services/                  # Services
│   │   ├── api_service.dart
│   │   ├── storage_service.dart
│   │   └── ...
│   ├── utils/                     # Utilities
│   │   ├── constants.dart
│   │   ├── themes.dart
│   │   └── ...
│   └── config/                    # Configuration
│       └── routes.dart
├── test/                          # Unit & widget tests
├── assets/                        # Static files
│   ├── images/
│   └── fonts/
├── pubspec.yaml                   # Dependencies
└── README.md
```

---

## 🧪 Testing

### **Unit Tests**
```dart
// test/models/post_model_test.dart
void main() {
  group('Post Model', () {
    test('Post creation', () {
      final post = Post(
        id: '1',
        title: 'Test Post',
        content: 'Content',
      );
      
      expect(post.id, '1');
      expect(post.title, 'Test Post');
    });
  });
}
```

### **Widget Tests**
```dart
void main() {
  testWidgets('Home screen displays posts', (WidgetTester tester) async {
    await tester.pumpWidget(MyBlogApp());
    
    expect(find.byType(PostCard), findsWidgets);
    expect(find.text('Test Post'), findsOneWidget);
  });
}
```

---

## 🚀 Building for Production

### **iOS Build**
```bash
# Build iOS app
flutter build ios --release

# Create IPA
cd ios
xcodebuild -workspace Runner.xcworkspace -scheme Runner -configuration Release -derived-data-path build -archivePath build/Runner.xcarchive -allowProvisioningUpdates archive
cd ..

# Export IPA
xcodebuild -exportArchive -archivePath build/Runner.xcarchive -exportOptionsPlist ios/ExportOptions.plist -exportPath build/ios/ipa
```

### **Android Build**
```bash
# Generate keystore
keytool -genkey -v -keystore ~/my-release-key.keystore -keyalg RSA -keysize 2048 -validity 10000 -alias my-key-alias

# Build APK
flutter build apk --release

# Build App Bundle
flutter build appbundle --release
```

---

## 🌟 Best Practices

### **Code Quality**
- ✅ Follow Dart style guide
- ✅ Use meaningful variable names
- ✅ Write comments for complex logic
- ✅ Keep functions small and focused
- ✅ Use const constructors

### **Performance**
- ✅ Optimize builds with const
- ✅ Use lazy loading for lists
- ✅ Cache network images
- ✅ Minimize rebuilds
- ✅ Profile app regularly

### **Security**
- ✅ Store sensitive data securely (flutter_secure_storage)
- ✅ Validate user input
- ✅ Use HTTPS for API calls
- ✅ Implement proper authentication
- ✅ Keep dependencies updated

### **User Experience**
- ✅ Responsive design
- ✅ Smooth animations
- ✅ Error handling
- ✅ Loading indicators
- ✅ Offline support

---

## 📈 Roadmap

### **Phase 1: Current** 🔄
- ✅ Basic blog functionality
- ✅ Post CRUD operations
- ✅ Local storage
- 🔄 Authentication

### **Phase 2: Enhancement** 📋
- [ ] Backend integration
- [ ] User authentication
- [ ] Cloud storage
- [ ] Real-time updates
- [ ] Push notifications

### **Phase 3: Advanced** 🚀
- [ ] Offline-first sync
- [ ] Advanced analytics
- [ ] Recommendation engine
- [ ] Social features
- [ ] AI-powered features

---

## 🤝 Contributing

Contributions are welcome!

1. Fork the repository
2. Create feature branch (`git checkout -b feature/NewFeature`)
3. Commit changes (`git commit -m 'Add NewFeature'`)
4. Push to branch (`git push origin feature/NewFeature`)
5. Open Pull Request

---

## 📚 Resources

### **Official Documentation**
- [Flutter Docs](https://flutter.dev/docs)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Flutter Widget Catalog](https://flutter.dev/docs/reference/widgets)

### **Learning Resources**
- [Flutter Community](https://flutter.dev/community)
- [Pub.dev Packages](https://pub.dev/)
- [Flutter YouTube Channel](https://www.youtube.com/flutterdev)

---

## 📄 License

This project is licensed under the MIT License - see [LICENSE](LICENSE) file for details.

---

## 👨‍💻 Author

**Sharon** - Mobile Developer & Full Stack Engineer

- 🌐 [GitHub](https://github.com/sharonaaas27-dev)
- 💼 [LinkedIn](https://linkedin.com)
- 📧 [Email](mailto:sharon@email.com)

---

<div align="center">

**Made with ❤️ by Sharon**

⭐ If you found this helpful, give it a star!

</div>
