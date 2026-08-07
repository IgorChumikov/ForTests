//
//  SUIBootcampViewModelBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Nick Sarno on 2/25/21.
//

import SwiftUI

struct SUIBootcampFruitModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let count: Int
}

class SUIBootcampFruitViewModel: ObservableObject {
    
    @Published var fruitArray: [SUIBootcampFruitModel] = []
    @Published var isLoading: Bool = false
    
    init() {
        getFruits()
    }
    
    func getFruits() {
        let fruit1 = SUIBootcampFruitModel(name: "Orange", count: 1)
        let fruit2 = SUIBootcampFruitModel(name: "Banana", count: 2)
        let fruit3 = SUIBootcampFruitModel(name: "Watermelon", count: 88)
        
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.fruitArray.append(fruit1)
            self.fruitArray.append(fruit2)
            self.fruitArray.append(fruit3)
            self.isLoading = false
        }
        
    }
    
    func deleteFruit(index: IndexSet) {
        fruitArray.remove(atOffsets: index)
    }
    
}

struct SUIBootcampViewModelBootcamp: View {
    
    // @StateObject -> USE THIS ON CREATION / INIT
    // @ObservedObject -> USE THIS FOR SUBVIEWS
    @StateObject var fruitViewModel: SUIBootcampFruitViewModel = SUIBootcampFruitViewModel()
    
    var body: some View {
        NavigationView {
            List {
                
                if fruitViewModel.isLoading {
                    ProgressView()
                } else {
                    ForEach(fruitViewModel.fruitArray) { fruit in
                        HStack {
                            Text("\(fruit.count)")
                                .foregroundColor(.red)
                            Text(fruit.name)
                                .font(.headline)
                                .bold()
                        }
                    }
                    .onDelete(perform: fruitViewModel.deleteFruit)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("SUIBootcampFruit List")
            .navigationBarItems(trailing:
                                    NavigationLink(
                                        destination: SUIBootcampRandomScreen(fruitViewModel: fruitViewModel),
                                        label: {
                                            Image(systemName: "arrow.right")
                                                                .font(.title)
                                        })
            )
        }
    }
    
}


struct SUIBootcampRandomScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var fruitViewModel: SUIBootcampFruitViewModel
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            VStack {
                ForEach(fruitViewModel.fruitArray) { fruit in
                    Text(fruit.name)
                        .foregroundColor(.white)
                        .font(.headline)
                }
            }
        }
    }
}

struct SUIBootcampViewModelBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SUIBootcampViewModelBootcamp()
    }
}
