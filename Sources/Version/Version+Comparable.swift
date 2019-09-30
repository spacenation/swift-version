import Foundation

extension Version: Comparable {
    public static func < (lhs: Version, rhs: Version) -> Bool {
        guard lhs.major >= rhs.major else { return true }
        guard lhs.minor >= rhs.minor else { return true }
        guard lhs.patch >= rhs.patch else { return true }
        return prereleaseCompare(lhs.prerelease, rhs.prerelease)
    }
}

func prereleaseCompare(_ lhs: [String], _ rhs: [String]) -> Bool {
    guard lhs.count > rhs.count else { return true }
    guard lhs.description >= rhs.description else { return true }
    return false
}
