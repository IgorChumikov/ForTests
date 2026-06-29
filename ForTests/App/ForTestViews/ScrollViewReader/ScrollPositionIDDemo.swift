import SwiftUI

// MARK: - Модель

struct MyItem: Identifiable, Hashable {
    let title: String
    var id: String { title }
}

// MARK: - Ячейка

struct ItemView: View {
    let item: MyItem

    var body: some View {
        Text(item.title)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.green.opacity(0.2))
            .cornerRadius(8)
            .padding(.horizontal)
    }
}

// MARK: - Основной экран

struct ScrollRestoreDemo: View {
    @State private var items: [MyItem] = (0..<100).map { MyItem(title: "Item \($0)") }
    @State private var currentID: String? = nil
    @State private var lastSize: CGSize = .zero
    @State private var isScrollLocked = false

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 16) {
                Button("Scroll to item #50") {
                    if items.indices.contains(50) {
                        currentID = items[50].title
                    }
                }
                .buttonStyle(.borderedProminent)

                Text("Текущий ID: \(currentID ?? "нет")")
                    .font(.caption)
                    .foregroundColor(.gray)

                ScrollView {
                    LazyVStack(spacing: 10) {
                        ForEach(items) { item in
                            ItemView(item: item)
                                .id(item.id)
                        }
                    }
                    .scrollTargetLayout()
                }
                .scrollDisabled(isScrollLocked) // ⛔️ Блокируем во время поворота
                .scrollPosition(id: $currentID, anchor: .top)
            }
            .padding()
        }
    }
}

// MARK: - Preview

#Preview {
    ScrollRestoreDemo()
}
