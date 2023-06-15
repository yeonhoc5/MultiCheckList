//
//  CompleteCheckList.swift
//  MultiCheckList
//
//  Created by yeonhoc5 on 2023/06/07.
//

import SwiftUI

struct CompleteCheckListView: View {
    let size: CGSize = CGSize(width: 120, height: 150)
    let color: Color
    let title: String
    let image: String
    
    var body: some View {
        VStack(spacing: 5) {
            ZStack {
                Circle()
                    .foregroundColor(color)
                Circle()
                    .foregroundColor(.white.opacity(0.7))
                Image(systemName: image)
                    .imageScale(.large)
                    .fontWeight(.semibold)
                    .foregroundColor(color)
            }
            .clipped()
            .frame(width: 40, height: 40)
            Text(title)
                .font(.system(size: 11))
        }
    }
}

struct CompleteCheckList_Previews: PreviewProvider {
    static var previews: some View {
        CompleteCheckListView(color: .yellow, title: "완료목록", image: "gear")
    }
}
