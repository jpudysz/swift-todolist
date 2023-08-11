import SwiftUI
import MapKit

struct AddTodoView: View {
    @State private var priority: Priority = .low
    @State private var text: String = ""
    @State private var isCompleted: Bool = false
    @State private var isImagePickerVisible: Bool = false
    @State private var isLocationPickerVisible: Bool = false
    @State private var deadline: Date = Date()
    @State private var selectedImage: (UIImage, URL)?
    @State var selectedAnnotation: MKPointAnnotation?
    @Binding var isVisible: Bool
    @StateObject var model: Todolist
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            VStack {
                Form {
                    Section(header: Text("addtodo-base-section-header")) {
                        TextField(String(localized: "addtodo-base-section-text"), text: $text)
                            .autocorrectionDisabled(true)
                            .textInputAutocapitalization(.never)
                        PriorityPicker(showDefaultOption: false, priority: $priority)
                    }
                    SelectImageSection(isVisible: $isImagePickerVisible, selectedImage: $selectedImage)
                    Section(header: Text("addtodo-other-section-header")) {
                        Toggle(String(localized: "addtodo-other-section-completed"), isOn: $isCompleted)
                    }
                    Section(header: Text("addtodo-location-section-header")) {
                        Toggle(String(localized: "addtodo-location-add"), isOn: $isLocationPickerVisible)
                        if let location = selectedAnnotation {
                            // todo decode it
                            Text("\(String(localized: "common-location")): \(location.coordinate.latitude),\(location.coordinate.longitude)")
                        }
                    }
                    Section(header: Text("addtodo-deadline-section-header")) {
                        DatePicker(selection: $deadline, label: { Text("") })
                            .datePickerStyle(.graphical)
                    }
                    if horizontalSizeClass == .compact {
                        FormActionsView(
                            onSuccess: onSuccess,
                            onCancel: onCancel,
                            text: $text
                        )
                    }
                }
                if horizontalSizeClass == .regular {
                    FormActionsView(
                        onSuccess: onSuccess,
                        onCancel: onCancel,
                        text: $text
                    )
                }
            }
            .sheet(isPresented: $isImagePickerVisible, onDismiss: {}) {
                ImagePickerController(onCancel: {}) { selectedImage, selectedImageURI in
                    self.selectedImage = (selectedImage, selectedImageURI)
                }
            }
            .sheet(isPresented: $isLocationPickerVisible) {
                // todo display selected locatio
                // todo add option to remove selected location
                LocationPicker(isVisible: $isLocationPickerVisible, selectedAnnotation: $selectedAnnotation)
            }
        }
    }
    
    func getImageURI() -> String? {
        guard let (_, imageURI) = selectedImage else {
            return nil
        }
        
        return imageURI.absoluteString
    }
    
    func onSuccess() {
        // todo add coordiante to model
        let newTodo = Todo(
            text,
            priority: priority,
            isCompleted: isCompleted,
            deadline: deadline,
            imageURI: getImageURI()
        )
        
        model.addTodo(todo: newTodo)
        isVisible.toggle()
    }
    
    func onCancel() {
        isVisible.toggle()
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView(isVisible: .constant(true), model: Todolist(useMock: true))
    }
}
