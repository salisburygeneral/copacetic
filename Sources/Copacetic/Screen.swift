public enum Orientation {
    case portrait
    case landscapeLeft
}

public struct Screen: Equatable {
    public var text: String { fatalError("unimplemented") }
    public var orientation: Orientation { fatalError("unimplemented") }
    public var error: String? { fatalError("unimplemented") }
    public var destinations: [Screen] { fatalError("unimplemented") }

    public static func == (lhs: Screen, rhs: Screen) -> Bool { fatalError("unimplemented") }
}
