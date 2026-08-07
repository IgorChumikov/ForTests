//
//  ConcurrencyCourseMVVMBootcamp.swift
//  SwiftConcurrencyBootcamp
//
//  Created by Nick Sarno on 5/18/23.
//

import SwiftUI

final class ConcurrencyCourseMyManagerClass {
    func getData() async throws -> String {
        "Some Data!"
    }
}

actor ConcurrencyCourseMyManagerActor {
    func getData() async throws -> String {
        "Some Data!"
    }
}

@MainActor
final class ConcurrencyCourseMVVMBootcampViewModel: ObservableObject {
    
    let managerClass = ConcurrencyCourseMyManagerClass()
    let managerActor = ConcurrencyCourseMyManagerActor()
    
    @Published private(set) var myData: String = "Starting text"
    private var tasks: [Task<Void, Never>] = []
    
    func cancelTasks() {
        tasks.forEach({ $0.cancel() })
        tasks = []
    }
    
    func onCallToActionButtonPressed() {
        let task = Task {
            do {
//                myData = try await managerClass.getData()
                myData = try await managerActor.getData()
            } catch {
                print(error)
            }
        }
        tasks.append(task)
    }
}

struct ConcurrencyCourseMVVMBootcamp: View {
    
    @StateObject private var viewModel = ConcurrencyCourseMVVMBootcampViewModel()
    
    var body: some View {
        VStack {
            Button(viewModel.myData) {
                viewModel.onCallToActionButtonPressed()
            }
        }
        .onDisappear {
            
        }
    }
}

struct ConcurrencyCourseMVVMBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ConcurrencyCourseMVVMBootcamp()
    }
}
