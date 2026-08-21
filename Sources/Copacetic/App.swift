public enum Network {
    case available
    case unavailable
}

public struct Device {
    public let iOSVersion: Int
    public let network: Network

    public init(iOSVersion: Int, network: Network) {
        self.iOSVersion = iOSVersion
        self.network = network
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
    private let device: Device

    public init(device: Device) {
        self.device = device
    }

    public var homeScreenLabel: String {
        "Copacetic"
    }

    public mutating func open() -> Screen {
        Screen(elements: [.text("Hello, World!")])
    }

    public mutating func leave(for duration: Duration) {
    }

    public mutating func resume() -> Screen {
        open()
    }
}
