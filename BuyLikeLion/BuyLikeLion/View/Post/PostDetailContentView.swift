//
//  PostDetailImageView.swift
//  BuyLikeLion
//
//  Created by SONYOONHO on 2023/09/15.
//

import SwiftUI

struct PostDetailContentView: View {
    @Environment(\.dismiss) var dismiss
    var safeArea: EdgeInsets
    var size: CGSize
    var postViewModel: PostViewModel
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: true) {
                VStack(alignment: .leading) {
                    imageTabView()
                    postInfoView()
                }
                .overlay(alignment: .top) {
                    headerView()
                }
            }
            .coordinateSpace(name: "SCROLL")
            
            footerView()
        }
    }
    
    @ViewBuilder
    func headerView() -> some View {
        GeometryReader { proxy in
            let minY = proxy.frame(in: .named("SCORLL")).minY
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(.white)
                }
            }
            .padding(.top, safeArea.top)
            .padding([.horizontal, .bottom], 20)
            .offset(y: -minY)
        }
    }
    
    @ViewBuilder
    func imageTabView() -> some View {
        let height = size.height * 0.45
        GeometryReader { proxy in
            let size = proxy.size
            let minY = proxy.frame(in: .named("SCROLL")).minY
            
            TabView {
                ForEach(postViewModel.post.images, id: \.self) { imageString in
                    AsyncImage(url: URL(string: imageString)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size.width, height: size.height + (minY > 0 ? minY : 0))
                            .clipped()
                            .overlay(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.black.opacity(0.5), Color.clear]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                                .frame(height: safeArea.top + 50)
                                .zIndex(1),
                                alignment: .top
                            )
                    } placeholder: {
                        ProgressView()
                    }
                    
                }
            }
            .background(.black)
            .frame(width: size.width, height: size.height + (minY > 0 ? minY : 0))
            .offset(y: minY > 0 ? -minY : 0)
            .tabViewStyle(PageTabViewStyle())
        }
        .frame(height: height + safeArea.top)
    }
    
    @ViewBuilder
    func postInfoView() -> some View {
        Text("\(postViewModel.post.writer)")
            .fontWeight(.bold)
            .padding()
        
        Divider()
            .padding(.horizontal)
        
        Text("\(postViewModel.post.isTrading ? "판매완료" : "판매중")")
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(.horizontal, 25)
            .padding(.vertical, 8)
            .background {
                RoundedRectangle(cornerRadius: 7)
                    .fill(postViewModel.post.isTrading ? .orange : .blue)
            }
            .padding([.horizontal, .top])
            .padding(.bottom, 10)
        
        Text("\(postViewModel.post.bookName)")
            .font(.title2)
            .fontWeight(.black)
            .padding(.leading)
        
        HStack {
            Text("\(postViewModel.post.bookPublisher)")
            
            Divider()
            
            Text("\(postViewModel.post.bookAuthor)")
            
            Spacer()
            
            Text("\(postViewModel.post.writtenDate)")
                .foregroundColor(.gray)
                .padding(.trailing)
        }
        .padding([.leading, .bottom])
        .padding(.top, -10)
        
        Text("\(postViewModel.post.content)")
            .padding()
        
        Divider()
            .padding(.horizontal)
        
        //TODO: 이거도 팔고 있어요 View
    }
    
    @ViewBuilder
    func footerView() -> some View {
        HStack {
            Text("\(postViewModel.post.price)원")
                .font(.title3)
                .fontWeight(.bold)
                .padding(.leading)
            
            Spacer()
            
            Button {
                //TODO: Button Action
            } label: {
                Text("채팅하기")
                    .foregroundColor(.white)
                    .padding(.vertical, 8)
                    .padding(.horizontal)
                    .background(.orange)
                    .cornerRadius(6)
                    .padding(.trailing)
            }
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity, alignment: .trailing)
        .background(.cyan)
    }
}

struct PostDetailImageView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView()
    }
}
