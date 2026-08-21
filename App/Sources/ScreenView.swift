import Copacetic
import SwiftUI

struct ScreenView: View {
    @State private var application = Application()

    var body: some View {
        VStack {
            ForEach(application.screen.texts, id: \.self) { text in
                Text(text)
            }
        }
        .onAppear { application.launch() }
    }
}
