//
//  TempChatbubbleStore.swift
//  BuyLikeLion
//
//  Created by 이승준 on 2023/09/15.
//

import Foundation
import FirebaseFirestore

class TempChatbubbleStore: ObservableObject {
    
    let dbRef = Firestore.firestore().collection("TempChattingRoom")
    
    var chats: [ChatBubble] = []
    
    func fetchChatting() {
        dbRef.getDocuments{ (snapshot, error) in
            self.chats.removeAll()
            
            if let snapshot {
                var tempChats: [ChatBubble] = []
                
                for document in snapshot.documents {
                    let id: String = document.documentID
                    
                    let docData: [String: Any] = document.data()
                    //let username: String = docData
                    
                    let sender: String = docData["sender"] as? String ?? ""
                    let content: String = docData["content"] as? String ?? ""
                    let time: String = docData["time"] as? String ??
                    "0.0"
                    
                    let chat = ChatBubble(id: id, sender: sender, content: content, time: time)
                    
                    tempChats.append(chat)
                    tempChats.sort{ $0.time < $1.time }
                }
                self.chats = tempChats
            }
        }
    }
    
    func addChatBubble(content: String) {
        var new = ChatBubble(sender: "Me", content: content, time: "0.0")
        new.time = new.now
        dbRef.document(new.id)
            .setData([
                "sender": new.sender,
                "content": new.content,
                "time": new.now
            ])
        fetchChatting()
    }
    
}
