//
//  ConcurrencyCourseGlobalActorBootcamp.swift
//  SwiftConcurrencyBootcamp
//
//  Created by Nick Sarno on 4/4/22.
//

import SwiftUI

@globalActor final class MyFirstGlobalActor {
    
    static var shared = ConcurrencyCourseMyNewDataManager()
    
}

actor ConcurrencyCourseMyNewDataManager {
    
    func getDataFromDatabase() -> [String] {
        return ["One", "Two", "Three", "Four", "Five", "Six"]
    }
    
}

//@MainActor
class ConcurrencyCourseGlobalActorBootcampViewModel: ObservableObject {
    
    @MainActor @Published var dataArray: [String] = []
//    @Published var dataArray1: [String] = []
//    @Published var dataArray2: [String] = []
//    @Published var dataArray3: [String] = []
//    @Published var dataArray4: [String] = []
    let manager = MyFirstGlobalActor.shared
    
    
//    nonisolated
    @MyFirstGlobalActor func getData() {
        
        // HEAVY COMPLEX METHODS
        
        Task {
            let data = await manager.getDataFromDatabase()
            await MainActor.run(body: {
                self.dataArray = data
            })
        }
    }
    
}

struct ConcurrencyCourseGlobalActorBootcamp: View {
    
    @StateObject private var viewModel = ConcurrencyCourseGlobalActorBootcampViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.dataArray, id: \.self) {
                    Text($0)
                        .font(.headline)
                }
            }
        }
        .task {
            await viewModel.getData()
        }
    }
    
}

struct ConcurrencyCourseGlobalActorBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ConcurrencyCourseGlobalActorBootcamp()
    }
}
