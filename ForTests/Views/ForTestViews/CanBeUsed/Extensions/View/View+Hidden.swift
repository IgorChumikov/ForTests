import SwiftUI

// MARK: - HiddenMode

public enum HiddenMode {
    /// Скрывается через модификатор `hidden`, не освобождая занимаемое пространство. При появлении view срабатывают методы
    /// onFirstAppear и onAppear.
    case hidden

    /// Скрывается через модификатор `opacity`, не освобождая занимаемое пространство.
    /// При появлении view не срабатывает метод onAppear.
    case opacity

    /// Скрывается путем удаления view из иерархии, освобождая занимаемое пространство.
    case removed
}

public extension View {
    /// Прячет или показывает View в зависимости от Bool значения. Существует 3 режима скрытия:
    /// - Два с визуальным скрытием элемента — View не освобождает занимаемую площадь (будто opacity стало 0).
    /// - Полное скрытие элемента — View удаляется из иерархии.
    ///
    /// Пример визуального скрытия:
    ///
    ///     HStack {
    ///         Text("Label1")
    ///         Text("Label2")
    ///             .hidden(true, mode: .hidden) // или .opacity
    ///         Text("Label3")
    ///     }
    ///
    /// Результат: `Label1        Label3`
    ///
    /// Пример полного скрытия:
    ///
    ///     HStack {
    ///         Text("Label1")
    ///         Text("Label2")
    ///             .hidden(true, mode: .removed)
    ///         Text("Label3")
    ///     }
    ///
    /// Результат: `Label1 Label3`
    ///
    /// - Parameters:
    ///   - hidden: Флаг, определяющий необходимость скрытия View.
    ///   - mode: Режим скрытия (hidden, opacity, removed).
    @ViewBuilder
    func hidden(_ hidden: Bool, mode: HiddenMode) -> some View {
        switch mode {
        case .hidden:
            if hidden {
                self.hidden()
            } else {
                self
            }
        case .opacity:
            opacity(hidden ? 0 : 1)
        case .removed:
            if !hidden {
                self
            }
        }
    }
}
