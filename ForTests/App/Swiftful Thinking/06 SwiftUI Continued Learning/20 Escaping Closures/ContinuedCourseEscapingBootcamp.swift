//
//  ContinuedCourseEscapingBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Nick Sarno on 4/10/21.
//

import SwiftUI

class ContinuedCourseEscapingViewModel: ObservableObject {
    
    @Published var text: String = "Hello"
    
    func getData() {
        downloadData5 { [weak self] (returnedResult) in
            self?.text = returnedResult.data
        }
    }
    
    func downloadData() -> String {
        return "New data!"
    }
    
    func downloadData2(completionHandler: (_ data: String) -> ()) {
        completionHandler("New data!")
    }
    
    func downloadData3(completionHandler: @escaping (_ data: String) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            completionHandler("New data!")
        }
    }
    
    func downloadData4(completionHandler: @escaping (ContinuedCourseDownloadResult) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let result = ContinuedCourseDownloadResult(data: "New data!")
            completionHandler(result)
        }
    }
    
    func downloadData5(completionHandler: @escaping DownloadCompletion) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let result = ContinuedCourseDownloadResult(data: "New data!")
            completionHandler(result)
        }
    }
}

struct ContinuedCourseDownloadResult {
    let data: String
}

typealias DownloadCompletion = (ContinuedCourseDownloadResult) -> ()

struct ContinuedCourseEscapingBootcamp: View {
    
    @StateObject var vm = ContinuedCourseEscapingViewModel()
    
    var body: some View {
        Text(vm.text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundColor(.blue)
            .onTapGesture {
                vm.getData()
            }
    }
}

struct ContinuedCourseEscapingBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ContinuedCourseEscapingBootcamp()
    }
}
