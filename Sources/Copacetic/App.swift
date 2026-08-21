public enum Network {
    case available
    case unavailable
}

public struct Device {
    public let iOSVersion: Int
    public let network: Network

    public init(iOSVersion: Int, network: Network) {
        fatalError("unimplemented")
    }
}

public enum ScreenElement: Equatable {
    case text(String)
    case image(String)
    case control(String)
}

public struct Screen {
    public let elements: [ScreenElement]
}

public struct App {
    public init(device: Device) {
        fatalError("unimplemented")
    }

    public var homeScreenLabel: String {
        fatalError("unimplemented")
    }

    public mutating func open() -> Screen {
        fatalError("unimplemented")
    }

    public mutating func leave(for duration: Duration) {
        fatalError("unimplemented")
    }

    public mutating func resume() -> Screen {
        fatalError("unimplemented")
    }
}
