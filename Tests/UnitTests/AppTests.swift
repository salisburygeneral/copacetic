import Testing

@testable import Copacetic

@Suite("App")
struct AppTests {
    @Test("An element too wide for the orientation is not shown whole")
    func tooWideAnElementIsNotShownWhole() {
        let wide = Element.text(String(repeating: "a", count: 40))
        var app = App(content: [wide], orientation: .landscape)

        app.rotate(to: .portrait)

        #expect(!app.isShownWhole(wide))
    }
}
