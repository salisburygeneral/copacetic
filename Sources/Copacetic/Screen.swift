public struct Screen: Equatable, Sendable {
    public let texts: [String]
    public let images: [String]
    public let alerts: [String]

    static let greeting = Screen(texts: ["Hello, World!"], images: [], alerts: [])
    static let blank = Screen(texts: [], images: [], alerts: [])
}
