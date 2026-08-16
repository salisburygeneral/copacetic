public enum App {
    case copacetic
}

public enum OSVersion {
    case iOS26
}

public struct Icon {
    public var label: String { fatalError("unimplemented") }
}

public struct Phone {
    public init(osVersion: OSVersion) { fatalError("unimplemented") }

    public var currentScreen: Screen { fatalError("unimplemented") }

    public mutating func install(_ app: App) { fatalError("unimplemented") }

    public mutating func open(_ app: App) -> Screen { fatalError("unimplemented") }

    public mutating func switchToAnotherApp() { fatalError("unimplemented") }

    public mutating func switchBack(to app: App) { fatalError("unimplemented") }

    public mutating func tap(_ text: String) { fatalError("unimplemented") }

    public mutating func rotate(to orientation: Orientation) { fatalError("unimplemented") }

    public mutating func enableAeroplaneMode() { fatalError("unimplemented") }

    public mutating func unlockRotation() { fatalError("unimplemented") }

    public mutating func wait(minutes: Int) { fatalError("unimplemented") }

    public func homeScreenIcon(for app: App) -> Icon { fatalError("unimplemented") }
}
