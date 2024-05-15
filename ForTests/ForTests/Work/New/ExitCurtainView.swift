//
//  ExitCurtainView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 14.05.2024.
//

private extension CGFloat {
    static let radius: CGFloat = 20
    static let indicatorPadding: CGFloat = 8
    static let snapRatio: CGFloat = 0.33
}

import SwiftUI

struct ExitCurtainView: View {
    // MARK: - Properties
    
    @State private var name: String = "Логин 4653#45745345"
    
    @Binding var isSheetPresented: Bool
    @Environment(\.bottomSheetAnimationDuration)
    private var animationDuration: Double
    @Environment(\.safeAreaInsets)
    private var safeAreaInsets: EdgeInsets
    @Environment(\.bottomSheetMaxHeight)
    private var maxHeight: CGFloat
    @GestureState
    private var translation: CGFloat = 0
    @State
    private var bottomViewHeight: CGFloat = 0
    
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
            VStack(spacing: .zero) {
                Spacer(minLength: .zero)
                VStack(alignment: .leading, spacing: .zero) {
                    closeButton
                        .padding(.top, 20)
                        .padding(.bottom, 20)
                    Text("Коммерческая версия с доступом к вашему комплекту")
                        .padding(.bottom, 20)
                    textField
                        .padding(.bottom, 20)
                    
                    HStack(spacing: .zero) {
                        Spacer()
                        toComeInButton
                        Spacer()
                    }
                    .padding(.bottom, 20)
                    
                }
                .padding(.horizontal, 16)
                .frame(maxWidth: .infinity)
                .background {
                    Color.gray
                        .cornerRadius(.radius, corners: [.topLeft, .topRight])
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
    }
    
    private var background: some View {
        Group {
            if !isSheetPresented {
                Color.clear
                    .edgesIgnoringSafeArea(.all)
                    .gesture(
                        TapGesture()
                            .onEnded { _ in
                                isSheetPresented.toggle()
                            }
                    )
            } else {
                Color.green
                    .edgesIgnoringSafeArea(.all)
                    .gesture(
                        TapGesture()
                            .onEnded { _ in
                                isSheetPresented.toggle()
                            }
                    )
       
            }
        }
    }
    
    private var closeButton: some View {
        Button {
            isSheetPresented.toggle()
        } label: {
            Text("Закрыть").foregroundColor(.blue)
               // .singlelineStyle(.size16, .bold, .whiteText)
        }

    }
    
    private var toComeInButton: some View {
        Button {
            //
        } label: {
            Text("Войти").foregroundColor(.black)
               // .singlelineStyle(.size16, .bold, .whiteText)
        }
        .frame(width: 150, height: 40)
        .background(
            Color.blue
        )
        .cornerRadius(10)
    }
    
    private var textField: some View {
        TextField("Я тут", text: $name)
        //.singlelineStyle(.size17, .regular)
            .frame(height: 48)
            .padding(top: .zero, leading: 16, bottom: .zero, trailing: 12)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.white)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.red, lineWidth: 1)
            )
    }
    
}
    

#Preview {
    ExitCurtainView(isSheetPresented: .constant(true))
}
