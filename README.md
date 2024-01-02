# StateObject vs ObservedObject

![Swift](https://img.shields.io/badge/Swift-5.9%20%7C%205.8%20%7C%205.7-orange.svg)
![Platform](https://img.shields.io/badge/Platform-iOS%20-lightgrey.svg)
![Swift](https://img.shields.io/badge/iOS-red.svg)
![License](https://img.shields.io/badge/License-MIT-blue.svg)

This tutorial provides an example to compare the usage of @StateObject and @ObservedObject in SwiftUI. These two features are used to manage data flow in SwiftUI applications, but they serve different purposes in various scenarios.
## @StateObject
@StateObject is a property wrapper used when an object needs to be created and called multiple times throughout the lifetime of an object. This typically occurs in situations like when a view is reloaded, and the state it depends on is changing. It is often used to create a ViewModel or an independent object instance.### Tip Struct

## @ObservedObject
@ObservedObject is a property wrapper used when an object is used inside a View, and you want to observe changes in that object. It is used to update a view when changes occur in another view or when tracking changes in a subview. It is commonly used to share a ViewModel or observe changes in a subview.

### Example

```swift
import SwiftUI

struct ContentView: View {
    @State private var name = "Fatih Durmaz"
    @State private var nameToogle = false

    var body: some View {
        NavigationView {
            VStack {
                Text(name)

                Button("Change Name", systemImage: "square.and.pencil") {
                    nameToogle.toggle()
                    if nameToogle{
                        name = "Kerem Durmaz"
                    }else {
                        name = "Fatih Durmaz"
                    }
                }
                .font(.title3 )
                .buttonStyle(.borderedProminent)
                .tint(.red)
                
                Divider()
                
                SubView()
                
            }
            .padding()
            .navigationTitle("State vs Observed Object")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SubView: View {
    var body: some View {
        VStack {
            Text(" \(viewModel.counter)")
            Button("Increase", systemImage: "plus") {
                viewModel.increase()
            }
            .font(.title3 )
            .buttonStyle(.borderedProminent)
        }
        .padding()

    }
}
```

### View Model

```swift
class ContentViewViewModel: ObservableObject {
    
    @Published var counter: Int = 0
    
    init() {
        print("View Model Yüklendi/Çağrıldı")
    }
    
    func increase() {
        counter += 1
    }
}
```
