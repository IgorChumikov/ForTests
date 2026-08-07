//
//  SUIBootcampNavigationViewBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Nick Sarno on 1/25/21.
//

import SwiftUI

struct SUIBootcampNavigationViewBootcamp: View {
    var body: some View {
        NavigationView {
            ScrollView {
                NavigationLink("Hello, world!",
                               destination: SUIBootcampMyOtherScreen())
                
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
            }
            .navigationTitle("All Inboxes")
            //.navigationBarTitleDisplayMode(.inline)
            //.navigationBarHidden(true)
            .navigationBarItems(
                leading:
                    HStack {
                        Image(systemName: "person.fill")
                        Image(systemName: "flame.fill")
                    }


                ,
                trailing:
                    NavigationLink(
                    destination: SUIBootcampMyOtherScreen(),
                    label: {
                        Image(systemName: "gear")
                    })
                    .accentColor(.red)
            )
        }
    }
}

struct SUIBootcampMyOtherScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
                .navigationTitle("Green Screen!")
                //.navigationBarHidden(true)
            
            VStack {
                Button("BACK BUTTON") {
                    presentationMode.wrappedValue.dismiss()
                }
                
                NavigationLink("Click here", destination: Text("3rd screen!"))
            }
        }
    }
}

struct SUIBootcampNavigationViewBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SUIBootcampNavigationViewBootcamp()
    }
}
