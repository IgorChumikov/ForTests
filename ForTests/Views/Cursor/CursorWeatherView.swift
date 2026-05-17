import SwiftUI

struct CursorWeatherView: View {
    @StateObject private var viewModel = CursorWeatherViewModel()

    var body: some View {
        ZStack {
            skyBackground

            VStack(spacing: 28) {
                titleSection
                cityPicker
                Spacer(minLength: 0)
                mainContent
                Spacer(minLength: 0)
                refreshButton
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 32)
        }
        .task {
            if viewModel.state == .idle {
                viewModel.loadWeather(replacingContent: true)
            }
        }
        .animation(.easeInOut(duration: 0.35), value: viewModel.state)
        .animation(.easeInOut(duration: 0.25), value: viewModel.selectedCity.id)
    }
}

// MARK: - Subviews

private extension CursorWeatherView {
    var skyBackground: some View {
        LinearGradient(
            colors: [
                Color(red: 0.35, green: 0.62, blue: 0.98),
                Color(red: 0.18, green: 0.38, blue: 0.82)
            ],
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
    }

    var titleSection: some View {
        VStack(spacing: 6) {
            Label("Погода", systemImage: "cloud.sun.fill")
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(.white.opacity(0.85))

            Text(viewModel.selectedCity.name)
                .font(.system(size: 36, weight: .bold, design: .rounded))
                .foregroundStyle(.white)
        }
    }

    var cityPicker: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(CursorCity.presets) { city in
                    cityChip(city)
                }
            }
            .padding(.horizontal, 2)
        }
    }

    func cityChip(_ city: CursorCity) -> some View {
        let isSelected = viewModel.selectedCity == city

        return Button {
            viewModel.selectCity(city)
        } label: {
            Text(city.name)
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(isSelected ? Color(red: 0.18, green: 0.38, blue: 0.82) : .white)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(isSelected ? Color.white : Color.white.opacity(0.18))
                .clipShape(Capsule())
        }
        .buttonStyle(.plain)
        .disabled(isCityPickerDisabled)
    }

    var isCityPickerDisabled: Bool {
        if case .loading = viewModel.state { return true }
        return false
    }

    @ViewBuilder
    var mainContent: some View {
        switch viewModel.state {
        case .idle, .loading:
            ProgressView("Загрузка…")
                .tint(.white)
                .foregroundStyle(.white)
                .scaleEffect(1.2)

        case .success(let model):
            weatherCard(model)
                .transition(.opacity.combined(with: .move(edge: .bottom)))
                .overlay {
                    if viewModel.isRefreshing {
                        refreshOverlay
                    }
                }

        case .error(let message):
            errorCard(message)
                .transition(.opacity)
        }
    }

    var refreshOverlay: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 28, style: .continuous)
                .fill(.ultraThinMaterial)

            ProgressView()
                .controlSize(.large)
                .tint(.white)
        }
        .transition(.opacity)
    }

    func weatherCard(_ model: CursorWeatherUIModel) -> some View {
        VStack(spacing: 20) {
            Image(systemName: model.systemIconName)
                .font(.system(size: 72))
                .symbolRenderingMode(.multicolor)
                .symbolEffect(.bounce, value: model.cityName)

            Text(model.temperature)
                .font(.system(size: 80, weight: .thin, design: .rounded))
                .foregroundStyle(.white)

            Text(model.conditionDescription)
                .font(.title3.weight(.medium))
                .foregroundStyle(.white.opacity(0.92))

            HStack(spacing: 20) {
                detailItem(icon: "wind", title: "Ветер", value: model.windSpeed)
            }
            .padding(.top, 4)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 36)
        .padding(.horizontal, 24)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 28, style: .continuous))
        .overlay {
            RoundedRectangle(cornerRadius: 28, style: .continuous)
                .strokeBorder(.white.opacity(0.25), lineWidth: 1)
        }
    }

    func detailItem(icon: String, title: String, value: String) -> some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.body.weight(.semibold))
            Text(title)
                .font(.caption)
                .opacity(0.8)
            Text(value)
                .font(.subheadline.weight(.semibold))
        }
        .foregroundStyle(.white)
    }

    func errorCard(_ message: String) -> some View {
        VStack(spacing: 12) {
            Image(systemName: "wifi.exclamationmark")
                .font(.largeTitle)
                .foregroundStyle(.yellow)

            Text(message)
                .font(.callout)
                .multilineTextAlignment(.center)
                .foregroundStyle(.white)
        }
        .padding(24)
        .frame(maxWidth: .infinity)
        .background(.black.opacity(0.25), in: RoundedRectangle(cornerRadius: 20))
    }

    var refreshButton: some View {
        Button {
            viewModel.refresh()
        } label: {
            Group {
                if viewModel.isRefreshing {
                    ProgressView()
                        .tint(Color(red: 0.18, green: 0.38, blue: 0.82))
                } else {
                    Label("Обновить", systemImage: "arrow.clockwise")
                }
            }
            .font(.headline)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(.white, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
            .foregroundStyle(Color(red: 0.18, green: 0.38, blue: 0.82))
        }
        .disabled(viewModel.isRefreshing || viewModel.state == .loading)
        .animation(.easeInOut(duration: 0.2), value: viewModel.isRefreshing)
    }
}

#Preview {
    CursorWeatherView()
}
