import SwiftUI

struct CursorWeatherErrorCardView: View {
    let message: String

    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "wifi.exclamationmark")
                .font(.largeTitle)
                .foregroundStyle(CursorWeatherTheme.pink)

            Text(message)
                .font(.callout)
                .multilineTextAlignment(.center)
                .foregroundStyle(CursorWeatherTheme.pinkSoft)
        }
        .padding(24)
        .frame(maxWidth: .infinity)
        .background(CursorWeatherTheme.cardFill, in: RoundedRectangle(cornerRadius: 20))
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(CursorWeatherTheme.cardStroke, lineWidth: 1)
        }
    }
}

#Preview {
    CursorWeatherErrorCardView(message: "Нет подключения к интернету")
        .padding()
        .background(Color.black)
}
