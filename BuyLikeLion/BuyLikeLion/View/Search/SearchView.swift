//
//  SearchView.swift
//  BuyLikeLion
//
//  Created by yunjikim on 2023/09/15.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var searchViewModel: SearchViewModel
    
    @State private var searchText: String = ""
    @State private var trimmedSearchText: String = ""
    @State private var isSearchTextEmpty: Bool = true
    
    var body: some View {
        VStack {
            searchTextField
            recentSearchText
            recentSearchHistory
            
            Spacer()
        }
        .padding(.horizontal)
        .navigationTitle("검색하기")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    var searchTextField: some View {
        VStack {
            HStack {
                TextField("책이나 저자, 출판사로 검색해보세요...", text: $searchText)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .onChange(of: searchText) { newValue in
                        trimmedSearchText = searchText.trimmingCharacters(in: .whitespaces)
                        if trimmedSearchText.isEmpty {
                            isSearchTextEmpty = true
                        } else {
                            isSearchTextEmpty = false
                        }
                    }
                
                if !searchText.isEmpty {
                    Button {
                        searchText = ""
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing, 5)
                }
                
                NavigationLink {
                    SearchResultView(searchText: trimmedSearchText)
                } label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.primary)
                }
                .disabled(isSearchTextEmpty)
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
    
    var recentSearchText: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Text("최근 검색어")
                    .fontWeight(.bold)
                
                Spacer()
                
                if !searchViewModel.recentSearchHistories.isEmpty {
                    Button {
                        searchViewModel.removeAllRecentSearchHistories()
                    } label: {
                        Text("모두 지우기")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
    }
    
    var recentSearchHistory: some View {
        VStack(alignment: .leading) {
            Divider()
                .padding(.bottom)
            
            if searchViewModel.recentSearchHistories.isEmpty {
                Text("최근 검색한 키워드가 없습니다.")
                    .foregroundColor(.gray)
            } else {
                ForEach(searchViewModel.recentSearchHistories, id: \.self) { historyText in
                    HStack {
                        NavigationLink {
                            SearchResultView(searchText: historyText)
                        } label: {
                            Text(historyText)
                                .foregroundColor(.primary)
                        }
                        
                        Spacer()
                        
                        Button {
                            searchViewModel.removeRecentSearchHistory(historyText)
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
