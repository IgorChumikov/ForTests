//
//  View4.swift
//  ForTests
//
//  Created by Игорь Чумиков on 11.06.2024.
//

import SwiftUI

class RootLinkManager: ObservableObject {
    @Published var activateRootLink: Bool = false
}

struct View4: View {
    @StateObject private var rootLinkManager = RootLinkManager()
    
    var body: some View {
        NavigationView {
            NavigationLink(isActive: $rootLinkManager.activateRootLink, destination: {
                View4_1()
            }, label: {
                Text("Переход на View4_1")
            })
            .navigationTitle("View4")
        }
        .environmentObject(rootLinkManager)
    }
}

struct View4_1: View {
    var body: some View {
        NavigationLink(destination: {
            View4_2()
        }, label: {
            Text("Переход на View4_2")
        })
        .navigationTitle("View4_1")
    }
}

struct View4_2: View {
    var body: some View {
        NavigationLink(destination: {
            View4_3()
        }, label: {
            Text("Переход на View4_2")
        })
        .navigationTitle("View4_2")
    }
}

struct View4_3: View {
    var body: some View {
        NavigationLink(destination: {
            View4_4()
        }, label: {
            Text("Переход на View4_3")
        })
        .navigationTitle("View4_3")
    }
}

struct View4_4: View {
    @EnvironmentObject var rootLinkManager: RootLinkManager
    
    var body: some View {
        VStack {
            Text("Это View4_4")
            Button {
                // активируем переход на первый экран
                rootLinkManager.activateRootLink = false
            } label: {
                Text("На главный экран")
            }
        }
        .navigationTitle("View4_4")
    }
}

#Preview {
    View4()
}
