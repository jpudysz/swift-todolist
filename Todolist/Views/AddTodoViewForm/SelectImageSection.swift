import SwiftUI

struct SelectImageSection: View {
    @Binding var isVisible: Bool
    @Binding var selectedImage: (UIImage, URL)?
    
    var body: some View {
        Section(header: Text("addtodo-image-header")) {
            if let (image, _) = selectedImage {
                ZStack(alignment: .topTrailing) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                    Button {
                        selectedImage = nil
                    } label: {
                        Circle()
                            .fill(.black)
                            .background(.black)
                            .cornerRadius(50)
                            .frame(width: 30, height: 30)
                            .overlay {
                                Image(systemName: "trash")
                                    .foregroundColor(.white)
                            }
                            .padding(.trailing, 5)
                            .padding(.top, 5)
                    }
                }
            }
            Button {
                isVisible.toggle()
            } label: {
                Text(selectedImage != nil ? "addtodo-image-change" : "addtodo-image-add")
            }
        }
    }
}

struct SelectImageSection_Previews: PreviewProvider {
    static var previews: some View {
        SelectImageSection(isVisible: .constant(true), selectedImage: .constant(nil))
    }
}
