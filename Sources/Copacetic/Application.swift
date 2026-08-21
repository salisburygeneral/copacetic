public struct Application: Sendable {
    public enum Connectivity: Sendable {
        case online
        case offline
    }

    public var screen: Screen {
        fatalError("unimplemented")
    }

    public init(connectivity: Connectivity = .online) {
        fatalError("unimplemented")
    }

    public mutating func launch() {
        fatalError("unimplemented")
    }

    public mutating func close() {
        fatalError("unimplemented")
    }

    public mutating func sendToBackground(for duration: Duration) {
        fatalError("unimplemented")
    }

    public mutating func bringToForeground() {
        fatalError("unimplemented")
    }
}
