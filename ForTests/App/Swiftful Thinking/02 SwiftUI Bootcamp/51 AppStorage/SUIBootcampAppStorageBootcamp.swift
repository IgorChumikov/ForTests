//
//  SUIBootcampAppStorageBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Nick Sarno on 2/26/21.
//

import SwiftUI

struct SUIBootcampAppStorageBootcamp: View {
    
    @AppStorage("name") var currentUserName: String?
    
    var body: some View {
        VStack(spacing: 20) {
            Text(currentUserName ?? "Add Name Here")
            
            if let name = currentUserName {
                Text(name)
            }
            
            Button("Save".uppercased()) {
                let name: String = "Emily"
                currentUserName = name
            }
        }
    }
}

struct SUIBootcampAppStorageBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SUIBootcampAppStorageBootcamp()
    }
}
