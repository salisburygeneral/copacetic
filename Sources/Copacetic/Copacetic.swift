public enum ScreenElement: Equatable {
    case text(String)
}

public struct Screen: Equatable {
    public var elements: [ScreenElement] { fatalError("unimplemented") }

    public static func == (lhs: Screen, rhs: Screen) -> Bool { fatalError("unimplemented") }
}

public struct Copacetic {
    public static var displayName: String { fatalError("unimplemented") }

    public init(hasBeenOpenedBefore: Bool) { fatalError("unimplemented") }

    public var screen: Screen { fatalError("unimplemented") }

    public mutating func launch() { fatalError("unimplemented") }

    public mutating func sendToBackground(for duration: Duration) { fatalError("unimplemented") }

    public mutating func returnToForeground() { fatalError("unimplemented") }
}
