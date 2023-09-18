//
//  ChatBubble.swift
//  BuyLikeLion
//
//  Created by 김성준 on 2023/09/15.
//

import Foundation

struct ChatBubble: Identifiable, Codable, Equatable {
    var id: String = UUID().uuidString
    var sender: String
    var content: String
    var time: String
    
    var now: String {
        
        let nowTime = Date().timeIntervalSince1970
        let dateCreatedAt: Date = Date(timeIntervalSince1970: nowTime)
        let dateFormatter: DateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "ko_kr")
        dateFormatter.timeZone = TimeZone(abbreviation: "KST")
        dateFormatter.dateFormat = "MM월 dd일 HH시 mm분 ss초"
        
        return dateFormatter.string(from: dateCreatedAt)
    }
}
