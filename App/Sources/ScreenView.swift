import Copacetic
import SwiftUI

struct ScreenView: View {
    private let app = App.launch()

    var body: some View {
        VStack {
            ForEach(Array(app.screen.enumerated()), id: \.offset) { _, element in
                view(for: element)
            }
        }
        .padding()
    }

    @ViewBuilder
    private func view(for element: Element) -> some View {
        switch element {
        case let .text(string):
            Text(string)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
        }
    }
}
