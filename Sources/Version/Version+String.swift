import Foundation

extension Version : ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self = Version(value) ?? .zero
    }
}

extension Version : LosslessStringConvertible {
    public var description: String {
        let prereleaseIdentifiersDescription = prerelease.isEmpty ? "" : "-" + prerelease.dotDescription
        let buildMetadataIdentifiersDescription = build.isEmpty ? "" : "+" + build.dotDescription
        return "\(major).\(minor).\(patch)\(prereleaseIdentifiersDescription)\(buildMetadataIdentifiersDescription)"
    }
}

extension Collection where Element == String {
    var dotDescription: String {
        String(self.reduce("") { $0 + $1 + "." }.dropLast())
    }
}

extension String {
    var isValidSemanticVersion: Bool {
        let regex = #"^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)(?:-((?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\.(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*))*))?(?:\+([0-9a-zA-Z-]+(?:\.[0-9a-zA-Z-]+)*))?$"#
        return self.range(of: regex, options: .regularExpression) != nil
    }
}
