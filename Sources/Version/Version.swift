import Foundation

public struct Version: Equatable {

    /// The major version according to the semantic versioning standard.
    public let major: Int

    /// The minor version according to the semantic versioning standard.
    public let minor: Int

    /// The patch version according to the semantic versioning standard.
    public let patch: Int

    /// The pre-release identifier according to the semantic versioning standard, such as `-beta.1`.
    public let prereleaseIdentifiers: [String]

    /// The build metadata of this version according to the semantic versioning standard, such as a commit hash.
    public let buildMetadataIdentifiers: [String]

    /// Initializes and returns a newly allocated version struct
    /// for the provided components of a semantic version.
    ///
    /// - Parameters:
    ///     - major: The major version number.
    ///     - minor: The minor version number.
    ///     - patch: The patch version number.
    ///     - prereleaseIdentifiers: The pre-release identifier.
    ///     - buildMetaDataIdentifiers: Build metadata that identifies a build.
    public init(_ major: Int, _ minor: Int, _ patch: Int, prereleaseIdentifiers: [String] = [], buildMetadataIdentifiers: [String] = []) {
        self.major = major
        self.minor = minor
        self.patch = patch
        self.prereleaseIdentifiers = prereleaseIdentifiers
        self.buildMetadataIdentifiers = buildMetadataIdentifiers
    }
    
    public init?(_ string: String) {
        let coreIdentifiersPair = string.split(separator: "-", maxSplits: 2, omittingEmptySubsequences: true)
        guard let coreString = coreIdentifiersPair.first else { return nil }
        let core: [Int] = coreString.split(separator: ".", maxSplits: 3, omittingEmptySubsequences: true).compactMap { Int($0) }
        guard core.count == 3 else { return nil }
        self.init(core[0], core[1], core[2], prereleaseIdentifiers: [], buildMetadataIdentifiers: [])
    }
}

public extension Version {
    static let zero = Version(0, 0, 0)
}
