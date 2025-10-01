//
//  CustomResizableLogoutInfoSheetView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 19.06.2024.
//

import SwiftUI


private enum Constants {
    static let textLogin = "Логин"
    static let textCloseButton = "Закрыть"
    static let heading = "Коммерческая версия с доступом к вашему комплекту КонсультантПлюс"
    static let textLoginButton = "Выйти"
}

import SwiftUI

// MARK: - CustomResizableLogoutInfoSheetView

struct CustomResizableLogoutInfoSheetView: View {
    // MARK: - Properties
    
    @Binding var isSheetPresented: Bool
    
    private var profiles: [String] {
        [
            "Бухгалтерия и финансы в коммерческой организации",
            "Юриспруденция",
            "Специалист по закупкам",
            "Руководитель",
            "Студент или преподаватель",
        ]
    }
    @State private var selectedProfile: String? = nil
    
    var animationDuration: Double = 0.3
    @Environment(\.safeAreaInsets)
    private var safeAreaInsets: EdgeInsets
    @GestureState
    private var translation: CGFloat = 0
    @State
    private var bottomViewHeight: CGFloat = 0
    
    @State var isPresented: Bool = false
    
    // MARK: - Computed Properties
    
    private var offset: CGFloat {
        if isSheetPresented {
            return max(translation, .zero)
        } else {
            return bottomViewHeight + safeAreaInsets.bottom
        }
    }
    // MARK: - Content
    
    public var body: some View {
        ZStack {
            background
            content
        }
    }
    
    // MARK: - View
    
    private var content: some View {
        VStack(spacing: .zero) {
            Spacer(minLength: .zero)
            VStack(alignment: .leading, spacing: .zero) {
                dragIndicator
                closeButton
                heading
                textInfo
                loginButton
            }
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity)
            .background {
               Color.white
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                    .ignoresSafeArea(edges: .bottom)
            }
            .contentSize(.dynamic) { size in
                bottomViewHeight = size.height
            }
            .offset(y: offset)
            .animation(.interactiveSpring(response: animationDuration), value: translation == 0)
            .animation(.spring(response: animationDuration), value: isSheetPresented)
        }
    }
    
    private var background: some View {
        Color.gray
            .edgesIgnoringSafeArea(.all)
            .gesture(
                TapGesture()
                    .onEnded { _ in
                        isSheetPresented.toggle()
                    }
            )
    }
    
    private var dragIndicator: some View {
        HStack(alignment: .center, spacing: .zero) {
            Spacer()
            CustomDragIndicatorView()
            Spacer()
        }
        .padding(.vertical, 4)
    }
    
    private var closeButton: some View {
        Button {
            isSheetPresented.toggle()
        } label: {
            Text(Constants.textCloseButton)
        }
        .padding(.bottom, 32)
    }
    
    private var heading: some View {
        Text("Ваш профиль")
            .font(.callout)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.bottom, 24)
    }
    
    private var textInfo: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(profiles.indices, id: \.self) { index in
                HStack(alignment: .center, spacing: 6) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(profiles[index])
                            .foregroundColor(.black)
                            .lineLimit(3)
                    }
                    Spacer()
                    Button {
                        print("index - \(index)")
                        selectedProfile = profiles[index]
                        print("selectedProfile - \(selectedProfile ?? "")")
                    } label: {
                        if selectedProfile == profiles[index] {
                            Image(systemName: "circle.fill")
                        } else {
                            Image(systemName: "circle")
                        }
                    }
                }
                
                if index != profiles.indices.last {
                    Divider()
                        .background(Color.black)
                        .padding(.vertical, 11)
                        .padding(.horizontal, -16)
                }
            }
        }
        .padding(.bottom, 24)
    }
    
    private var loginButton: some View {
        Button {
            isSheetPresented.toggle()
        } label: {
            Text("Закрыть")
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.vertical, 10)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
        }
    }
}

// MARK: - CustomResizableLogoutInfoSheetView_Previews

#Preview {
    CustomResizableLogoutInfoSheetView(
        isSheetPresented: .constant(true))
}



public struct CustomDragIndicatorView: View {

    // MARK: - Content

    public var body: some View {
        RoundedRectangle(cornerRadius: 3)
            .fill(Color.gray)
            .frame(width: 80, height: 5)
    }
}
