//
//  SUIBootcampEnvironmentObjectBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Nick Sarno on 2/26/21.
//

import SwiftUI

// ObservedObject
// StateObject
// EnvironmentObject


class SUIBootcampEnvironmentViewModel: ObservableObject {
    
    @Published var dataArray: [String] = []
    
    init() {
        getData()
    }
    
    func getData() {
        self.dataArray.append(contentsOf: ["iPhone", "iPad", "iMac", "Apple Watch"])
    }
    
    
}

struct SUIBootcampEnvironmentObjectBootcamp: View {
    
    @StateObject var viewModel: SUIBootcampEnvironmentViewModel = SUIBootcampEnvironmentViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.dataArray, id: \.self) { item in
                    NavigationLink(
                        destination: SUIBootcampDetailView(selectedItem: item),
                        label: {
                            Text(item)
                        })
                    
                }
            }
            .navigationTitle("iOS Devices")
        }
        .environmentObject(viewModel)
    }
}

struct SUIBootcampDetailView: View {
    
    let selectedItem: String
    
    var body: some View {
        ZStack {
            // background
            Color.orange.ignoresSafeArea()
            
            //foreground
            NavigationLink(
                destination: SUIBootcampFinalView(),
                label: {
                    Text(selectedItem)
                        .font(.headline)
                        .foregroundColor(.orange)
                        .padding()
                        .padding(.horizontal)
                        .background(Color.white)
                        .cornerRadius(30)
                })
        }
    }
}

struct SUIBootcampFinalView: View {
    
    @EnvironmentObject var viewModel: SUIBootcampEnvironmentViewModel
    
    var body: some View {
        ZStack {
            // background
            LinearGradient(
                gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)), Color(#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1))]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            // foreground
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(viewModel.dataArray, id: \.self) { item in
                        Text(item)
                    }
                }
                .foregroundColor(.white)
                .font(.largeTitle)
            }
            
        }
    }
}

struct SUIBootcampEnvironmentObjectBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SUIBootcampEnvironmentObjectBootcamp()
        //SUIBootcampDetailView(selectedItem: "iPhone")
        //SUIBootcampFinalView()
    }
}
