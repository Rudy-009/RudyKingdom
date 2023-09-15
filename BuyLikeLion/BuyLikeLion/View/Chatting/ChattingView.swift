//
//  ChattingView.swift
//  BuyLikeLion
//
//  Created by 이승준 on 2023/09/15.
//

import SwiftUI


struct ChattingView: View {
    @State var typingText: String = ""
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var temp: TempChatbubbleStore = TempChatbubbleStore()

    var body: some View {
        VStack {
            HStack {
                // MARK: 뒤로가기 버튼
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "lessthan")
                        .resizable()
                        .frame(width: 15)
                        .frame(height: 25)
                }
                .tint(.gray)
                Spacer()
                // MARK: 거래자 이름 or 닉네임
                Text("거래자 이름 or 닉네임")
                    .padding(.trailing)
                Spacer()
            }
            .padding(.leading)
            .padding(.trailing)
            HStack {
                Group{
                    // MARK: 게시물 1번 사진
                    AsyncImage( url: URL(string :"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREfiutHaA2w55P0u2VqE6Qt1YE_uJ6irBZbA&usqp=CAU")){ image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 70)
                    } placeholder: {
                        ProgressView() //로딩 중일 때 삥글삥글 돌아가는 거
                    }
                    .padding(.leading)
                    VStack(alignment: .leading) {
                        // MARK: 상품명
                        Text("상품명")
                        // MARK: 가격
                        Text("15000원")
                    }
                }
                .padding(.top, 10)
                .padding(.bottom, 10)
                Spacer()
            }
            .background(Color(.lightGray))
            ScrollView {
                ForEach(temp.chats) { chat in
                    HStack {
                        if chat.sender == "Me" {
                            Spacer()
                        }
                        ChattingBubbleView(isCurrentUser: chat.sender == "Me", chat: chat)
                            .padding(.leading, 15)
                            .padding(.trailing, 15)
                        if chat.sender != "Me" {
                            Spacer()
                        }
                        
                    }
                }
                .listStyle(.plain)
            }
            HStack{
                // MARK: +
                Button {
                    
                } label: {
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                        .tint(.black)
                        .padding(.leading, 10)
                }
                // MARK: TextField
                TextField("Type Something", text: $typingText)
                    .font(.title3)
                    .border(.black)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                // MARK: 보내기
                Button {
                    temp.addChatBubble(content: typingText)
                    //보내는 버튼을 누르면 알아서 내용 지우기
                    typingText = ""
                } label: {
                    ZStack{
                        Circle()
                            .frame(width: 35)
                            .tint(.black)
                        Image(systemName: "paperplane.fill")
                            .tint(.white)
                    }
                }
                .padding(.trailing,10)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ChattingView_Previews: PreviewProvider {
    static var previews: some View {
        ChattingView()
    }
}
