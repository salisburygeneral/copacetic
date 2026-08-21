import Testing
import Copacetic

extension Tag {
    @Tag static var b14_1: Self
    @Tag static var b14_2: Self
    @Tag static var b14_3: Self
    @Tag static var b14_4: Self
    @Tag static var b14_5: Self
}

@Suite("14 — Implement a \"Hello, World!\" Swift application")
struct HelloWorldAppTests {
    @Test("14.1 Show the greeting on opening", .tags(.b14_1))
    func greetingShownOnOpening() {
        var app = App(device: Device(iOSVersion: 26, network: .available))

        let screen = app.open()

        #expect(screen.elements.contains(.text("Hello, World!")))
    }

    @Test("14.2 Show nothing besides the greeting", .tags(.b14_2))
    func nothingShownBesidesTheGreeting() {
        var app = App(device: Device(iOSVersion: 26, network: .available))

        let screen = app.open()

        #expect(screen.elements == [.text("Hello, World!")])
    }

    @Test("14.3 Show the greeting again after leaving the app", .tags(.b14_3))
    func greetingShownAgainAfterLeavingTheApp() {
        var app = App(device: Device(iOSVersion: 26, network: .available))
        let opened = app.open()
        app.leave(for: .seconds(60))

        let screen = app.resume()

        #expect(screen.elements == opened.elements)
        #expect(screen.elements.contains(.text("Hello, World!")))
    }

    @Test("14.4 Show the greeting with no network", .tags(.b14_4))
    func greetingShownWithNoNetwork() {
        var app = App(device: Device(iOSVersion: 26, network: .unavailable))

        let screen = app.open()

        #expect(screen.elements.contains(.text("Hello, World!")))
    }

    @Test("14.5 Appear on the Home screen as Copacetic", .tags(.b14_5))
    func appearsOnTheHomeScreenAsCopacetic() {
        let app = App(device: Device(iOSVersion: 26, network: .available))

        #expect(app.homeScreenLabel == "Copacetic")
    }
}
