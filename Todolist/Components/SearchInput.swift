import SwiftUI

struct SearchInput: View {
    @Binding var query: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField(String(localized: "search-placeholder"), text: $query)
                .frame(height: 30)
                .padding(.vertical, 6)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
        }
        .padding(.horizontal)
        .background(Color("SecondaryColor"))
        .cornerRadius(10)
    }
}

struct SearchInput_Previews: PreviewProvider {
    static var previews: some View {
        SearchInput(query: .constant("Hello"))
    }
}
