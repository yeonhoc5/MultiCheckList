//
//  LogInView.swift
//  MultiCheckList
//
//  Created by yeonhoc5 on 2023/06/11.
//

import SwiftUI

struct LogInView: View {
    var body: some View {
        VStack {
            Text("로그인에 사용할 id를 선택해주세요.")
            VStack(spacing: 20) {
                HStack(spacing: 20) {
                    rectangleView(view: nameView(image: "logo_apple"), color: .black)
                    rectangleView(view: nameView("N"), color: .green)
                }
                HStack(spacing: 20) {
                    rectangleView(view: nameView(image: "logo_kakao"), color: .yellow)
                    rectangleView(view: nameView(image: "logo_google", color: .black), color: .white)
                }
            }
            .shadow(color: .primary.opacity(0.2), radius: 7, x: 0, y: 0)
            .padding([.horizontal, .top], 20)
            .padding(.bottom, 30)
            Text("google로 로그인한 이력이 있습니다.")
                .padding(.bottom, 50)
        }
    }
}

extension LogInView {
    
    func rectangleView(view: some View, color: Color) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(color)
            view
        }
    }
    
    @ViewBuilder
    func nameView(_ text: String! = nil, image: String! = nil, color: Color = .white) -> some View {
        if text != nil {
            Text(text)
                .font(.system(size: 60, weight: .black, design: .default))
                .foregroundColor(color)
        } else {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 80)
        }
    }
    
}


struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}


