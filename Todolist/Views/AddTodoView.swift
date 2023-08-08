import SwiftUI

struct AddTodoView: View {
    @State private var priority: Priority = .low
    @State private var text: String = ""
    @State private var isCompleted: Bool = false
    @State private var isImagePickerVisible: Bool = false
    @State private var selectedImage: (UIImage, URL)?
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
                            isImagePickerVisible.toggle()
                        } label: {
                            Text(selectedImage != nil ? "addtodo-image-change" : "addtodo-image-add")
                        }
                    }
                    Section(header: Text("addtodo-other-section-header")) {
                        Toggle(String(localized: "addtodo-other-section-completed"), isOn: $isCompleted)
                    }
                    if horizontalSizeClass == .compact {
                        AddTodoActionsView(
                            onSuccess: onSuccess,
                            onCancel: onCancel,
                            text: $text
                        )
                    }
                }
                if horizontalSizeClass == .regular {
                    AddTodoActionsView(
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
        }
    }
    
    func getImageURI() -> String? {
        guard let (_, imageURI) = selectedImage else {
            return nil
        }
        
        return imageURI.absoluteString
    }
    
    func onSuccess() {
        let newTodo = Todo(
            text,
            priority: priority,
            isCompleted: isCompleted,
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

struct AddTodoActionsView: View {
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
