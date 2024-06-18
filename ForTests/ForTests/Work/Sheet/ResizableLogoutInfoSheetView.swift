//
//  ResizableLogoutInfoSheetView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 18.06.2024.
//

// Использовать с IOS 16

private enum Constants {
    static let textLogin = "Логин"
    static let textCloseButton = "Закрыть"
    static let heading = "Коммерческая версия с доступом к вашему комплекту КонсультантПлюс"
    static let textLoginButton = "Выйти"
}

import SwiftUI

// MARK: - ResizableLogoutInfoSheetView

struct ResizableLogoutInfoSheetView: View {
    // MARK: - Properties
    
    @State var loginNumber: String
    var action: () -> Void
    
    @State var isPresented: Bool = false
    
    // MARK: - Content
    
    var body: some View {
        ZStack {
            background
            VStack(alignment: .leading, spacing: .zero) {
                closeButton
                heading
                textInfo
                loginButton
            }
            .padding(.horizontal, 16)
        }
       // .modifier(AlertLogoutInfoModifier(isPresented: $isPresented))
    }
    
    // MARK: - Views
    
    private var background: some View {
        Color.white
            .edgesIgnoringSafeArea(.all)
    }
    
    private var closeButton: some View {
        Button {
            action()
        } label: {
            Text(Constants.textCloseButton)
               // .singlelineStyle(.size17, .regular, .textLinkBlue)
        }
        .padding(.top, 4)
        .padding(.bottom, 32)
    }
    
    private var heading: some View {
        Text(Constants.heading)
          //  .multilineStyle(.size26, .semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 24)
    }
    
    private var textInfo: some View {
        HStack(spacing: 16) {
            Text(Constants.textLogin)
                .foregroundColor(.black)
            Text(loginNumber)
                .foregroundColor(Color.blue)
        }
        .frame(height: 60)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 16)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.white)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.black, lineWidth: 1)
        )
        .padding(.bottom, 32)
    }
    
    private var loginButton: some View {
        HStack(spacing: .zero) {
            Spacer()
            Button {
                isPresented.toggle()
            } label: {
                Text(Constants.textLoginButton)
                   // .singlelineStyle(.size18, .medium, .whiteText)
            }
            .frame(width: 180, height: 40)
            .background(
                Color.brown
            )
            .cornerRadius(5)
            Spacer()
        }
        .padding(.bottom, 30)
    }
}

// MARK: - ResizableLogoutInfoSheetView_Preview

#Preview {
    ResizableLogoutInfoSheetView(
        loginNumber: "4653#45745345",
        action: {}
    )
}
