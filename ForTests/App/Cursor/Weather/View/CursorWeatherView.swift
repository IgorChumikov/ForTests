import SwiftUI

// MARK: - CursorWeatherView

struct CursorWeatherView: View {

    // MARK: - Properties

    @StateObject private var viewModel = CursorWeatherViewModel()

    // MARK: - Body

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
        .preferredColorScheme(.dark)
        .task {
            viewModel.loadWeather(replacingContent: true)
        }
        .animation(.easeInOut(duration: 0.35), value: viewModel.state)
        .animation(.easeInOut(duration: 0.25), value: viewModel.selectedCity.id)
    }
}

// MARK: - Background

private extension CursorWeatherView {
    var skyBackground: some View {
        LinearGradient(
            colors: [CursorWeatherTheme.backgroundTop, CursorWeatherTheme.backgroundBottom],
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
    }
}

// MARK: - Header

private extension CursorWeatherView {
    var titleSection: some View {
        VStack(spacing: 6) {
            Label("Погода", systemImage: "cloud.sun.fill")
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(CursorWeatherTheme.pinkSoft)

            Text(viewModel.selectedCity.name)
                .font(.system(size: 36, weight: .bold, design: .rounded))
                .foregroundStyle(CursorWeatherTheme.pink)
        }
    }
}

// MARK: - City Picker

private extension CursorWeatherView {
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
                .foregroundStyle(isSelected ? Color.black : CursorWeatherTheme.pinkSoft)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(
                    isSelected ? CursorWeatherTheme.pink : CursorWeatherTheme.chipFill,
                    in: Capsule()
                )
                .overlay {
                    if !isSelected {
                        Capsule()
                            .strokeBorder(CursorWeatherTheme.cardStroke, lineWidth: 1)
                    }
                }
        }
        .buttonStyle(.plain)
        .disabled(isCityPickerDisabled)
    }

    var isCityPickerDisabled: Bool {
        if case .loading = viewModel.state { return true }
        return false
    }
}

// MARK: - Main Content

private extension CursorWeatherView {
    @ViewBuilder
    var mainContent: some View {
        switch viewModel.state {
        case .loading:
            ProgressView("Загрузка…")
                .tint(CursorWeatherTheme.pink)
                .foregroundStyle(CursorWeatherTheme.pinkSoft)
                .scaleEffect(1.2)

        case .success(let model):
            CursorWeatherCardView(model: model)
                .transition(.opacity.combined(with: .move(edge: .bottom)))
                .overlay {
                    if viewModel.isRefreshing {
                        refreshOverlay
                    }
                }

        case .error(let message):
            CursorWeatherErrorCardView(message: message)
                .transition(.opacity)
        }
    }

    var refreshOverlay: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 28, style: .continuous)
                .fill(Color.black.opacity(0.72))

            ProgressView()
                .controlSize(.large)
                .tint(CursorWeatherTheme.pink)
        }
        .transition(.opacity)
    }
}

// MARK: - Actions

private extension CursorWeatherView {
    var refreshButton: some View {
        Button {
            viewModel.refresh()
        } label: {
            Group {
                if viewModel.isRefreshing {
                    ProgressView()
                        .tint(CursorWeatherTheme.pink)
                } else {
                    Label("Обновить", systemImage: "arrow.clockwise")
                }
            }
            .font(.headline)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(CursorWeatherTheme.chipFill, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
            .foregroundStyle(CursorWeatherTheme.pink)
            .overlay {
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .strokeBorder(CursorWeatherTheme.pink.opacity(0.5), lineWidth: 1)
            }
        }
        .disabled(viewModel.isRefreshing || viewModel.state == .loading)
        .animation(.easeInOut(duration: 0.2), value: viewModel.isRefreshing)
    }
}

// MARK: - Preview

#Preview {
    CursorWeatherView()
}
