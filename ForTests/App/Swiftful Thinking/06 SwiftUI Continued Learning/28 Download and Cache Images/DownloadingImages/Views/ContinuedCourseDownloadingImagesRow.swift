//
//  ContinuedCourseDownloadingImagesRow.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Nick Sarno on 4/28/21.
//

import SwiftUI

struct ContinuedCourseDownloadingImagesRow: View {
    
    let model: ContinuedCoursePhotoModel
    
    var body: some View {
        HStack {
            ContinuedCourseDownloadingImageView(url: model.url, key: "\(model.id)")
                .frame(width: 75, height: 75)
            VStack(alignment: .leading) {
                Text(model.title)
                    .font(.headline)
                Text(model.url)
                    .foregroundColor(.gray)
                    .italic()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct ContinuedCourseDownloadingImagesRow_Previews: PreviewProvider {
    static var previews: some View {
        ContinuedCourseDownloadingImagesRow(model: ContinuedCoursePhotoModel(albumId: 1, id: 1, title: "Title", url: "https://via.placeholder.com/600/92c952", thumbnailUrl: "https://via.placeholder.com/600/92c952"))
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
