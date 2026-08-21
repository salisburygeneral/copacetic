public enum Element: Equatable {
    case text(String)
}

public enum Orientation {
    case portrait
    case landscape
}

public struct App {
    public static var displayName: String { fatalError("unimplemented") }

    public static func launch() -> App { fatalError("unimplemented") }

    public var screen: [Element] { fatalError("unimplemented") }

    public func isShownWhole(_ element: Element) -> Bool { fatalError("unimplemented") }

    public mutating func enterBackground() { fatalError("unimplemented") }

    public mutating func returnToForeground() { fatalError("unimplemented") }

    public mutating func rotate(to orientation: Orientation) { fatalError("unimplemented") }
}
