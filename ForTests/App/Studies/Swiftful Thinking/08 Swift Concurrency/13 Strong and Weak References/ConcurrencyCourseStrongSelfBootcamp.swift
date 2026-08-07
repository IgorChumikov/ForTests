//
//  ConcurrencyCourseStrongSelfBootcamp.swift
//  SwiftConcurrencyBootcamp
//
//  Created by Nick Sarno on 5/18/23.
//

import SwiftUI

final class ConcurrencyCourseStrongSelfDataService {
    
    func getData() async -> String {
        "Updated data!"
    }
    
}

final class ConcurrencyCourseStrongSelfBootcampViewModel: ObservableObject {
    
    @Published var data: String = "Some title!"
    let dataService = ConcurrencyCourseStrongSelfDataService()
    
    private var someTask: Task<Void, Never>? = nil
    private var myTasks: [Task<Void, Never>] = []

    func cancelTasks() {
        someTask?.cancel()
        someTask = nil
        
        myTasks.forEach({ $0.cancel() })
        myTasks = []
    }
    
    // This implies a strong reference...
    func updateData() {
        Task {
            data = await dataService.getData()
        }
    }
    
    // This is a strong reference...
    func updateData2() {
        Task {
            self.data = await self.dataService.getData()
        }
    }
    
    // This is a strong reference...
    func updateData3() {
        Task { [self] in
            self.data = await self.dataService.getData()
        }
    }
    
    // This is a weak reference
    func updateData4() {
        Task { [weak self] in
            if let data = await self?.dataService.getData() {
                self?.data = data
            }
        }
    }
    
    // We don't need to manage weak/strong
    // We can manage the Task!
    func updateData5() {
        someTask = Task {
            self.data = await self.dataService.getData()
        }
    }
    
    // We can manage the Task!
    func updateData6() {
        let task1 = Task {
            self.data = await self.dataService.getData()
        }
        myTasks.append(task1)
        
        let task2 = Task {
            self.data = await self.dataService.getData()
        }
        myTasks.append(task2)
    }
    
    // We purposely do not cancel tasks to keep strong references
    func updateData7() {
        Task {
            self.data = await self.dataService.getData()
        }
        Task.detached {
            self.data = await self.dataService.getData()
        }
    }
    
    func updateData8() async {
        self.data = await self.dataService.getData()
    }

}

struct ConcurrencyCourseStrongSelfBootcamp: View {
    
    @StateObject private var viewModel = ConcurrencyCourseStrongSelfBootcampViewModel()
    
    var body: some View {
        Text(viewModel.data)
            .onAppear {
                viewModel.updateData()
            }
            .onDisappear {
                viewModel.cancelTasks()
            }
            .task {
                await viewModel.updateData8()
            }
    }
}

struct ConcurrencyCourseStrongSelfBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ConcurrencyCourseStrongSelfBootcamp()
    }
}
