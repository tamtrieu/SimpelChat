//
//  ContentView.swift
//  ChatApp2
//
//  Created by Tam Trieu on 09/03/2023.
//

import SwiftUI

struct ContentView: View {
    @State var name = ""
    @State var show = false
    var body: some View {
        NavigationView{
        VStack {
            TextField("Name...",text: self.$name)
                .textFieldStyle(.roundedBorder)
            NavigationLink(destination: MessagePage(name: self.name,sendImg: Data())){
                
                Text ("Join").padding(6)
            }.foregroundColor(.white)
                .background(self.name.count > 0 ? Color.blue : Color.gray)
            //.disabled(self.name.count > 5 ? false  : true)
        }.padding()
    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ImagePicker :  UIViewControllerRepresentable{
    func makeCoordinator() -> Coordinator {
        return ImagePicker.Coordinator(img1: self)
    }
    @Binding var images  : Data
    @Binding var show : Bool
    func  makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
    
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate  = context.coordinator
        return picker
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<ImagePicker>) {
        //
    }
    class Coordinator : NSObject , UIImagePickerControllerDelegate, UINavigationControllerDelegate{
        var img0 : ImagePicker
        init(img1:ImagePicker){
            img0=img1
        }
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            //to Enable the cancle button
            self.img0.show.toggle()
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let image = info[.originalImage] as! UIImage
            let data = image.jpegData(compressionQuality : 1.0)
            self.img0.show.toggle()
            self.img0.images = data!
        }
    }
}
