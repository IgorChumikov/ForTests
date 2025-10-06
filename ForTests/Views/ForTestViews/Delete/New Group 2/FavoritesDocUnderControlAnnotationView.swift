import SwiftUI

struct FavoritesDocUnderControlAnnotationView: View {
    
    let text: String
    @State private var isExpanded = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(text)
                .transition(.move(edge: .top).combined(with: .scale))
                .lineSpacing(3)
                .lineLimit(isExpanded ? nil : 4)
              //  .animation(.easeOut, value: isExpanded)
            expandButton
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var expandButton: some View {
        Button {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                isExpanded.toggle()
            }
        } label: {
            HStack(alignment: .center, spacing: 4) {
                Image(systemName: isExpanded ? "arrow.up" : "arrow.down")
                Text(isExpanded ? "Свернуть" : "Развернуть")
            }
            .foregroundColor(.blue)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    FavoritesDocUnderControlAnnotationView(
        text: "Дополнены положения о личном фонде. Уточнены нормы о ликвидации общественно полезного фонда в случае осуществления деятельности, противоречащей уставным целям. Дополнены положения о личном фонде. Уточнены нормы о ликвидации общественно полезного фонда в случае осуществления деятельности, противоречащей уставным целям."
    )
    .padding()
}

extension AnyTransition {
    static var moveAndScale: AnyTransition {
        AnyTransition.move(edge: .top).combined(with: .scale)
    }
}
