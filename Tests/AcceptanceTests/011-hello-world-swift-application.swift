import Copacetic
import Testing

extension Tag {
    @Tag static var b11_1: Self
    @Tag static var b11_2: Self
    @Tag static var b11_3: Self
    @Tag static var b11_5: Self
}

@Suite("11 — Implement a \"Hello, World!\" Swift application")
struct HelloWorldTests {
    @Test("11.1 Show the greeting on launch", .tags(.b11_1))
    func greetingIsShownOnLaunch() {
        var app = Copacetic(hasBeenOpenedBefore: false)

        app.launch()

        #expect(app.screen.elements.contains(.text("Hello, World!")))
    }

    @Test("11.2 Show nothing besides the greeting", .tags(.b11_2))
    func greetingIsTheOnlyContent() {
        var app = Copacetic(hasBeenOpenedBefore: false)
        app.launch()

        let screen = app.screen

        #expect(screen.elements == [.text("Hello, World!")])
    }

    @Test("11.3 Keep the greeting after returning from the background", .tags(.b11_3))
    func greetingSurvivesTheBackground() {
        var app = Copacetic(hasBeenOpenedBefore: false)
        app.launch()
        let screenBeforeSwitchingAway = app.screen
        app.sendToBackground(for: .seconds(300))

        app.returnToForeground()

        #expect(app.screen == screenBeforeSwitchingAway)
        #expect(app.screen.elements == [.text("Hello, World!")])
    }

    @Test("11.5 Show the app's name on the Home Screen", .tags(.b11_5))
    func homeScreenNameIsTheAppName() {
        #expect(Copacetic.displayName == "Copacetic")
    }
}
