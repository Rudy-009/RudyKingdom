//
//  Post.swift
//  BuyLikeLion
//
//  Created by SONYOONHO on 2023/09/15.
//

import Foundation

struct Post: Identifiable {
    let id: String
    let writer: String
    var bookName: String
    var bookAuthor: String
    var bookPublisher: String
    var price: Int
    var content: String
    var images: [String]
    let writtenDate: String
    var isTrading: Bool
    
    init(id: String = UUID().uuidString, writer: String, bookName: String, bookAuthor: String, bookPublisher: String, price: Int, content: String, images: [String], writtenDate: String, isTrading: Bool) {
        self.id = id
        self.writer = writer
        self.bookName = bookName
        self.bookAuthor = bookAuthor
        self.bookPublisher = bookPublisher
        self.price = price
        self.content = content
        self.images = images
        self.writtenDate = writtenDate
        self.isTrading = isTrading
    }
}

extension Post {
    static let sampleData: Post = Post(writer: "손윤호", bookName: "클린코드", bookAuthor: "로버트C.마틴", bookPublisher: "인사이트", price: 14000, content: "클린코드 싸게 팝니다. 상태는 거의 새 책입니다.클린코드 싸게 팝니다. 상태는 거의 새 책입니다.클린코드 싸게 팝니다. 상태는 거의 새 책입니다.클린코드 싸게 팝니다. 상태는 거의 새 책입니다.클린코드 싸게 팝니다. 상태는 거의 새 책입니다.클린코드 싸게 팝니다. 상태는 거의 새 책입니다.클린코드 싸게 팝니다. 상태는 거의 새 책입니다.", images: ["https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA0MjJfMTUy%2FMDAxNjUwNTkwMzMxMDEy.MHtx5soS5jOKWm4cN76KH1dNI4b51jXau_gihlX98pEg.x6AhppZ_MH2muBp-o5OIvACW8k3Ct_uC3biY-em1qssg.PNG.alwl0318%2Fimage.png&type=sc960_832", "https://search.pstatic.net/common/?src=http%3A%2F%2Fcafefiles.naver.net%2FMjAxOTA2MjJfOSAg%2FMDAxNTYxMTY5MTE3NTAw.XkxU6afhQ0O2iYzYcMPEHwxDLSiNdeOnmPmSmkLgz0kg.9Nge5m6IRlQFVnr2-lVBnlq7RZx4LDNojYnyqVlPFVwg.JPEG%2F15611691032992907945379109123178.jpg&type=sc960_832"], writtenDate: "2023-09-15", isTrading: false)
}
