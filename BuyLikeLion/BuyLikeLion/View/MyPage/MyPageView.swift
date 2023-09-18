//
//  MyPageView.swift
//  BuyLikeLion
//
//  Created by 이승준 on 2023/09/15.
//

import SwiftUI



struct MyPageView: View {
    @ObservedObject var myPageBookStore: MyPageBookStore = MyPageBookStore()
    let tradingHistorty = ["나의 판매내역", "나의 구매내역"]
    @State private var selectedTrading = 0
    
    var body: some View {
        VStack {
            Form {
                Section {
                    HStack {
                        AsyncImage(url: URL(string: "https://search.pstatic.net/sunny/?src=https%3A%2F%2Fi2.ruliweb.com%2Fimg%2F23%2F02%2F08%2F18631340b42b44c.jpg&type=a340")) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .background(.gray)
                                .clipShape(Circle())
                                .frame(width: 100, height: 100)
                        } placeholder: {
                            ProgressView()
                        }
                        
                        VStack(alignment: .leading) {
                            Text("루디 곤듀")
                                .font(.title)
                                .bold()
                            Text("지축동")
                        }
                        .padding()
                    }
                }
                Section("거래내역") {
                    //                    VStack {
                    Picker("보고싶은 거래내역을 눌러주세요", selection: $selectedTrading) {
                        ForEach(0 ..< tradingHistorty.count) {
                            Text(self.tradingHistorty[$0])
                        }
                    }
                    
                    if selectedTrading == 0 {
                        List {
                            ForEach(myPageBookStore.completedPurchase, id: \.id) { purchase in
                                TradingHistoryView(myPageBookSotre: myPageBookStore, bookname: purchase.name, author: purchase.author, price: purchase.price, bookImageURL: purchase.bookImageURL )
                            }
                        }
                    } else {
                        List(myPageBookStore.completedSale) { sale in
                            TradingHistoryView(myPageBookSotre: myPageBookStore, bookname: sale.name, author: sale.author, price: sale.price, bookImageURL: sale.bookImageURL )
                        }
                    }
                    
                }
                .pickerStyle(SegmentedPickerStyle())
            }
        }
        .navigationTitle("계정 정보")
    }
    
}



struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            MyPageView()
            
        }
    }
}
