//
//  LissMessage.swift
//  ChatApp2
//
//  Created by Tam Trieu on 16/03/2023.
//

import SwiftUI

struct LissMessage: View {
    var msg = ""
    var trailingLeading = false
    var user = ""
    
    @Binding var sendImg : Data
    var body: some View {
        HStack{
            if trailingLeading{
                
                Spacer()
                
                HStack{
                    VStack(alignment: .leading){
                        if self.msg.count != 0 {
                            Text(msg).background(Color.blue)
                                .cornerRadius(18)
                            .foregroundColor(.white)
                            
                        }
                        if self.sendImg.count != 0 {
                            Image(uiImage:  UIImage(data: self.sendImg)!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: UIScreen.main.bounds.width - 90)
                                .cornerRadius(10)
                        }
                    }
                }
            }else{
                
                HStack{
                    VStack(alignment: .leading){
                        if self.msg.count != 0{
                            Text(msg).background(Color.blue)
                                .cornerRadius(18)
                                .foregroundColor(.white)
                            
                        }
                        if self.sendImg.count != 0 {
                            Image(uiImage:  UIImage(data: self.sendImg)!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: UIScreen.main.bounds.width - 90)
                                .cornerRadius(10)
                        }
                    }
                Spacer()
                }
            }
        }
    }
}

