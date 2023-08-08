import SwiftUI

struct TodoImage: View {
    var imageURI: String?
    
    var body: some View {
        if let uiImage = getUIImageOfFail() {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
        } else {
            EmptyView()
        }
    }
    
    func getUIImageOfFail() -> UIImage? {
        do {
            guard let imageURI = imageURI,
                  let url = URL(string: imageURI) else {
                return nil
            }
            let data = try Data(contentsOf: url)
            
            return UIImage(data: data)
        } catch {
            return nil
        }
    }
}

struct TodoImage_Previews: PreviewProvider {
    static var previews: some View {
        TodoImage()
    }
}
