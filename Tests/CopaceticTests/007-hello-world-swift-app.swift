import Testing
import Copacetic

extension Tag {
    @Tag static var b7_1: Self
    @Tag static var b7_2: Self
    @Tag static var b7_3: Self
    @Tag static var b7_4: Self
    @Tag static var b7_5: Self
    @Tag static var b7_6: Self
}

@Suite("7 — Implement a \"Hello World\" Swift app")
struct HelloWorldTests {
    @Test("7.1 Show the greeting on launch", .tags(.b7_1))
    func greetingAppearsOnLaunch() {
        var phone = Phone(osVersion: .iOS26)
        phone.install(.copacetic)

        let screen = phone.open(.copacetic)

        #expect(screen.text == "Hello, World!")
    }

    @Test("7.2 Show the greeting without a network", .tags(.b7_2))
    func greetingAppearsWithoutNetwork() {
        var phone = Phone(osVersion: .iOS26)
        phone.install(.copacetic)
        phone.enableAeroplaneMode()

        let screen = phone.open(.copacetic)

        #expect(screen.text == "Hello, World!")
        #expect(screen.error == nil)
    }

    @Test("7.3 Keep the greeting on return from the background", .tags(.b7_3))
    func greetingSurvivesTheBackground() {
        var phone = Phone(osVersion: .iOS26)
        phone.install(.copacetic)
        let greeting = phone.open(.copacetic)
        phone.switchToAnotherApp()
        phone.wait(minutes: 2)

        phone.switchBack(to: .copacetic)

        #expect(phone.currentScreen == greeting)
    }

    @Test("7.4 Do nothing when the greeting is touched", .tags(.b7_4))
    func tappingTheGreetingChangesNothing() {
        var phone = Phone(osVersion: .iOS26)
        phone.install(.copacetic)
        let greeting = phone.open(.copacetic)

        phone.tap("Hello, World!")

        #expect(phone.currentScreen == greeting)
        #expect(phone.currentScreen.destinations.isEmpty)
    }

    @Test("7.5 Stay in portrait when the phone is rotated", .tags(.b7_5))
    func rotatingThePhoneKeepsPortrait() {
        var phone = Phone(osVersion: .iOS26)
        phone.install(.copacetic)
        phone.unlockRotation()
        _ = phone.open(.copacetic)

        phone.rotate(to: .landscapeLeft)

        #expect(phone.currentScreen.orientation == .portrait)
        #expect(phone.currentScreen.text == "Hello, World!")
    }

    @Test("7.6 Appear on the home screen as Copacetic", .tags(.b7_6))
    func homeScreenIconIsLabelledCopacetic() {
        var phone = Phone(osVersion: .iOS26)
        phone.install(.copacetic)

        let icon = phone.homeScreenIcon(for: .copacetic)

        #expect(icon.label == "Copacetic")
    }
}
