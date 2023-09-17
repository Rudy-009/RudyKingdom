//
//  SearchView.swift
//  BuyLikeLion
//
//  Created by yunjikim on 2023/09/15.
//

import SwiftUI

struct SearchView: View {
    @StateObject var searchViewModel: SearchViewModel = SearchViewModel()
    
    @State private var searchText: String = ""
    @State private var isSearchTextEmpty: Bool = true
    
    var body: some View {
        VStack {
            searchTextField
            recentSearchWord
            
            Spacer()
        }
        .padding(.horizontal)
        .navigationTitle("검색하기")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    var searchTextField: some View {
        VStack {
            HStack {
                TextField("검색어를 입력하세요...", text: $searchText)
                    .onChange(of: searchText) { newValue in
                        if searchText.isEmpty {
                            isSearchTextEmpty = true
                        } else {
                            isSearchTextEmpty = false
                        }
                    }
                
                NavigationLink {
                    SearchResultView(searchText: searchText)
                } label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.primary)
                }
//                .disabled(isSearchTextEmpty)
            }
            .padding(.horizontal)
            .padding(.vertical, 12)
            .background {
                RoundedRectangle(cornerRadius: 4)
                    .fill(.gray.opacity(0.15))
            }
        }
        .padding(.bottom, 30)
    }
    
    var recentSearchWord: some View {
        VStack(alignment: .leading) {
            Text("최근 검색어")
                .font(.title3.bold())
            
            Divider()
                .padding(.bottom)
            
            if searchViewModel.recentSearchWords.isEmpty {
                Text("최근 검색한 키워드가 없습니다.")
                    .foregroundColor(.gray)
            } else {
                ForEach(searchViewModel.recentSearchWords, id: \.self) { word in
                    HStack {
                        Text(word)
                        
                        Spacer()
                        
                        Button {
                            // action ...
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundColor(.primary)
                        }
                    }
                    .padding(.bottom, 8)
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SearchView()
        }
    }
}
