//
//  ContinuedCourseArraysBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Nick Sarno on 4/2/21.
//

import SwiftUI

struct ContinuedCourseUserModel: Identifiable {
    let id = UUID().uuidString
    let name: String?
    let points: Int
    let isVerified: Bool
}

class ContinuedCourseArrayModificationViewModel: ObservableObject {
    
    @Published var dataArray: [ContinuedCourseUserModel] = []
    @Published var filteredArray: [ContinuedCourseUserModel] = []
    @Published var mappedArray: [String] = []
    
    init() {
        getUsers()
        updateFilteredArray()
    }
    
    func updateFilteredArray() {
        
        // sort
        /*
//        filteredArray = dataArray.sorted { (user1, user2) -> Bool in
//            return user1.points > user2.points
//        }
        
//        filteredArray = dataArray.sorted(by: { $0.points < $1.points })
        */
        
        // filter
        /*
//        filteredArray = dataArray.filter({ (user) -> Bool in
//            return user.isVerified
//        })
        
        filteredArray = dataArray.filter({ $0.isVerified })
    */
        
        // map
        /*
//        mappedArray = dataArray.map({ (user) -> String in
//            return user.name ?? "ERROR"
//        })
        
//        mappedArray = dataArray.map({ $0.name })
        
//        mappedArray = dataArray.compactMap({ (user) -> String? in
//            return user.name
//        })
        
//        mappedArray = dataArray.compactMap({ $0.name })
 */
        
        mappedArray = dataArray
                        .sorted(by: { $0.points > $1.points })
                        .filter({ $0.isVerified })
                        .compactMap({ $0.name })
        
    }
    
    func getUsers() {
        let user1 = ContinuedCourseUserModel(name: "Nick", points: 5, isVerified: true)
        let user2 = ContinuedCourseUserModel(name: "Chris", points: 0, isVerified: false)
        let user3 = ContinuedCourseUserModel(name: nil, points: 20, isVerified: true)
        let user4 = ContinuedCourseUserModel(name: "Emily", points: 50, isVerified: false)
        let user5 = ContinuedCourseUserModel(name: "Samantha", points: 45, isVerified: true)
        let user6 = ContinuedCourseUserModel(name: "Jason", points: 23, isVerified: false)
        let user7 = ContinuedCourseUserModel(name: "Sarah", points: 76, isVerified: true)
        let user8 = ContinuedCourseUserModel(name: nil, points: 45, isVerified: false)
        let user9 = ContinuedCourseUserModel(name: "Steve", points: 1, isVerified: true)
        let user10 = ContinuedCourseUserModel(name: "Amanda", points: 100, isVerified: false)
        self.dataArray.append(contentsOf: [
            user1,
            user2,
            user3,
            user4,
            user5,
            user6,
            user7,
            user8,
            user9,
            user10,
        ])
    }
    
}

struct ContinuedCourseArraysBootcamp: View {
    
    @StateObject var vm = ContinuedCourseArrayModificationViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(vm.mappedArray, id: \.self) { name in
                    Text(name)
                        .font(.title)
                }
//                ForEach(vm.filteredArray) { user in
//                    VStack(alignment: .leading) {
//                        Text(user.name)
//                            .font(.headline)
//                        HStack {
//                            Text("Points: \(user.points)")
//                            Spacer()
//                            if user.isVerified {
//                                Image(systemName: "flame.fill")
//                            }
//                        }
//                    }
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color.blue.cornerRadius(10))
//                    .padding(.horizontal)
//                }
            }
        }
    }
}

struct ContinuedCourseArraysBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ContinuedCourseArraysBootcamp()
    }
}
