//
//  PostEditView.swift
//  BuyLikeLion
//
//  Created by 박형환 on 2023/09/15.
//

import SwiftUI
import UIKit

struct PostEditView: View {

    private let textFieldBack: Color = Color(uiColor: .secondarySystemBackground)
    private let configuration: () -> () = {
        UITextView.appearance().tintColor = .black
    }
    
    private let action: () -> () = {
        print("2331")
    }
    
    @State private var title: String = ""
    @State private var author: String = ""
    @State private var publisher: String = ""
    @State private var price: String = ""
    @State private var postContent: String = ""
    
    @State private var placeholderText: String = "게시글에 대한 내용입니다."
    
    @FocusState private var focusField: Field?
    
    @EnvironmentObject private var keyboard: KeyboardHeightHelper
    
    var body: some View {
        ScrollView {
            ScrollView(.horizontal) {
                ImageAddView {
                    action()
                }
            }.scrollIndicators(.hidden)
            
            VStack {
                EditTextField(title: "책 제목",
                              placeHolder: "제목을 입력해주세요",
                              text: $title,
                              focusField: $focusField,
                              filed: .title)
                    .padding(.horizontal, 10)
                    .padding(.top, 12)
                
                EditTextEditor(text: $postContent)
                    .padding(.horizontal, 10)
                    .padding(.top, 12)
                
                EditTextField(title: "책 저자",
                              placeHolder: "제목을 입력해주세요",
                              text: $author,
                              focusField: $focusField,
                              filed: .author)
                    .padding(.horizontal, 10)
                    .padding(.top, 12)
                
                EditTextField(title: "출판사",
                              placeHolder: "제목을 입력해주세요",
                              text: $publisher,
                              focusField: $focusField,
                              filed: .publisher)
                    .padding(.horizontal, 10)
                    .padding(.top, 12)
                
                EditTextField(title: "책 가격",
                              placeHolder: "제목을 입력해주세요",
                              text: $price,
                              focusField: $focusField,
                              filed: .price)
                    .padding(.horizontal, 10)
                    .padding(.top, 12)
                    .padding(.bottom , 20)
            }
        }
        .navigationTitle("게시글 수정")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            configuration()
            
        }
        //.toolbar(.hidden, for: .tabBar)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing, content: {
                Button {
                    
                } label: {
                    Text("수정") // 등록
                }.disabled(true)
            })
        }
    }
}



struct PostEditView_Previews: PreviewProvider {
    static var previews: some View {
        PostEditView()
    }
}
