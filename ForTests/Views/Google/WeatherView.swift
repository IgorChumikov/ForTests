import SwiftUI

struct WeatherView: View {
    @StateObject private var viewModel = WeatherViewModel()
    
    var body: some View {
        ZStack {
            backgroundGradient
            
            VStack(spacing: 24) {
                headerView
                
                Spacer()
                
                contentView
                
                Spacer()
                
                refreshButton
            }
            .padding(.vertical, 40)
        }
        .task {
            if viewModel.state == .idle {
                await viewModel.fetchWeather()
            }
        }
        // Плавная анимация при смене состояний
        .animation(.spring(response: 0.4, dampingFraction: 0.8), value: viewModel.state)
    }
}

// MARK: - Subviews
private extension WeatherView {
    
    var backgroundGradient: some View {
        LinearGradient(
            colors: [Color.blue.opacity(0.7), Color.indigo.opacity(0.6)],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
    
    var headerView: some View {
        Text("Москва")
            .font(.system(size: 40, weight: .bold, design: .rounded))
            .foregroundColor(.white)
            .shadow(color: .black.opacity(0.2), radius: 2, y: 2)
    }
    
    @ViewBuilder
    var contentView: some View {
        switch viewModel.state {
        case .idle, .loading:
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                .scaleEffect(1.5)
            
        case .success(let model):
            weatherInfoCard(for: model)
                .transition(.scale(scale: 0.9).combined(with: .opacity))
            
        case .error(let message):
            errorView(message: message)
                .transition(.opacity)
        }
    }
    
    func weatherInfoCard(for model: WeatherUIModel) -> some View {
        VStack(spacing: 16) {
            Image(systemName: model.systemIconName)
                .font(.system(size: 80))
                .symbolRenderingMode(.multicolor)
                .shadow(radius: 5)
            
            Text(model.temperature)
                .font(.system(size: 72, weight: .bold, design: .rounded))
                .foregroundColor(.white)
            
            Text(model.conditionDescription)
                .font(.title2.weight(.medium))
                .foregroundColor(.white.opacity(0.9))
        }
        .padding(40)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 32, style: .continuous))
        .shadow(color: .black.opacity(0.15), radius: 20, y: 10)
    }
    
    func errorView(message: String) -> some View {
        VStack(spacing: 12) {
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.largeTitle)
                .foregroundColor(.yellow)
            
            Text(message)
                .font(.callout)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
        .padding(20)
        .background(.black.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .padding(.horizontal, 40)
    }
    
    var refreshButton: some View {
        Button(action: {
            Task {
                await viewModel.fetchWeather()
            }
        }) {
            HStack(spacing: 8) {
                Image(systemName: "arrow.clockwise")
                Text("Обновить")
                    .font(.headline)
            }
            .foregroundColor(.indigo)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .shadow(color: .black.opacity(0.1), radius: 10, y: 5)
        }
        .padding(.horizontal, 40)
        .disabled(viewModel.state == .loading)
        .opacity(viewModel.state == .loading ? 0.6 : 1.0)
    }
}

#Preview {
    WeatherView()
}
