import Foundation

public struct Version: Equatable, Sendable {

    /// The major version according to the semantic versioning standard.
    public let major: Int

    /// The minor version according to the semantic versioning standard.
    public let minor: Int

    /// The patch version according to the semantic versioning standard.
    public let patch: Int

    /// The pre-release identifier according to the semantic versioning standard, such as `-beta.1`.
    public let prerelease: [String]

    /// The build metadata of this version according to the semantic versioning standard, such as a commit hash.
    public let build: [String]

    /// Initializes and returns a newly allocated version struct
    /// for the provided components of a semantic version.
    ///
    /// - Parameters:
    ///     - major: The major version number.
    ///     - minor: The minor version number.
    ///     - patch: The patch version number.
    ///     - prerelease: The pre-release identifier.
    ///     - build: Build metadata that identifies a build.
    public init(_ major: Int, _ minor: Int, _ patch: Int, prerelease: [String] = [], build: [String] = []) {
        self.major = major
        self.minor = minor
        self.patch = patch
        self.prerelease = prerelease
        self.build = build
    }
    
    public init?(_ string: String) {
        guard string.isValidSemanticVersion else { return nil }
        guard let coreRange = string.range(of: #"^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)"#, options: .regularExpression) else { return nil }
        let core = string[coreRange].split(separator: ".").compactMap { Int($0) }
        guard core.count == 3 else { return nil }

        var prerelease: [String] = []
        var build: [String] = []
        
        if let prereleaseRange = string.range(of: #"\-[a-zA-Z.0-9]+"#, options: .regularExpression) {
            prerelease = string[prereleaseRange].dropFirst().split(separator: ".").compactMap { String($0) }
        }

        if let buildRange = string.range(of: #"\+[a-zA-Z.0-9]+"#, options: .regularExpression) {
            build = string[buildRange].dropFirst().split(separator: ".").compactMap { String($0) }
        }
        
        self.init(core[0], core[1], core[2], prerelease: prerelease, build: build)
    }
}

public extension Version {
    static let zero = Version(0, 0, 0)
}
