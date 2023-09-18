//
//  TradingHistoryView.swift
//  BuyLikeLion
//
//  Created by 김윤우 on 2023/09/17.
//

import SwiftUI

struct TradingHistoryView: View {
    @ObservedObject var myPageBookSotre: MyPageBookStore
    @State private var isshowingSheet = false
    var bookname: String
    var author: String
    var price: String
    var bookImageURL: String
    
    var body: some View {
        HStack {
            
                NavigationLink {
                    PostCell()
                } label: {
                    HStack {
                        AsyncImage(url: URL(string: bookImageURL )) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .background(Color.gray)
                                .frame(width: 100, height: 100)
                        } placeholder: {
                            ProgressView()
                        }
                        
                        VStack(alignment: .leading) {
                            Text(bookname)
                                .font(.headline)
                                .bold()
                            Text(author)
                            Text(price)
                        }
                        .multilineTextAlignment(.leading)
                        
                        Spacer()
                        
                        VStack {
                            Button {
                                isshowingSheet = true
                            } label: {
                                Image(systemName: "ellipsis")
                                    .foregroundColor(.black)
                            }
                            .buttonStyle(.plain)
                            .confirmationDialog("거래내역", isPresented: $isshowingSheet, titleVisibility: .visible) {
                                Button("삭제하기", role: .destructive) {}
                                Button("수정하기") {/*수정 동작 */ }
                                  Button("취소", role: .cancel) {}
                                }
                            Spacer()
                            
                            Text("판매중")
                            
                        }
                        .padding()
                        Spacer()
                    }
                }
                .foregroundColor(Color.black)
            }
        
       
    }
}


struct TradingHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TradingHistoryView(myPageBookSotre: MyPageBookStore(), bookname: "스윗한 SwiftUI", author: "이봉원", price: "28,000원", bookImageURL: "https://shopping-phinf.pstatic.net/main_3245790/32457901670.20221227210312.jpg?type=w300")
        }
    }
}
