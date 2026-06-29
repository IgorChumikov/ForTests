//
//  SwiftUIView11111.swift
//  ForTests
//
//  Created by Игорь Чумиков on 18.06.2024.
//
import SwiftUI

struct SwiftUIView11111: View {
    @State private var selection: Int? = nil

    var body: some View {
        VStack {
            Color.blue
                .frame(height: 50)
            if #available(iOS 16.4, *) {
                PopupMenu(title: "Menu", selection: $selection) {
                    Text("Если проблема не решилась, обратитесь в Сервисный центр КонсультантПлюс").menuTag(1)
                    Text("Option 2").menuTag(2)
                    Text("Option 3").menuTag(3)
                    Text("Another Option With A Long Name").menuTag(4)
                }
            } else {
                // Fallback on earlier versions
                Text("PopupMenu requires iOS 16.4 or later")
            }
            Color.black
                .frame(height: 50)
        }
    }
}

#Preview {
    SwiftUIView11111()
}

@available(iOS 16.4, *)
struct PopoverLayout<T>: _VariadicView_MultiViewRoot {
    @Binding var selection: T
    @Binding var isShowing: Bool
    
    func body(children: _VariadicView.Children) -> some View {
        ForEach(children) { child in
            Button {
                if let tag = child[MenuTagTrait<T>.self] {
                    selection = tag
                }
                isShowing = false
            } label: {
                child
            }
        }
    }
}

@available(iOS 13.0, *)
extension View {
    public func menuTag<T>(_ tag: T?) -> some View {
        _trait(MenuTagTrait<T>.self, tag)
    }
}

@available(iOS 16.4, *)
public struct PopupMenu<T, Content>: View where Content: View {
    public var title: String
    @Binding public var selection: T
    @ViewBuilder public var content: Content
    
    @State private var showMenu: Bool = false
    
    public var body: some View {
        Button {
            showMenu = true
        } label: {
            Text(title)
                .frame(minWidth: 100)
        }
        .buttonStyle(BorderedButtonStyle())
        .popover(isPresented: $showMenu, attachmentAnchor: .point(.center)) {
            ScrollView {
                VStack {
                    _VariadicView.Tree(PopoverLayout(selection: $selection, isShowing:  $showMenu)) {
                        content
                            .frame(minWidth: 125, maxWidth: 300, idealHeight: 65)
                    }
                }
            }
            .frame(maxWidth: 350, maxHeight: 225)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .presentationCompactAdaptation(.popover)
        }
    }
}

struct MenuTagTrait<T>: _ViewTraitKey {
    static var defaultValue: T? { nil }
}
