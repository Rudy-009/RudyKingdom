//
//  MyPageView.swift
//  BuyLikeLion
//
//  Created by 이승준 on 2023/09/15.
//

import SwiftUI

struct MyPageView: View {
    
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
                    VStack {
                        Picker("보고싶은 거래내역을 눌러주세요", selection: $selectedTrading) {
                            ForEach(0 ..< tradingHistorty.count) {
                                Text(self.tradingHistorty[$0])
                            }
                        }
                        Group {
                            if selectedTrading == 0 {
                                HStack {
                                    AsyncImage(url: URL(string: "https://shopping-phinf.pstatic.net/main_3245790/32457901670.20221227210312.jpg?type=w300")) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .background(.gray)
                                        
                                            .frame(width: 100, height: 100)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        Text("스윗한 SwiftUI")
                                            .font(.headline)
                                            .bold()
                                        Text("이봉원")
                                        Text("28800원")
                                    }
                                    Spacer()
                                    
                                    VStack {
                                        Button {
                                            //
                                        } label: {
                                            Image(systemName: "ellipsis")
                                                .foregroundColor(.black)
                                        }
                                        Spacer()
                                        
                                        Text("판매중")
                                        
                                    }
                                    .padding()
                                }
                                
                            } else {
                                HStack {
                                    AsyncImage(url: URL(string: "https://shopping-phinf.pstatic.net/main_3633406/36334065638.20230711113244.jpg?type=w300")) { image in
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
                                        
                                        Text("깡쌤의 안드로이드 프로그래밍")
                                            .font(.headline)
                                            .bold()
                                        Text("강성윤")
                                        Text("36000원")
                                        
                                        
                                    }
                                    
                                    Spacer()
                                    
                                    VStack {
                                        Button {
                                            //
                                        } label: {
                                            Image(systemName: "ellipsis")
                                                .foregroundColor(.black)
                                        }
                                        Spacer()
                                        
                                        Text("구매 완료")
                                    }
                                    .padding()
                                }
                            }
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
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
