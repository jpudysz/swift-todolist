import SwiftUI

struct SearchInput: View {
    @Binding var query: String
    
    var body: some View {
        TextField(String(localized: "search-placeholder"), text: $query)
            .textFieldStyle(.roundedBorder)
            .padding(.bottom)
            .autocorrectionDisabled(true)
            .textInputAutocapitalization(.never)
    }
}

struct SearchInput_Previews: PreviewProvider {
    static var previews: some View {
        SearchInput(query: .constant("Hello"))
    }
}
