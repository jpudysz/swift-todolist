import SwiftUI

struct FormActionsView: View {
    var onSuccess: () -> Void
    var onCancel: () -> Void
    
    @Binding var text: String
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Text("common-save")
                    .frame(width: 200, height: 50)
                    .foregroundColor(.white)
                    .background(Color.accentColor)
                    .cornerRadius(8)
                    .disabled(text.isEmpty)
                    .foregroundColor(text.isEmpty ? .gray : .blue)
                    .onTapGesture {
                        onSuccess()
                    }
                Text("common-cancel")
                    .frame(width: 200, height: 50)
                    .foregroundColor(.secondary)
                    .onTapGesture {
                        onCancel()
                    }
            }
            Spacer()
        }
        .padding(.top, 20)
    }
}
struct FormActions_Previews: PreviewProvider {
    static var previews: some View {
        FormActionsView(onSuccess: {}, onCancel: {}, text: .constant(""))
    }
}
