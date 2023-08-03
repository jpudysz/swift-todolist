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
                    Text("priority-unknown").tag(Priority.unknown)
                }
                ForEach(Priority.allCases.dropFirst(), id: \.self) {
                    Text($0.localized()).tag($0)
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