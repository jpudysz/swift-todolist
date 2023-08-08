import Foundation
import SwiftUI

struct ImagePickerController: UIViewControllerRepresentable {
    var onCancel: () -> Void
    var onSuccess: (UIImage, URL) -> Void
    @Environment(\.presentationMode) private var presentationMode
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let controller = UIImagePickerController()
        
        controller.sourceType = .photoLibrary
        controller.allowsEditing = false
        controller.delegate = context.coordinator
        
        let availableMediaType = UIImagePickerController.availableMediaTypes(for: .photoLibrary)
        
        if let availableMediaType = availableMediaType {
            controller.mediaTypes = availableMediaType
        }

        return controller
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // on update
    }
 
    func makeCoordinator() -> ImagePickerCoordinator {
        ImagePickerCoordinator(self)
    }
    
    class ImagePickerCoordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePickerController
                
        init(_ parent: ImagePickerController) {
           self.parent = parent
        }
        
        func hideController() {
            self.parent.presentationMode.wrappedValue.dismiss()
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            hideController()
            parent.onCancel()
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let selectedImageURI = info[UIImagePickerController.InfoKey.imageURL] as? URL,
                  let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
                hideController()
                parent.onCancel()
                
                return
            }
            
            hideController()
            parent.onSuccess(selectedImage, selectedImageURI)
        }
        
    }
}
