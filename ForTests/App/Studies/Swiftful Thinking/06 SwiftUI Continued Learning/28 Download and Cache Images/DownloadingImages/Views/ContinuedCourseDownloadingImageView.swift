//
//  ContinuedCourseDownloadingImageView.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Nick Sarno on 4/28/21.
//

import SwiftUI

struct ContinuedCourseDownloadingImageView: View {
    
    @StateObject var loader: ContinuedCourseImageLoadingViewModel
    
    init(url: String, key: String) {
        _loader = StateObject(wrappedValue: ContinuedCourseImageLoadingViewModel(url: url, key: key))
    }
    
    var body: some View {
        ZStack {
            if loader.isLoading {
                ProgressView()
            } else if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
                    .clipShape(Circle())
            }
        }
    }
}

struct ContinuedCourseDownloadingImageView_Previews: PreviewProvider {
    static var previews: some View {
        ContinuedCourseDownloadingImageView(url: "https://via.placeholder.com/600/92c952", key: "1")
            .frame(width: 75, height: 75)
            .previewLayout(.sizeThatFits)
    }
}
