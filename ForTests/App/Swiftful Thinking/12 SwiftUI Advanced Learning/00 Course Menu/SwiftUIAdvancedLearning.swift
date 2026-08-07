import SwiftUI

struct SwiftUIAdvancedLearning: View {
    var body: some View {
        NavigationStack {
            List {
                Section("SwiftUI") {
                    NavigationLink("Animations", destination: AnimateableDataBootcamp())
                    NavigationLink("Transitions", destination: AnyTransitionBootcamp())
                    NavigationLink("Matched geometry", destination: MatchedGeometryEffectBootcamp())
                    NavigationLink("Button styles", destination: ButtonStyleBootcamp())
                    NavigationLink("Custom bindings", destination: CustomBindingBootcamp())
                    NavigationLink("Custom curves", destination: CustomCurvesBootcamp())
                    NavigationLink("Custom shapes", destination: CustomShapesBootcamp())
                    NavigationLink("Custom navigation", destination: AppNavBarView())
                    NavigationLink("Custom tab bar", destination: AdvancedAppTabBarView())
                    NavigationLink("Preference key", destination: PreferenceKeyBootcamp())
                    NavigationLink("Geometry preference key", destination: GeometryPreferenceKeyBootcamp())
                    NavigationLink("Scroll offset", destination: ScrollViewOffsetPreferenceKeyBootcamp())
                    NavigationLink("Timeline view", destination: TimelineViewBootcamp())
                    NavigationLink("View builder", destination: ViewBuilderBootcamp())
                    NavigationLink("View modifier", destination: ViewModifierBootcamp())
                    NavigationLink("UIViewRepresentable", destination: UIViewRepresentableBootcamp())
                    NavigationLink("UIViewControllerRepresentable", destination: UIViewControllerRepresentableBootcamp())
                }

                Section("Swift language and architecture") {
                    NavigationLink("Advanced Combine", destination: AdvancedCombineBootcamp())
                    NavigationLink(
                        "Dependency injection",
                        destination: DependencyInjectionBootcamp(dataService: MockDataService(data: nil))
                    )
                    NavigationLink("Error alerts", destination: ErrorAlertBootcamp())
                    NavigationLink("Futures", destination: FuturesBootcamp())
                    NavigationLink("Generics", destination: GenericsBootcamp())
                    NavigationLink("Key paths", destination: KeypathsBootcamp())
                    NavigationLink("Operators", destination: CustomOperatorBootcamp())
                    NavigationLink("Property wrappers", destination: PropertyWrapperBootcamp())
                    NavigationLink("Property wrappers 2", destination: PropertyWrapper2Bootcamp())
                    NavigationLink(
                        "Protocols",
                        destination: ProtocolsBootcamp(
                            colorTheme: DefaultColorTheme(),
                            dataSource: DefaultDataSource()
                        )
                    )
                    NavigationLink("Subscripts", destination: SubscriptsBootcamp())
                }

                Section("Testing") {
                    NavigationLink("Unit testing example", destination: UnitTestingBootcampView(isPremium: true))
                    NavigationLink(
                        "UI testing example",
                        destination: UITestingBootcampView(currentUserIsSignedIn: false)
                    )
                }

                Section("CloudKit") {
                    NavigationLink("CRUD", destination: CloudKitCrudBootcamp())
                    NavigationLink("User", destination: CloudKitUserBootcamp())
                    NavigationLink("Push notifications", destination: CloudKitPushNotificationBootcamp())
                }
            }
            .navigationTitle("Advanced Learning")
        }
    }
}

#Preview {
    SwiftUIAdvancedLearning()
}
