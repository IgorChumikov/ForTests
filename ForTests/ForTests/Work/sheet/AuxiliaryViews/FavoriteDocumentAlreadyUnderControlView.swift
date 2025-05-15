//
//  FavoriteDocumentAlreadyUnderControlView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 15.05.2025.
//

import SwiftUI

// MARK: - FavoriteDocumentAlreadyUnderControlView

struct FavoriteDocumentAlreadyUnderControlView: View {
    
    // MARK: - Content
    
    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            controlTitleHeader
            controlConflictNotice
            fragmentSelectionInfo
            selectedFragmentBox
            confirmationQuestionText
        }
        .padding(.horizontal, 16)
    }
    
    // MARK: - Views
    
    private var controlTitleHeader: some View {
        Text("Постановка на контроль")
            .font(.system(size: 17, weight: .semibold))
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.top, 13)
            .padding(.bottom, 37)
    }
    
    private var controlConflictNotice: some View {
        Text("Документ уже нахдится на контроле целиком")
            .font(.system(size: 17, weight: .semibold))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 24)
    }
    
    private var fragmentSelectionInfo: some View {
        Text("Вы выбрали для постановки на контроль в нем отдельный фрагмент:")
            .font(.system(size: 17, weight: .regular))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 24)
    }
    
    private var selectedFragmentBox: some View {
        Text("Статья 6.8. Незаконный оборот наркотических средств, психотропных веществ или их аналогов и незаконные приобретение, хранение, перевозка растений, содержащих наркотические средства или психотропные вещества, либо их частей, содержащих наркотические средства или психотропные вещества")
            .font(.system(size: 17, weight: .regular))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(hex: "#EDEDED"))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(hex: "#7C68AB"), lineWidth: 1)
            )
    }
    
    private var confirmationQuestionText: some View {
        Text("Вы действительно хотите следить и за изменениями в этом фрагменте?")
            .font(.system(size: 17, weight: .regular))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 24)
    }
}

// MARK: - FavoriteDocumentAlreadyUnderControlView_Previews

#Preview {
    FavoriteDocumentAlreadyUnderControlView()
}
