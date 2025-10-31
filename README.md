# Apple Full-Stack Template

Modern iOS 18+ / macOS 15+ full-stack application template with SwiftData, Observation, and latest Apple frameworks.

## 🚀 Features

### Swift 6.0
- Strict concurrency
- Actor isolation
- Sendable types
- Data race safety

### SwiftUI (iOS 18 / macOS 15)
- `@Observable` macro
- `@Query` for SwiftData
- Navigation stack
- Toolbar modifiers

### SwiftData
- `@Model` macro
- Automatic persistence
- Relationships
- Queries

### Modern Patterns
- Actor-based networking
- Async/await throughout
- Environment values
- Type-safe models

## 📦 Installation

### As Template
```bash
git clone https://github.com/durellwilson/apple-fullstack-template.git MyApp
cd MyApp
open Package.swift
```

### As Package
```swift
dependencies: [
    .package(url: "https://github.com/durellwilson/apple-fullstack-template.git", from: "1.0.0")
]
```

## 🏗️ Project Structure

```
Sources/
├── App.swift           # Main app entry
├── Models.swift        # SwiftData models
├── ViewModel.swift     # Observable view models
└── NetworkService.swift # Actor-based networking
```

## 🎯 Quick Start

### 1. Create Xcode Project
```bash
# iOS App
xcodebuild -project MyApp.xcodeproj -scheme MyApp -destination 'platform=iOS Simulator,name=iPhone 15 Pro'

# macOS App
xcodebuild -project MyApp.xcodeproj -scheme MyApp -destination 'platform=macOS'
```

### 2. Add SwiftData Models
```swift
@Model
final class Product {
    var name: String
    var price: Double
    
    init(name: String, price: Double) {
        self.name = name
        self.price = price
    }
}
```

### 3. Use in Views
```swift
struct ProductList: View {
    @Query private var products: [Product]
    @Environment(\.modelContext) private var context
    
    var body: some View {
        List(products) { product in
            Text(product.name)
        }
    }
}
```

## 🌟 Apple Frameworks Included

### Foundation
- URLSession with async/await
- JSONEncoder/Decoder
- Date, UUID

### SwiftUI
- Navigation
- Lists
- Forms
- Toolbars

### SwiftData
- Persistence
- Queries
- Relationships

### Observation
- `@Observable` macro
- Automatic UI updates

## 🎨 Customization

### Add CloudKit Sync
```swift
.modelContainer(for: [Item.self], inMemory: false, isAutosaveEnabled: true, isUndoEnabled: true)
```

### Add Widgets
```swift
import WidgetKit

struct MyWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: "MyWidget", provider: Provider()) { entry in
            MyWidgetView(entry: entry)
        }
    }
}
```

### Add App Intents
```swift
import AppIntents

struct AddItemIntent: AppIntent {
    static var title: LocalizedStringResource = "Add Item"
    
    func perform() async throws -> some IntentResult {
        // Add item logic
        return .result()
    }
}
```

## 🔧 Advanced Features

### Combine with Vapor (Server-Side Swift)
```swift
// Server
import Vapor

func routes(_ app: Application) throws {
    app.get("items") { req async throws -> [Item] in
        // Return items
    }
}
```

### Add Push Notifications
```swift
import UserNotifications

func requestNotificationPermission() async {
    try? await UNUserNotificationCenter.current()
        .requestAuthorization(options: [.alert, .sound, .badge])
}
```

## 📱 Platform Support

- ✅ iOS 18+
- ✅ macOS 15+
- ✅ watchOS 11+
- ✅ tvOS 18+
- ✅ visionOS 2+

## 🎓 Learning Resources

- [SwiftData Documentation](https://developer.apple.com/documentation/swiftdata)
- [Observation Framework](https://developer.apple.com/documentation/observation)
- [Swift 6 Migration Guide](https://www.swift.org/migration/documentation/swift-6-concurrency-migration-guide/)

## 🤝 Contributing

Built for Detroit's Swift community. Contributions welcome!

## 📝 License

MIT License

---

**Built with ❤️ for modern Apple development** 🍎
