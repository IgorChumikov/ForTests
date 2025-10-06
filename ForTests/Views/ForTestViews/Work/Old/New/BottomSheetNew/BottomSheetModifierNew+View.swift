////
////  BottomSheetModifierNew+View.swift
//
//
//import SwiftUI
//
//private extension CGFloat {
//    static let verticalTitlePadding: CGFloat = 8
//    static let horizontalTitlePadding: CGFloat = 16
//}
////
////public extension View {
////    /// BottomSheet панель с selfSizing поддержкой
////    /// - Parameters:
////    ///   - isPresented: Binding для отображения шторки
////    ///   - title: Тайтл для контента шторки
////    ///   - titleFont: Шрифт тайтла
////    ///   - onDismiss: Completion по закрытию шторки
////    ///   - content: Контент для выезжающей шторки
////    /// - Returns: Шторку с обернутым контентом
////    @ViewBuilder
////    func bottomSheetNew<Content: View>(
////        isPresented: Binding<Bool>,
////        title: String? = nil,
////        titleFont: UIFont? = nil,
////        onDismiss: (() -> Void)? = nil,
////        @ViewBuilder content: @escaping () -> Content
////    ) -> some View {
////        panelBottomSheet(isPresented: isPresented, onDismiss: onDismiss) {
////            VStack(spacing: .zero) {
////                if let title {
////                    Text(title)
////                     //   .multilineStyle(titleFont ?? .ozBodyL, textAlignment: .center)
////                        .padding(.vertical, .verticalTitlePadding)
////                        .padding(.horizontal, .horizontalTitlePadding)
////                }
////
////                ScrollablePanelView(content: content)
////            }
////        }
////    }
//
////    /// BottomSheet панель с selfSizing поддержкой
////    /// - Parameters:
////    ///   - item: Binding для отображения шторки
////    ///   - title: Тайтл для контента шторки
////    ///   - titleFont: Шрифт тайтла
////    ///   - onDismiss: Completion по закрытию шторки
////    ///   - content: Контент для выезжающей шторки (Binding<Bool> необходим для закрытии шторки внутри контента)
////    /// - Returns: Шторку с обернутым контентом
////    @ViewBuilder
////    func bottomSheetNew<Item, Content: View>(
////        item: Binding<Item?>,
////        title: String? = nil,
////        titleFont: UIFont? = nil,
////        onDismiss: (() -> Void)? = nil,
////        @ViewBuilder content: @escaping (Item) -> Content
////    ) -> some View {
////        panelBottomSheet(item: item, onDismiss: onDismiss) { item in
////            VStack(spacing: .zero) {
////                if let title {
////                    Text(title)
////                       // .multilineStyle(titleFont ?? .ozBodyL, textAlignment: .center)
////                        .padding(.vertical, .verticalTitlePadding)
////                        .padding(.horizontal, .horizontalTitlePadding)
////                }
////
////                ScrollablePanelView {
////                    content(item)
////                }
////            }
////        }
////    }
//
////    /// BottomSheet панель с selfSizing поддержкой
////    /// - Parameters:
////    ///   - isPresented: Binding для отображения шторки
////    ///   - onDismiss: Completion по закрытию шторки
////    ///   - content:  Контент для выезжающей шторки
////    /// - Returns: Шторку с обернутым контентом
////    @ViewBuilder
////    func panelBottomSheet<Content: View>(
////        isPresented: Binding<Bool>,
////        onDismiss: (() -> Void)? = nil,
////        @ViewBuilder content: @escaping () -> Content
////    ) -> some View {
////        emptyBottomSheet(isPresented: isPresented, onDismiss: onDismiss) {
////            PanelViewNew(content: content)
////        }
////    }
//
////    /// BottomSheet панель с selfSizing поддержкой
////    /// - Parameters:
////    ///   - item: Binding для отображения шторки
////    ///   - onDismiss: Completion по закрытию шторки
////    ///   - content: Контент для выезжающей шторки
////    /// - Returns: Шторку с обернутым контентом
////    @ViewBuilder
////    func panelBottomSheet<Item, Content: View>(
////        item: Binding<Item?>,
////        onDismiss: (() -> Void)? = nil,
////        @ViewBuilder content: @escaping (Item) -> Content
////    ) -> some View {
////        emptyBottomSheet(item: item, onDismiss: onDismiss) { item in
////            PanelViewNew {
////                content(item)
////            }
////        }
////    }
//
//    /// Показ бекграунда с анимацей
//    /// - Parameters:
//    ///   - isPresented: Binding для отображения шторки
//    ///   - onDismiss: Completion по закрытию шторки
//    ///   - content: Контейнер для презентуемой вью, которая отображается над фоном
//    ///   - Returns: Шторку с обернутым контентом
//    @ViewBuilder
//    func emptyBottomSheet<Content: View>(
//        isPresented: Binding<Bool>,
//        onDismiss: (() -> Void)? = nil,
//        @ViewBuilder content: @escaping () -> Content
//    ) -> some View {
//        // Обработка для Snasphot тестов (без нее BottomSheet не получится протестировать)
////        if Core.isRunningTests {
////            ZStack {
////                self
////                BottomSheet<EmptyView>.Background()
////                    .hidden(!isPresented.wrappedValue, mode: .removed)
////
////                content()
////                    .hidden(!isPresented.wrappedValue, mode: .removed)
////                    .environment(\.bottomSheetAnimationDuration, .zero)
////                    .environment(\.isSheetPresented, .constant(true))
////            }
//     //   } else {
//            background(
//                BottomSheet(isPresented: isPresented, onDismiss: onDismiss, content: content)
//            )
//     //   }
//    }
//
//    /// Показ бекграунда с анимацей
//    /// - Parameters:
//    ///   - item: Binding для отображения шторки
//    ///   - onDismiss: Completion по закрытию шторки
//    ///   - content: Контейнер для презентуемой вью, которая отображается над фоном
//    ///   - Returns: Шторку с обернутым контентом
//    @ViewBuilder
//    func emptyBottomSheet<Item, Content: View>(
//        item: Binding<Item?>,
//        onDismiss: (() -> Void)? = nil,
//        @ViewBuilder content: @escaping (Item) -> Content
//    ) -> some View {
//        let presentedBinding: Binding<Bool> = .init {
//            !item.wrappedValue.isNil
//        } set: { value in
//            if !value {
//                item.wrappedValue = nil
//            }
//        }
//
////        // Обработка для Snasphot тестов (без нее BottomSheet не получится протестировать)
////        if Core.isRunningTests {
////            ZStack {
////                self
////                if let item = item.wrappedValue {
////                    BottomSheet<EmptyView>.Background()
////                    content(item)
////                        .environment(\.bottomSheetAnimationDuration, .zero)
////                        .environment(\.isSheetPresented, .constant(true))
////                }
////            }
//      //  } else {
//            background(
//                BottomSheet(isPresented: presentedBinding, onDismiss: onDismiss) {
//                    if let item = item.wrappedValue {
//                        content(item)
//                    } else {
//                        EmptyView()
//                    }
//                }
//            )
//      //  }
//    }
//
//    /// BottomSheet панель с selfSizing поддержкой
//    /// - Parameters:
//    ///   - item: Binding для отображения диалога
//    ///   - onDismiss: Completion по закрытию диалога
//    ///   - content: Контент для выезжающей диалога (Binding<Bool> необходим для закрытии диалога внутри контента)
//    /// - Returns: Диалог с обернутым контентом
//    @ViewBuilder
//    func dialogPanel<Item, Content: View>(
//        item: Binding<Item?>,
//        onDismiss: (() -> Void)? = nil,
//        @ViewBuilder content: @escaping (Item) -> Content
//    ) -> some View {
//        emptyBottomSheet(item: item, onDismiss: onDismiss) { item in
//            DialogView {
//                content(item)
//            }
//        }
//    }
//
//    /// Dialog панель с selfSizing поддержкой
//    /// - Parameters:
//    ///   - isPresented: Binding для отображения диалога
//    ///   - onDismiss: Completion по закрытию диалога
//    ///   - content:  Контент для выезжающей диалога
//    /// - Returns: Диалог с обернутым контентом
//    @ViewBuilder
//    func dialogPanel<Content: View>(
//        isPresented: Binding<Bool>,
//        onDismiss: (() -> Void)? = nil,
//        @ViewBuilder content: @escaping () -> Content
//    ) -> some View {
//        emptyBottomSheet(isPresented: isPresented, onDismiss: onDismiss) {
//            DialogView(content: content)
//        }
//    }
//}
//
//
//// MARK: - AnyOptional
//
///// Позволяет сопоставлять необязательные параметры с дженерик типами, которые определены как необязательные.
//public protocol AnyOptional {
//    var isNil: Bool { get }
//}
//
//// MARK: - Optional + AnyOptional
//
//extension Optional: AnyOptional {
//    public var isNil: Bool { self == nil }
//}
