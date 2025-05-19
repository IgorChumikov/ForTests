//
//  QuickSearchView .swift
//  ForTests
//
//  Created by Игорь Чумиков on 27.05.2024.
//

import SwiftUI
import Combine

struct QuickSearchView : View {
    
    @State private var name: String = ""
    
    init() {
        let coloredNavAppearance = UINavigationBarAppearance()
        coloredNavAppearance.configureWithOpaqueBackground()
        coloredNavAppearance.backgroundColor = .orange
        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
        
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: .zero) {
                textField
                divider
                QuickSearchListFoundDocuments()
                Spacer()
            }
            .navigationTitle("Поиск по документу")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: closeButton)
        }
    }
    // MARK: - Private view
    
    private var textField: some View {
        HStack(alignment: .center, spacing: 10) {
            TextField("Поиск по документу", text: $name)
        
            clearTextButton
            findByTextButton
        }
        .padding(.horizontal, 16)
        .padding(.top, 10)
        .padding(.bottom, 10)
    }
    
    private var closeButton: some View {
        Button {
            // Код чтобы выйти
        } label: {
            Image(systemName: "x.square")
        }
        .foregroundColor(.white)
    }
    
    private var clearTextButton: some View {
        Button {
            // Код чтобы очистить
            name = ""
        } label: {
            Image(systemName: "pencil")
        }
    }
    
    private var findByTextButton: some View {
        Button {
            // Код чтобы найти
        } label: {
            Text("Найти")
        }
        .padding(10)
        .background(Color.red)
        .cornerRadius(5)
    }
    
    private var divider: some View {
        Divider().frame(height: 10).background(Color.blue)
            .padding(.bottom, 10)
    }
    
    
}


#Preview {
    QuickSearchView ()
}
