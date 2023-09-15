//
//  PostCell.swift
//  BuyLikeLion
//
//  Created by 박채영 on 2023/09/15.
//

import SwiftUI

struct PostCell: View {
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: "https://image.yes24.com/goods/89421220/XL")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                    .cornerRadius(10)
                    .padding(5)
            } placeholder: {
                ProgressView()
            }
            
            VStack {
                VStack(alignment: .leading) {
                    Text("핵심만 골라 배우는 SwiftUI 기반의 iOS 프로그래밍")
                    Text("제이펍 | 닐 스미스 저 / 황반석 역")
                        .foregroundColor(Color.gray)
                }
                .multilineTextAlignment(.leading)
                
                Spacer()
                
                HStack {
                    Spacer()
                    Text("26,000원")
                }
            }
        }
        .padding()
        .frame(height: 150)
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell()
    }
}
