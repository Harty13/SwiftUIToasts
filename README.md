# Toasts

Toasts is a lightweight Swift package that provides an easy way to display toast notifications in SwiftUI. Toasts are temporary informational messages or notifications that appear on the screen and then disappear after a certain duration.

## Installation

To integrate Toasts into your Xcode project, you can use Swift Package Manager:

1. In Xcode, go to **File** > **Swift Packages** > **Add Package Dependency**.
2. Paste the repository URL: `https://github.com/Harty13/SwiftUIToasts`
3. Follow the prompts to add the package to your project.

## Usage

To use Toasts in your SwiftUI app, follow these steps:

1. Import the Toasts module:
    ```swift
    import Toasts
    ```

2. Add the `ReceiveToastModifier` modifier to your root view that should receive and display toasts:
    ```swift
    struct MyApp: App {
        var body: some Scene {
            ContentView()
                .onReceiveToast { toast in
                    ToastView(toast: toast)
                        .transition(.move(edge: .top))
                        .frame(maxHeight: .infinity, alignment: .top)
                }
        }
    }
    ```

3. Create and add toasts using the `addToast` function:
    ```swift
    Toasts.shared.addToast(Toast(title: "This is a toast", duration: 2.0))
    ```

4. Customize the appearance and behavior of toasts by providing your own `ToastView` implementation:
    ```swift
    struct ToastView: View {
        let toast: Toast
        
        var body: some View {
            ZStack {
                // Implement your custom toast view
            }
        }
    }
    ```

That's it! Toasts will now be displayed in your app whenever you add them using the `addToast` function.

## Requirements

- iOS 13.0+ or macOS 10.15+
- Swift 5.0+
