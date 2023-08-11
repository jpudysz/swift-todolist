import SwiftUI
import MapKit

struct LocationPicker: View {
    @Binding var isVisible: Bool
    @Binding var selectedAnnotation: MKPointAnnotation?
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            MapView(selectedAnnotation: $selectedAnnotation)
            Button(action: {
                isVisible.toggle()
            }, label: {
                Image(systemName: "xmark")
                    .frame(width: 40, height: 40)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(.primary)
                    .cornerRadius(20)
                    .padding(.trailing, 10)
                    .padding(.top, 10)
            })
        }
    }
}

struct LocationPicker_Previews: PreviewProvider {
    static var previews: some View {
        LocationPicker(isVisible: .constant(true), selectedAnnotation: .constant(nil))
    }
}
