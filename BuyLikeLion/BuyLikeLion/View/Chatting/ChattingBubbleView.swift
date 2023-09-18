//
//  ChattingBubble.swift
//  BuyLikeLion
//
//  Created by 이승준 on 2023/09/15.
//

import SwiftUI

struct ChattingBubbleView: View {
    var isCurrentUser: Bool
    var chat: ChatBubble
    
    var body: some View {
        HStack{
            Text(chat.content)
                .padding(10)
                .foregroundColor(isCurrentUser ? Color.white : Color.black)
                .background(isCurrentUser ? Color.gray : Color(UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)))
                .cornerRadius(10)
        }
    }
}

struct ChattingBubbleView_Previews: PreviewProvider {
    static var previews: some View {
        ChattingBubbleView(isCurrentUser: true, chat: ChatBubble(sender: "", content: "팔렸나요?", time: "0.0"))
    }
}
