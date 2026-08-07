//
//  ConcurrencyCourseActorsBootcamp.swift
//  SwiftConcurrencyBootcamp
//
//  Created by Nick Sarno on 4/4/22.
//

import SwiftUI

class ConcurrencyCourseMyDataManager {
    
    static let instance = ConcurrencyCourseMyDataManager()
    private init() { }
    
    var data: [String] = []
    private let lock = DispatchQueue(label: "com.MyApp.ConcurrencyCourseMyDataManager")
    
    func getRandomData(completionHandler: @escaping (_ title: String?) -> ()) {
        lock.async {
            self.data.append(UUID().uuidString)
            print(Thread.current)
            completionHandler(self.data.randomElement())
        }
    }
    
}

actor ConcurrencyCourseMyActorDataManager {
    
    static let instance = ConcurrencyCourseMyActorDataManager()
    private init() { }
    
    var data: [String] = []
    
    nonisolated let myRandomText = "asdfasdfadfsfdsdfs"
    
    func getRandomData() -> String? {
        self.data.append(UUID().uuidString)
        print(Thread.current)
        return self.data.randomElement()
    }
    
    nonisolated func getSavedData() -> String {
        return "NEW DATA"
    }
    
}


struct ConcurrencyCourseHomeView: View {
    
    let manager = ConcurrencyCourseMyActorDataManager.instance
    @State private var text: String = ""
    let timer = Timer.publish(every: 0.1, tolerance: nil, on: .main, in: .common, options: nil).autoconnect()
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.8).ignoresSafeArea()
            
            Text(text)
                .font(.headline)
        }
        .onAppear(perform: {
            let newString = manager.myRandomText
            
            Task {
                let newString = await manager.getSavedData()
            }
        })
        .onReceive(timer) { _ in
            Task {
                if let data = await manager.getRandomData() {
                    await MainActor.run(body: {
                        self.text = data
                    })
                }
            }
//            DispatchQueue.global(qos: .background).async {
//                manager.getRandomData { title in
//                    if let data = title {
//                        DispatchQueue.main.async {
//                            self.text = data
//                        }
//                    }
//                }
//            }
        }
    }
}

struct ConcurrencyCourseBrowseView: View {
    
    let manager = ConcurrencyCourseMyActorDataManager.instance
    @State private var text: String = ""
    let timer = Timer.publish(every: 0.01, tolerance: nil, on: .main, in: .common, options: nil).autoconnect()

    var body: some View {
        ZStack {
            Color.yellow.opacity(0.8).ignoresSafeArea()
            
            Text(text)
                .font(.headline)
        }
        .onReceive(timer) { _ in
            Task {
                if let data = await manager.getRandomData() {
                    await MainActor.run(body: {
                        self.text = data
                    })
                }
            }
//            DispatchQueue.global(qos: .default).async {
//                manager.getRandomData { title in
//                    if let data = title {
//                        DispatchQueue.main.async {
//                            self.text = data
//                        }
//                    }
//                }
//            }
        }
    }
}

struct ConcurrencyCourseActorsBootcamp: View {
    var body: some View {
        TabView {
            ConcurrencyCourseHomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            ConcurrencyCourseBrowseView()
                .tabItem {
                    Label("Browse", systemImage: "magnifyingglass")
                }
        }
    }
}

struct ConcurrencyCourseActorsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ConcurrencyCourseActorsBootcamp()
    }
}
