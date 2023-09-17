//
//  ChattingsView.swift
//  BuyLikeLion
//
//  Created by 이승준 on 2023/09/15.
//

import SwiftUI

struct ChattingListView: View {
    let imagePath: String = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREfiutHaA2w55P0u2VqE6Qt1YE_uJ6irBZbA&usqp=CAU"
    
    var body: some View {
        VStack {
            List {
                ForEach(chatsampleData, id: \.id) { chatItem in
                    NavigationLink {
                        // MARK: 채팅뷰 주입 필요
                        ChattingView()
                    } label: {
                        LabeledContent {
                            AsyncImage(url: URL(string: imagePath)) { Image in
                                    Image
                                    .resizable()
                                    .cornerRadius(10)
                                    .frame(width: 50, height: 50)
                                
                            } placeholder: {
                                ProgressView()
                            }
                        } label: {
                            Text(chatItem.buyUser)
                            Text(getLastChattingContent(chatRoom: chatItem))
                        }
                    }
                }
            }
        }
        .navigationTitle("채팅")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func getLastChattingContent(chatRoom: ChatRoom) -> String {
        return chatRoom.chatting.sorted { $0.time > $1.time }.first?.content ?? "데이터가 존재하지 않습니다."
    }
}

struct ChattingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ChattingListView()
        }
    }
}

let chatsampleData: [ChatRoom] = [
    ChatRoom(soldUser: "판매자", buyUser: "구매자1", chatting: [ChatBubble(sender: "보낸사람", content: "안녕하세요-1", time: "2309151459"),
                                                          ChatBubble(sender: "보낸사람", content: "안녕하세요-2", time: "2309151500")]),
    ChatRoom(soldUser: "판매자", buyUser: "구매자2", chatting: [ChatBubble(sender: "구매자1", content: "안녕하세요1", time: "2309151500")]),
    ChatRoom(soldUser: "판매자", buyUser: "구매자3", chatting: [ChatBubble(sender: "구매자2", content: "안녕하세요2", time: "2309151501")]),
    ChatRoom(soldUser: "판매자", buyUser: "구매자4", chatting: [ChatBubble(sender: "구매자3", content: "안녕하세요3", time: "2309151502")]),
    ChatRoom(soldUser: "판매자", buyUser: "구매자5", chatting: [ChatBubble(sender: "구매자4", content: "안녕하세요4", time: "2309151503")]),
    ChatRoom(soldUser: "판매자", buyUser: "구매자6", chatting: [ChatBubble(sender: "구매자5", content: "안녕하세요5", time: "2309151504")]),
    ChatRoom(soldUser: "판매자", buyUser: "구매자7", chatting: [ChatBubble(sender: "구매자6", content: "안녕하세요6", time: "2309151505")]),
    ChatRoom(soldUser: "판매자", buyUser: "구매자8", chatting: [ChatBubble(sender: "구매자7", content: "안녕하세요7", time: "2309151506")]),
    ChatRoom(soldUser: "판매자", buyUser: "구매자9", chatting: [ChatBubble(sender: "구매자8", content: "안녕하세요8", time: "2309151507")])
]
