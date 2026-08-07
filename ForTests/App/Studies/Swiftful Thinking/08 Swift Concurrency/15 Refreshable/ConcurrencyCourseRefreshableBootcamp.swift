//
//  ConcurrencyCourseRefreshableBootcamp.swift
//  SwiftConcurrencyBootcamp
//
//  Created by Nick Sarno on 5/20/23.
//

import SwiftUI

final class ConcurrencyCourseRefreshableDataService {
    
    func getData() async throws -> [String] {
        try? await Task.sleep(nanoseconds: 5_000_000_000)
        return ["Apple", "Orange", "Banana"].shuffled()
    }
}

@MainActor
final class ConcurrencyCourseRefreshableBootcampViewModel: ObservableObject {
    @Published private(set) var items: [String] = []
    let manager = ConcurrencyCourseRefreshableDataService()
    
    func loadData() async {
        do {
            items = try await manager.getData()
        } catch {
            print(error)
        }
    }
}

struct ConcurrencyCourseRefreshableBootcamp: View {
    
    @StateObject private var viewModel = ConcurrencyCourseRefreshableBootcampViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(viewModel.items, id: \.self) { item in
                        Text(item)
                            .font(.headline)
                    }
                }
            }
            .refreshable {
                await viewModel.loadData()
            }
            .navigationTitle("Refreshable")
            .task {
                await viewModel.loadData()
            }
        }
    }
}

struct ConcurrencyCourseRefreshableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ConcurrencyCourseRefreshableBootcamp()
    }
}
