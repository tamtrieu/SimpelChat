//
//  MessagePage.swift
//  ChatApp2
//
//  Created by Tam Trieu on 16/03/2023.
//

import SwiftUI
import Combine

struct MessagePage: View {
    @ObservedObject var message = DataFire()
    var name = ""
    @State var sendImg : Data = .init(count : 0)
    @State var  txt = ""
    @State var showImagePicker : Bool = false
    var body: some View {
        VStack{
            List (message.chats){ msg in
                if msg.name == self.name{
                    LissMessage(msg: msg.msg, trailingLeading: true, user: msg.name, sendImg: msg.$sendImg)
                }else{
                    LissMessage(msg: msg.msg, trailingLeading: false, user: msg.name, sendImg: msg.$sendImg)
                }
            }
        }.navigationBarTitle("Chat",displayMode: .inline)
        HStack{
            Button(action: {
                // call Imagepicker
                self.showImagePicker.toggle()
            }){
                Image(systemName: "plus")
            }
            TextField("Message...", text : self.$txt)
                .textFieldStyle(.roundedBorder)
            Button(action: {
                //Chat with someone
                if self.txt.count != 0 && self.sendImg.count == 0 {
                    self.message.addData(name: self.name, msg: self.txt, sendImg: Data())
                }else if self.txt.count == 0 && self.sendImg.count != 0 {
                    self.message.addData(name: self.name, msg: String(), sendImg: self.sendImg)
                    
                }
                self.txt = ""
                self.sendImg.count = 0
            }){
                Text("Send")
                    .bold()
                    .foregroundColor(.white)
                // The backgound  color will  be gray  until the user write sth
                    .background(self.txt.count > 0 ? Color.blue : Color.gray)
                    .cornerRadius(5)
                
                // The button will be until  the user  write sth
                    .disabled(self.txt.count > 0 ? false : true)
            }
        }.padding()
            .sheet(isPresented : self.$showImagePicker){
                ImagePicker(images: self.$sendImg, show: self.$showImagePicker)
            }
    }
}

struct MessagePage_Previews: PreviewProvider {
    static var previews: some View {
        MessagePage()
    }
}
