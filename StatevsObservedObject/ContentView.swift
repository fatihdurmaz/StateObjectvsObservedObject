//
//  ContentView.swift
//  StatevsObservedObject
//
//  Created by Fatih Durmaz on 26.12.2023.
//

import SwiftUI

class ContentViewViewModel: ObservableObject {
    
    @Published var counter: Int = 0
    
    init() {
        print("View Model Yüklendi/Çağrıldı")
    }
    
    func increase() {
        counter += 1
    }
}

struct ContentView: View {
    @State private var name = "Fatih Durmaz"
    @State private var nameToogle = false

    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
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
    @ObservedObject var viewModel = ContentViewViewModel()
    
    // ObservedObject, ObservableObject örneğinin yaşam döngüsünü, görünüm yeniden çizildiğinde korumaz.
    
    //@StateObject, ObservableObject örneğinin yaşam döngüsünü, görünüm yeniden çizildiğinde bile korur.

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

#Preview {
    ContentView()
}
