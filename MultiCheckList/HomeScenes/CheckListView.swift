//
//  CheckListView.swift
//  MultiCheckList
//
//  Created by yeonhoc5 on 2023/06/06.
//

import SwiftUI
import PieChart

struct CheckListView: View {
    var color: Color
    var checkList: CheckList
    let size: CGSize = CGSize(width: 120, height: 150)
    
    var body: some View {
        let total = checkList.todoList.count
        let doneCount = checkList.todoList.filter{ $0.isDone }.count
        return ZStack(alignment: .bottom) {
            backgroundCardView
            chartView(total: total)
                .overlay {
                    fractionalView(total: total, doneCount: doneCount)
                }
                .padding(.top, 40)
                .padding(.bottom, 5)
            if doneCount == total {
                completeView
            }
        }
        .frame(width: size.width, height: size.height)
        .overlay(alignment: .topLeading) {
            titleView(total: total, doneCount: doneCount)
        }
    }
}

extension CheckListView {
    
    var backgroundCardView: some View {
        RoundedRectangle(cornerRadius: 5)
            .foregroundColor(color)
    }
    
    func fractionalView(total: Int, doneCount: Int) -> some View {
        VStack {
            Text("\(doneCount)")
                .offset(CGSize(width: -10, height: 15))
            Text("/")
                .rotationEffect(.radians(1/3))
                .font(.system(size: 20))
            Text("\(total)")
                .offset(CGSize(width: 10, height: -15))
        }
        .font(.system(size: 15))
        .fontWeight(.ultraLight)
    }
    
    func chartView(total: Int) -> some View {
        PieChart(values: Array(repeating: 1, count: total),
                 colors: checkList.todoList.map {$0.isDone ? .red.opacity(0.5) : .white},
                 backgroundColor: color,
                 config: Config(space: checkList.todoList.count <= 5 ? 0.3 : 0, hole: 0.6, pieSizeRatio: 0.9))
        .cornerRadius(5)
    }
    
    var completeView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(.white.opacity(0.7))
            VStack(spacing: 5) {
                Text("mission")
                Text("Complete!")
            }
            .foregroundColor(.black)
            .bold()
            .rotationEffect(.degrees(-20))
            .offset(CGSize(width: 0, height: 15))
        }
    }
    
    func titleView(total: Int, doneCount: Int) -> some View {
        HStack {
            Text(checkList.title)
                .lineLimit(2, reservesSpace: true)
                .multilineTextAlignment(.leading)
                .bold()
                .foregroundColor(total == doneCount ? .black : .white)
                .padding([.leading, .top], 5)
        }
    }
    
}

//struct CheckListView_Previews: PreviewProvider {
//    static var previews: some View {
//        CheckListView(color: .yellow, checkList: sampleData2)
//    }
//}
