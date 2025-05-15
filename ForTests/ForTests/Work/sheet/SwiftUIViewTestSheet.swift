//
//  SwiftUIViewTestSheet.swift
//  ForTests
//
//  Created by Игорь Чумиков on 15.05.2025.
//

// Только с 16

import SwiftUI

@available(iOS 16.0, *)
struct SwiftUIViewTestSheet: View {
    @State private var isShowingTravelModes = false

    var body: some View {
        VStack {
            Button("Открыть варианты") {
                isShowingTravelModes = true
            }
            .padding()
        }
        .sheet(isPresented: $isShowingTravelModes) {
            if #available(iOS 16, *) {
                travelOptionView
                  //  .presentationDetents([.height(500)])
                 .presentationDetents([.large, .medium])
              } else {
                  travelOptionView
              }
        }
    }

    var travelOptionView: some View {
        VStack(alignment: .leading, spacing: 0) {
            ScrollView(.vertical) {
                FavoriteDocumentAlreadyUnderControlView()
                    .padding(.top, 10)
            }
            buttons
        }
    }
    
    
    private var buttons: some View {
        VStack(alignment: .center, spacing: .zero) {
            separator
            followFragmentButton
            cancelButton
        }
    }
    
    private var separator: some View {
        Divider()
            .background(Color(hex: "#E0E0E0"))
            .padding(.bottom, 16)
            .padding(.horizontal, -16)
    }
    
    private var followFragmentButton: some View {
        Button {
            isShowingTravelModes = false
        } label: {
            Text("Да, следить за этим объектом")
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(hex: "#705DC1"))
                .cornerRadius(5)
                .frame(height: 44)
        }
        .padding(.bottom, 16)
    }
    
    private var cancelButton: some View {
        Button {
            isShowingTravelModes = false
        } label: {
            Text("Отменить")
                .font(.system(size: 17, weight: .semibold))
                .foregroundStyle(Color(hex: "#705DC1"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .frame(height: 44)
        }
    }
}

@available(iOS 16.0, *)
#Preview {
    SwiftUIViewTestSheet()
}
