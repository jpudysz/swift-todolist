import SwiftUI

struct PriorityPicker: View {
    var showDefaultOption: Bool = true
    @Binding var priority: Priority
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("priority")
                .font(.caption)
                .bold()
            Picker("", selection: $priority) {
                if showDefaultOption {
                    Text(String(localized: "priority-unknown").capitalized)
                        .tag(Priority.unknown)
                }
                ForEach(Priority.allCases.dropFirst(), id: \.self) {
                    Text($0.toLocalizedString().capitalized).tag($0)
                }
            }
            .padding(.bottom)
            .pickerStyle(.segmented)
        }
    }
}

struct PriorityPicker_Previews: PreviewProvider {
    static var previews: some View {
        PriorityPicker(priority: .constant(.medium))
    }
}
