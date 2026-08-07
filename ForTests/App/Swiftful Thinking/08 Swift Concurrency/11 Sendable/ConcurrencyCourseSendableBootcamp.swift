//
//  ConcurrencyCourseSendableBootcamp.swift
//  SwiftConcurrencyBootcamp
//
//  Created by Nick Sarno on 4/4/22.
//

import SwiftUI

actor ConcurrencyCourseCurrentUserManager {
    
    func updateDatabase(userInfo: ConcurrencyCourseMyClassUserInfo) {
        
    }
    
}

struct ConcurrencyCourseMyUserInfo: Sendable {
    var name: String
}

final class ConcurrencyCourseMyClassUserInfo: @unchecked Sendable {
    private var name: String
    let queue = DispatchQueue(label: "com.MyApp.ConcurrencyCourseMyClassUserInfo")
    
    init(name: String) {
        self.name = name
    }
    
    func updateName(name: String) {
        queue.async {
            self.name = name
        }
    }
}

class ConcurrencyCourseSendableBootcampViewModel: ObservableObject {
    
    let manager = ConcurrencyCourseCurrentUserManager()
    
    func updateCurrentUserInfo() async {
        
        let info = ConcurrencyCourseMyClassUserInfo(name: "info")
        
        await manager.updateDatabase(userInfo: info)
    }
    
}

struct ConcurrencyCourseSendableBootcamp: View {
    
    @StateObject private var viewModel = ConcurrencyCourseSendableBootcampViewModel()
    
    var body: some View {
        Text("Hello, World!")
            .task {
                
            }
    }
}

struct ConcurrencyCourseSendableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ConcurrencyCourseSendableBootcamp()
    }
}
