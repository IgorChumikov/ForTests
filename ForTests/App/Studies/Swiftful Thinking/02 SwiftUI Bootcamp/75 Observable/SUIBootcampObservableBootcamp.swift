//
//  SUIBootcampObservableBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Nick Sarno on 1/27/24.
//

import SwiftUI

@Observable class ObservableViewModel {
    
    var title: String = "Some title"
    //@ObservationIgnored var value: String = "Some title"
}

struct SUIBootcampObservableBootcamp: View {
    
    @State private var viewModel = ObservableViewModel()
    
    var body: some View {
        VStack(spacing: 40) {
            Button(viewModel.title) {
                viewModel.title = "new title!"
            }
            
            SUIBootcampSomeChildView(viewModel: viewModel)
            
            SUIBootcampSomeThirdView()
        }
        .environment(viewModel)
    }
}

struct SUIBootcampSomeChildView: View {
    
    @Bindable var viewModel: ObservableViewModel
    
    var body: some View {
        Button(viewModel.title) {
            viewModel.title = "asdkjf;alsdjfl;ksadjf!"
        }
    }
}

struct SUIBootcampSomeThirdView: View {
    
    @Environment(ObservableViewModel.self) var viewModel
    
    var body: some View {
        Button(viewModel.title) {
            viewModel.title = "Third view!!!!!"
        }
    }
}

#Preview {
    SUIBootcampObservableBootcamp()
}
