import SwiftUI

struct Checkbox: View {
    @Binding var isSelected: Bool
    
    var body: some View {
        Button {
            isSelected.toggle()
        } label: {
            Circle()
                .stroke(Color("BorderColor"), lineWidth: 2)
                .cornerRadius(10)
                .background(
                    Circle()
                        .foregroundColor(isSelected ? .accentColor : .clear)
                        .frame(width: 13, height: 13)
                )
                .frame(width: 20, height: 20)
        }
    }
}

struct Checkbox_Previews: PreviewProvider {
    static var previews: some View {
        Checkbox(isSelected: .constant(true))
    }
}
