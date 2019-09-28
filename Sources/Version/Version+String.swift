import Foundation

extension Version : ExpressibleByStringLiteral {

    /// Initializes and returns a newly allocated version struct for the provided string literal.
    ///
    /// - Parameters:
    ///     - version: A string literal to use for creating a new version object.
    public init(stringLiteral value: String) {
        self = Version(value) ?? .zero
    }
}
