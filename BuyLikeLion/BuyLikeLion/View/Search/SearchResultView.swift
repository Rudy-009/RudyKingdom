//
//  SearchResultView.swift
//  BuyLikeLion
//
//  Created by yunjikim on 2023/09/15.
//

import SwiftUI

struct SearchResultView: View {
    var searchText: String
    @EnvironmentObject var searchViewModel: SearchViewModel
    
    var body: some View {
        VStack {
            searchResultPost
            
            Spacer()
        }
        .padding(.horizontal)
        .navigationTitle(searchText)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            searchViewModel.searchPost(searchText)
            searchViewModel.addRecentSearchHistory(searchText)
        }
    }
    
    var searchResultPost: some View {
        ScrollView {
            if searchViewModel.searchResultPosts.isEmpty {
                Text("검색 결과가 없습니다.")
                    .foregroundColor(.gray)
                    .padding(.top)
            } else {
                ForEach(searchViewModel.searchResultPosts, id: \.bookName) { post in
                    NavigationLink {
                        //                    PostDetailView()
                    } label: {
                        VStack(alignment: .leading) {
                            HStack(alignment: .top, spacing: 12) {
                                RoundedRectangle(cornerRadius: 4) // image
                                    .frame(width: 100, height: 100)
                                
                                VStack(alignment: .leading) {
                                    VStack(alignment: .leading) {
                                        Text(post.bookName)
                                            .font(.title3.bold())
                                            .lineLimit(2)
                                            .multilineTextAlignment(.leading)
                                        Text("\(post.bookPublisher) | \(post.bookAuthor)")
                                            .font(.system(size: 14))
                                            .foregroundColor(.gray)
                                            .lineLimit(1)
                                    }
                                    
                                    Spacer()
                                    
                                    HStack {
                                        Spacer()
                                        Text("\(post.price)원")
                                            .font(.title3.bold())
                                    }
                                }
                            }
                        }
                        .foregroundColor(.primary)
                        .padding(.horizontal)
                        .padding(.vertical, 12)
                        .background {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(.gray.opacity(0.2))
                        }
                    }
                }
            }
        }
    }
}

struct SearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SearchResultView(searchText: "어쩌고")
        }
    }
}
