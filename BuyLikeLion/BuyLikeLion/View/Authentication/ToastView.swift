//
//  ToastView.swift
//  BuyLikeLion
//
//  Created by 박찬호 on 2023/09/17.
//

import SwiftUI

struct ToastView: View {
    var message: String

    var body: some View {
        Text(message)
            .padding()
            .background(Color.black.opacity(0.7))
            .foregroundColor(.white)
            .cornerRadius(8)
            .frame(width: UIScreen.main.bounds.width - 40, height: 60)
            .offset(y: UIScreen.main.bounds.height / 2 - 100)
    }
}

struct ToastView_Previews: PreviewProvider {
    static var previews: some View {
        ToastView(message: "토스트 메시지 테스트")
    }
}
