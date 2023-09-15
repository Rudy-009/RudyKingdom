//
//  ChatBubble.swift
//  BuyLikeLion
//
//  Created by 김성준 on 2023/09/15.
//

import Foundation

struct ChatBubble: Identifiable {
    let id: String = UUID().uuidString
    var sender: String
    var content: String
    var time: String
}
