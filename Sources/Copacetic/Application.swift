public struct Application: Sendable {
    public enum Connectivity: Sendable {
        case online
        case offline
    }

    private var isRunning: Bool

    public var screen: Screen {
        isRunning ? .greeting : .blank
    }

    public init(connectivity: Connectivity = .online) {
        self.isRunning = false
    }

    public mutating func launch() {
        isRunning = true
    }

    public mutating func close() {
        isRunning = false
    }

    public mutating func sendToBackground(for duration: Duration) {}

    public mutating func bringToForeground() {}
}
