import Foundation

extension Version: Comparable {
    
    public static func < (lhs: Version, rhs: Version) -> Bool {
        guard lhs.major >= rhs.major else { return true }
        guard lhs.minor >= rhs.minor else { return true }
        guard lhs.patch >= rhs.patch else { return true }
        return false
    }
}
