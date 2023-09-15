//
//  ImageAddView.swift
//  BuyLikeLion
//
//  Created by 박형환 on 2023/09/15.
//

import UIKit
import SwiftUI


struct ImageAddView: View {
    
    private let placeColor: Color = Color.init(UIColor.placeholderText)
    private let titleImageBack: Color = Color.init(UIColor.lightGray).opacity(0.4)
    
    private let imageWidth: CGFloat = UIScreen.main.bounds.width / 2 - 50
    private var imageHeight: CGFloat {
        imageWidth
    }
    private var images: [Image] = [Image(systemName: "person"),Image(systemName: "person"),Image(systemName: "person")]
    
    var action: () -> ()
    
    init(action: @escaping () -> Void) {
        self.action = action
    }
    
    var body: some View {
        HStack {
            imageAddView
                .frame(width: imageWidth,
                       height: imageHeight, alignment: .center)
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(titleImageBack)
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 5)
                .padding(.leading, 10)
                .onTapGesture {
                    action()
                }
            
            ForEach(0..<images.count, id: \.self) { index in
               postImageView(image: images[index])
                    .resizable()
                    .frame(width: imageWidth,
                           height: imageHeight, alignment: .center)
                    .overlay {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(titleImageBack)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 5)
            }
        }
    }
    
    private var imageAddView: some View {
        VStack {
            Image(systemName: "plus")
                .tint(placeColor)
            
            Text("사진 추가")
                .bold()
                .foregroundColor(placeColor)
        }
    }
    
    @ViewBuilder
    private func postImageView(image: Image) -> Image {
        image
    }
}
