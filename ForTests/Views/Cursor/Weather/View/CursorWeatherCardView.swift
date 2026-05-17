import SwiftUI

struct CursorWeatherCardView: View {
    let model: CursorWeatherUIModel

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: model.systemIconName)
                .font(.system(size: 72))
                .symbolRenderingMode(.palette)
                .foregroundStyle(CursorWeatherTheme.pink, CursorWeatherTheme.pinkSoft)
                .symbolEffect(.bounce, value: model.cityName)

            Text(model.temperature)
                .font(.system(size: 80, weight: .thin, design: .rounded))
                .foregroundStyle(CursorWeatherTheme.pink)

            Text(model.conditionDescription)
                .font(.title3.weight(.medium))
                .foregroundStyle(CursorWeatherTheme.pinkSoft)

            HStack(spacing: 20) {
                detailItem(icon: "wind", title: "Ветер", value: model.windSpeed)
            }
            .padding(.top, 4)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 36)
        .padding(.horizontal, 24)
        .background(CursorWeatherTheme.cardFill, in: RoundedRectangle(cornerRadius: 28, style: .continuous))
        .overlay {
            RoundedRectangle(cornerRadius: 28, style: .continuous)
                .strokeBorder(CursorWeatherTheme.cardStroke, lineWidth: 1)
        }
    }

    private func detailItem(icon: String, title: String, value: String) -> some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.body.weight(.semibold))
            Text(title)
                .font(.caption)
            Text(value)
                .font(.subheadline.weight(.semibold))
        }
        .foregroundStyle(CursorWeatherTheme.pinkMuted)
    }
}

#Preview {
    CursorWeatherCardView(
        model: CursorWeatherUIModel(
            city: .presets[0],
            weather: CursorCurrentWeather(temperature: 12, windspeed: 8, weathercode: 1)
        )
    )
    .padding()
    .background(Color.black)
}
