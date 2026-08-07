//
//  ConcurrencyCourseSearchableBootcamp.swift
//  SwiftConcurrencyBootcamp
//
//  Created by Nick Sarno on 5/20/23.
//

import SwiftUI
import Combine

struct ConcurrencyCourseRestaurant: Identifiable, Hashable {
    let id: String
    let title: String
    let cuisine: ConcurrencyCourseCuisineOption
}

enum ConcurrencyCourseCuisineOption: String {
    case american, italian, japanese
}

final class ConcurrencyCourseRestaurantManager {
    
    func getAllRestaurants() async throws -> [ConcurrencyCourseRestaurant] {
        [
            ConcurrencyCourseRestaurant(id: "1", title: "Burger Shack", cuisine: .american),
            ConcurrencyCourseRestaurant(id: "2", title: "Pasta Palace", cuisine: .italian),
            ConcurrencyCourseRestaurant(id: "3", title: "Sushi Heaven", cuisine: .japanese),
            ConcurrencyCourseRestaurant(id: "4", title: "Local Market", cuisine: .american),
        ]
    }
}

@MainActor
final class ConcurrencyCourseSearchableViewModel: ObservableObject {
    
    @Published private(set) var allRestaurants: [ConcurrencyCourseRestaurant] = []
    @Published private(set) var filteredRestaurants: [ConcurrencyCourseRestaurant] = []
    @Published var searchText: String = ""
    @Published var searchScope: ConcurrencyCourseSearchScopeOption = .all
    @Published private(set) var allSearchScopes: [ConcurrencyCourseSearchScopeOption] = []
    
    let manager = ConcurrencyCourseRestaurantManager()
    private var cancellables = Set<AnyCancellable>()
    
    var isSearching: Bool {
        !searchText.isEmpty
    }
    
    var showSearchSuggestions: Bool {
        searchText.count < 5
    }
    
    enum ConcurrencyCourseSearchScopeOption: Hashable {
        case all
        case cuisine(option: ConcurrencyCourseCuisineOption)
        
        var title: String {
            switch self {
            case .all:
                return "All"
            case .cuisine(option: let option):
                return option.rawValue.capitalized
            }
        }
    }
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
        $searchText
            .combineLatest($searchScope)
            .debounce(for: 0.3, scheduler: DispatchQueue.main)
            .sink { [weak self] (searchText, searchScope) in
                self?.filterRestaurants(searchText: searchText, currentSearchScope: searchScope)
            }
            .store(in: &cancellables)
    }
    
    private func filterRestaurants(searchText: String, currentSearchScope: ConcurrencyCourseSearchScopeOption) {
        guard !searchText.isEmpty else {
            filteredRestaurants = []
            searchScope = .all
            return
        }
        
        // Filter on search scope
        var restaurantsInScope = allRestaurants
        switch currentSearchScope {
        case .all:
            break
        case .cuisine(let option):
            restaurantsInScope = allRestaurants.filter({ $0.cuisine == option })
        }
        
        
        // Filter on search text
        let search = searchText.lowercased()
        filteredRestaurants = restaurantsInScope.filter({ restaurant in
            let titleContainsSearch = restaurant.title.lowercased().contains(search)
            let cuisineContainsSearch = restaurant.cuisine.rawValue.lowercased().contains(search)
            return titleContainsSearch || cuisineContainsSearch
        })
    }
    
    func loadRestaurants() async {
        do {
            allRestaurants = try await manager.getAllRestaurants()
            
            let allCuisines = Set(allRestaurants.map { $0.cuisine })
            allSearchScopes = [.all] + allCuisines.map({ ConcurrencyCourseSearchScopeOption.cuisine(option: $0) })
        } catch {
            print(error)
        }
    }
    
    func getSearchSuggestions() -> [String] {
        guard showSearchSuggestions else {
            return []
        }
        
        var suggestions: [String] = []
        
        let search = searchText.lowercased()
        
        if search.contains("pa") {
            suggestions.append("Pasta")
        }
        if search.contains("su") {
            suggestions.append("Sushi")
        }
        if search.contains("bu") {
            suggestions.append("Burger")
        }
        suggestions.append("Market")
        suggestions.append("Grocery")
        
        suggestions.append(ConcurrencyCourseCuisineOption.italian.rawValue.capitalized)
        suggestions.append(ConcurrencyCourseCuisineOption.japanese.rawValue.capitalized)
        suggestions.append(ConcurrencyCourseCuisineOption.american.rawValue.capitalized)

        return suggestions
    }
    
    func getRestaurantSuggestions() -> [ConcurrencyCourseRestaurant] {
        guard showSearchSuggestions else {
            return []
        }
        
        var suggestions: [ConcurrencyCourseRestaurant] = []
        
        let search = searchText.lowercased()
        
        if search.contains("ita") {
            suggestions.append(contentsOf: allRestaurants.filter({ $0.cuisine == .italian }))
        }
        if search.contains("jap") {
            suggestions.append(contentsOf: allRestaurants.filter({ $0.cuisine == .japanese }))
        }

        return suggestions
    }
}

struct ConcurrencyCourseSearchableBootcamp: View {
    
    @StateObject private var viewModel = ConcurrencyCourseSearchableViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(viewModel.isSearching ? viewModel.filteredRestaurants : viewModel.allRestaurants) { restaurant in
                    NavigationLink(value: restaurant) {
                        restaurantRow(restaurant: restaurant)
                    }
                }
            }
            .padding()
            
//            Text("ViewModel is searching: \(viewModel.isSearching.description)")
//            ConcurrencyCourseSearchChildView()
        }
        .searchable(text: $viewModel.searchText, placement: .automatic, prompt: Text("Search restaurants..."))
        .searchScopes($viewModel.searchScope, scopes: {
            ForEach(viewModel.allSearchScopes, id: \.self) { scope in
                Text(scope.title)
                    .tag(scope)
            }
        })
        .searchSuggestions({
            ForEach(viewModel.getSearchSuggestions(), id: \.self) { suggestion in
                Text(suggestion)
                    .searchCompletion(suggestion)
            }
            ForEach(viewModel.getRestaurantSuggestions(), id: \.self) { suggestion in
                NavigationLink(value: suggestion) {
                    Text(suggestion.title)
                }
            }
        })
//        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Restaurants")
        .task {
            await viewModel.loadRestaurants()
        }
        .navigationDestination(for: ConcurrencyCourseRestaurant.self) { restaurant in
            Text(restaurant.title.uppercased())
        }
    }
    
    private func restaurantRow(restaurant: ConcurrencyCourseRestaurant) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(restaurant.title)
                .font(.headline)
                .foregroundColor(.red)
            Text(restaurant.cuisine.rawValue.capitalized)
                .font(.caption)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.black.opacity(0.05))
        .tint(.primary)
    }
}

struct ConcurrencyCourseSearchChildView: View {
    @Environment(\.isSearching) private var isSearching
    
    var body: some View {
        Text("Child View is searching: \(isSearching.description)")
    }
}

struct ConcurrencyCourseSearchableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ConcurrencyCourseSearchableBootcamp()
        }
    }
}
