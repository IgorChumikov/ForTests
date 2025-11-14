//
//  Picker_BindingToData.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 Picker с привязкой к массиву данных (iOS 14+)
 
 • Вместо ручного перечисления значений можно использовать `ForEach`,
   чтобы динамически заполнять Picker данными из массива или коллекции.
 • При этом необходимо указать идентификатор (`id:`),
   чтобы SwiftUI мог отслеживать элементы (например, `\.self` для строк).
 • Такой подход особенно удобен при работе с сетевыми данными или моделями.
 
 */

import SwiftUI

struct Picker_BindingToData: View {
    @State private var youTuberName = "Mark"
    var youTubers = ["Sean", "Chris", "Mark", "Scott", "Paul"]
    
    var body: some View {
        VStack(spacing: 20) {
            
            HeaderView(
                "Picker",
                subtitle: "Binding to Data",
                desc: "Use a ForEach with your Picker view to populate it with data."
            )
            
            Text("Who do you want to watch today?")
            
            // MARK: - Picker с данными из массива
            Picker(selection: $youTuberName, label: Text("")) {
                ForEach(youTubers, id: \.self) { name in
                    Row(name: name)
                }
            }
            .pickerStyle(.wheel)
            .padding(.horizontal)
            
            Text("Selected: \(youTuberName)")
                .foregroundStyle(.secondary)
            
            Spacer()
        }
        .font(.title)
        .padding()
    }
}

// MARK: - Вспомогательная вью для строки
fileprivate struct Row: View {
    var name: String
    
    var body: some View {
        HStack {
            Image(systemName: "person.fill")
                .padding(.trailing, 4)
                .foregroundStyle(.orange)
            Text(name)
        }
    }
}

#Preview {
    Picker_BindingToData()
}
