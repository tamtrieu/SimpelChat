//
//  DateFire.swift
//  ChatApp2
//
//  Created by Tam Trieu on 09/03/2023.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseCore
import FirebaseStorage

class DataFire : ObservableObject{
    @Published var chats = [IDData]()
    init() {
        let db =  Firestore.firestore()
        db.collection("chats").addSnapshotListener { snap, err in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            for i in snap!.documentChanges{
                if i.type == .added{
                    let id = i.document.documentID
                    guard let name  = i.document.get("Name :") as? String else{
                        return}
                    guard let msg  = i.document.get("Msg :") as? String else{
                        return}
                    guard let sendImg  = i.document.get("SendImg :") as? Data else{
                        return}
                    self.chats.append(IDData(id: id, msg: msg, name: name, sendImg: sendImg ))
                    }
                }
            }
        }
    func addData(name : String , msg : String , sendImg : Data){
        let db = Firestore.firestore()
        db.collection("chats").addDocument(data:["name" : name, "msg" : msg , "sendImg": sendImg]){ (err) in
            
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            print("Data was added")
        }
    }
    }

struct IDData : Identifiable{
    let id :String
    let msg :String
    let name : String
    @State var sendImg : Data
}
    
