import Foundation

enum Priority: String, CaseIterable, Localizable {
    case unknown
    case low
    case medium
    case high
    
    func toLocalizedString() -> String {
        NSLocalizedString("priority-\(self.rawValue)", comment: "")
    }
}
