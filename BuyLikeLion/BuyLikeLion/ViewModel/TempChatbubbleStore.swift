//
//  TempChatbubbleStore.swift
//  BuyLikeLion
//
//  Created by 이승준 on 2023/09/15.
//

import Foundation

class TempChatbubbleStore: ObservableObject {
    
    var chats: [ChatBubble] = [
        ChatBubble(sender: "Me", content: "팔렸나요?", time: "1"),
        ChatBubble(sender: "Not", content: "아니요", time: "2"),
        ChatBubble(sender: "Me", content: "파실 건가요?", time: "3"),
        ChatBubble(sender: "Not", content: "네", time: "4"),
        ChatBubble(sender: "Me", content: "3000원만 좀...", time: "5"),
        ChatBubble(sender: "Not", content: "네?", time: "6"),
        ChatBubble(sender: "Me", content: "아니에요", time: "7"),
    ]
    
    func addChatBubble(content: String) {
        let new = ChatBubble(sender: "Me", content: content, time: "?")
        chats.append(new)
    }
    
}
