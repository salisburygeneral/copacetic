import Copacetic
import SwiftUI

@main
struct CopaceticApp: SwiftUI.App {
    var body: some Scene {
        WindowGroup {
            ScreenView()
        }
    }
}

struct ScreenView: View {
    @State private var app = Copacetic.App(device: Device(iOSVersion: 26, network: .available))
    @State private var elements: [ScreenElement] = []

    var body: some View {
        VStack {
            ForEach(Array(elements.enumerated()), id: \.offset) { _, element in
                view(for: element)
            }
        }
        .onAppear { elements = app.open().elements }
    }

    @ViewBuilder
    private func view(for element: ScreenElement) -> some View {
        switch element {
        case .text(let string):
            Text(string)
        case .image(let name):
            Image(systemName: name)
        case .control(let title):
            Button(title) {}
        }
    }
}
