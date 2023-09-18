//
//  EampleView.swift
//  BuyLikeLion
//
//  Created by 김윤우 on 2023/09/18.
//

import SwiftUI

struct EampleView: View {
    
    @ObservedObject var myPageBookStore: MyPageBookStore = MyPageBookStore()
    
    var body: some View {
            
            List {
                ForEach(myPageBookStore.completedPurchase, id: \.id) { purchase in
                    NavigationLink {
                        PostCell()
                    } label: {
                        Text("dfda")
                    }
                    .contentShape(Rectangle())
                }
            
        }
        
    }
}

struct EampleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            EampleView()
        }
    }
}
