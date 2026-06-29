import Combine
import SwiftUI

// MARK: - Skeleton.Constants

private extension Skeleton {
    enum Constants {
        static let backgroundColor: Color = .gray
        static let startPositionConfig = GradientStopPositionConfig(fromValue: -2, toValue: 2)
        static let endPositionConfig = GradientStopPositionConfig(fromValue: -1, toValue: 3)

        // design source: https://codepen.io/JCLee/pen/dyPejGV
        // Здесь нельзя использовать .clear, т.к. из-за этого градиент будет работать неправильно
        static let gradientStops: [Gradient.Stop] = [
            Gradient.Stop(color: .white.opacity(0), location: 0),
            Gradient.Stop(color: .white.opacity(0.2), location: 0.2),
            Gradient.Stop(color: .white.opacity(0.5), location: 0.6),
            Gradient.Stop(color: .white.opacity(0), location: 1),
        ]
    }
}

// MARK: - Skeleton.GradientStopPositionConfig

private extension Skeleton {
    /// Структура для конфигурирования позиции градиента
    struct GradientStopPositionConfig {
        // MARK: - Properties

        let fromValue: CGFloat
        let toValue: CGFloat

        // MARK: - Functions

        /// Высчитывает текущую позицию градиента между fromValue и toValue относительно progress значения.
        func currentPosition(for progress: CGFloat) -> CGFloat {
            fromValue + (toValue - fromValue) * progress
        }
    }
}

// MARK: - Skeleton

public struct Skeleton: View {
    // MARK: - Properties

    private let duration: CFTimeInterval
    private let delay: CFTimeInterval
    private let animation: Animation

    @State
    private var startPoint: UnitPoint = .init(x: Constants.startPositionConfig.fromValue, y: 0.5)
    @State
    private var endPoint: UnitPoint = .init(x: Constants.endPositionConfig.fromValue, y: 0.5)

    // MARK: - Init

    public init(duration: CFTimeInterval = 2.5, delay: CFTimeInterval = 0) {
        self.duration = duration
        self.delay = delay
        animation = Animation.easeInOut(duration: duration)
    }

    // MARK: - Content

    public var body: some View {
        ZStack {
            Rectangle()
                .fill(Constants.backgroundColor)
            LinearGradient(stops: Constants.gradientStops, startPoint: startPoint, endPoint: endPoint)
        }
        .onFirstAppear {
            withAnimation(animation.delay(delay).repeatForever(autoreverses: false)) {
                startPoint.x = Constants.startPositionConfig.toValue
                endPoint.x = Constants.endPositionConfig.toValue
            }
        }
    }
}

// MARK: - Skeleton_Previews

struct Skeleton_Previews: PreviewProvider {
    static var previews: some View {
        Skeleton()
            .previewLayout(.fixed(width: 200, height: 100))
    }
}

