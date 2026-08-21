import Testing

import Copacetic

extension Tag {
    @Tag static var b19_1: Self
    @Tag static var b19_2: Self
    @Tag static var b19_3: Self
    @Tag static var b19_4: Self
    @Tag static var b19_5: Self
}

@Suite("19 — Implement a \"Hello, World!\" iPhone app")
struct HelloWorldTests {
    @Test("19.1 Show the greeting on launch", .tags(.b19_1))
    func showTheGreetingOnLaunch() {
        var app = Application()

        app.launch()

        #expect(app.screen.texts.contains("Hello, World!"))
    }

    @Test("19.2 Show the same greeting on every later launch", .tags(.b19_2))
    func showTheSameGreetingOnEveryLaterLaunch() {
        var app = Application()
        app.launch()
        let firstLaunch = app.screen
        app.close()

        app.launch()

        #expect(app.screen.texts.contains("Hello, World!"))
        #expect(app.screen == firstLaunch)
    }

    @Test("19.3 Show the greeting while offline", .tags(.b19_3))
    func showTheGreetingWhileOffline() {
        var app = Application(connectivity: .offline)

        app.launch()

        #expect(app.screen.texts == ["Hello, World!"])
        #expect(app.screen.alerts.isEmpty)
    }

    @Test("19.4 Keep the greeting when the app returns from the background", .tags(.b19_4))
    func keepTheGreetingWhenTheAppReturnsFromTheBackground() {
        var app = Application()
        app.launch()
        app.sendToBackground(for: .seconds(5 * 60))

        app.bringToForeground()

        #expect(app.screen.texts.contains("Hello, World!"))
    }

    @Test("19.5 Show nothing besides the greeting", .tags(.b19_5))
    func showNothingBesidesTheGreeting() {
        var app = Application()

        app.launch()

        #expect(app.screen.texts == ["Hello, World!"])
        #expect(app.screen.images.isEmpty)
    }
}
