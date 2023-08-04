import SwiftUI

struct TodoProperty: View {
    var label: String
    var value: String
    var systemImage: String
    
    var body: some View {
        HStack {
            Label(label, systemImage: systemImage)
            Spacer()
            Text(value)
        }
    }
}

struct TodoProperty_Previews: PreviewProvider {
    static var previews: some View {
        TodoProperty(label: "Priority", value: "High", systemImage: "checkmark")
    }
}
