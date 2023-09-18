//
//  ChatRoom.swift
//  BuyLikeLion
//
//  Created by 김성준 on 2023/09/15.
//

import Foundation

struct ChatRoom {
//    var 게시물: 게시물
    let id: String = UUID().uuidString
    var soldUser: String
    var buyUser: String
    var chatting: [ChatBubble]
}
