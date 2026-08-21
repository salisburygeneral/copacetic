import Testing

import Copacetic

extension Tag {
    @Tag static var b22_1: Self
    @Tag static var b22_2: Self
    @Tag static var b22_3: Self
    @Tag static var b22_4: Self
    @Tag static var b22_5: Self
}

@Suite(#"22 — Implement a "Hello, World!" iPhone app"#)
struct HelloWorldAppTests {
    @Test(#"22.1 The screen shows "Hello, World!" on launch"#, .tags(.b22_1))
    func greetingIsShownOnLaunch() {
        let app = App.launch()

        #expect(app.screen.contains(.text("Hello, World!")))
    }

    @Test(#"22.2 "Hello, World!" is the only content on the screen"#, .tags(.b22_2))
    func greetingIsTheOnlyContent() {
        let app = App.launch()

        #expect(app.screen == [.text("Hello, World!")])
    }

    @Test(#"22.3 The screen still shows "Hello, World!" after returning to the app"#, .tags(.b22_3))
    func greetingIsKeptOnReturningToTheApp() {
        var app = App.launch()
        app.enterBackground()

        app.returnToForeground()

        #expect(app.screen == [.text("Hello, World!")])
    }

    @Test(#"22.4 The whole of "Hello, World!" is still on screen in landscape"#, .tags(.b22_4))
    func greetingIsKeptWholeWhenRotatedToLandscape() {
        var app = App.launch()

        app.rotate(to: .landscape)

        #expect(app.isShownWhole(.text("Hello, World!")))
    }

    @Test(#"22.5 The Home Screen label reads "Copacetic""#, .tags(.b22_5))
    func homeScreenLabelIsTheAppName() {
        #expect(App.displayName == "Copacetic")
    }
}
