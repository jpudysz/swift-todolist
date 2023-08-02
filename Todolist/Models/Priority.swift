import Foundation

enum Priority: String, CaseIterable {
    case unknown
    case low
    case medium
    case high
    
    func localized() -> String {
        NSLocalizedString("priority-\(self.rawValue)", comment: "")
    }
}
