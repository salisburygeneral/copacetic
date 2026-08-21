public enum Element: Equatable {
    case text(String)

    var width: Double {
        switch self {
        case let .text(string): Double(string.count) * Element.characterWidth
        }
    }

    private static let characterWidth = 17.0
}

public enum Orientation {
    case portrait
    case landscape

    var width: Double {
        switch self {
        case .portrait: 393
        case .landscape: 852
        }
    }
}

public struct App {
    public static var displayName: String { "Copacetic" }

    private static let greeting = "Hello, World!"

    var content: [Element]
    var orientation: Orientation

    public static func launch() -> App {
        App(content: [.text(greeting)], orientation: .portrait)
    }

    public var screen: [Element] { content }

    public func isShownWhole(_ element: Element) -> Bool {
        content.contains(element) && element.width <= orientation.width
    }

    public mutating func enterBackground() {}

    public mutating func returnToForeground() {}

    public mutating func rotate(to orientation: Orientation) {
        self.orientation = orientation
    }
}
