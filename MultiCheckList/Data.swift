//
//  Data.swift
//  MultiCheckList
//
//  Created by yeonhoc5 on 2023/06/05.
//

import Foundation
import SwiftUI


struct SectionList: Identifiable {
    var id: Int
    var title: String
    var checkList: [CheckList]
    var color: Color = .gray
}

struct CheckList: Identifiable {
    
    var id: Int
    
    var title: String
    var isDone: Bool = false
    var todoList: [TodoList]
    var inSequence: Bool = false
}

struct TodoList: Identifiable {
    var id: Int
    
    var title: String
    var isDone: Bool = false
    var person: Person?
}

struct Person {
    var name: String
}

let screenSize = (UIApplication.shared.connectedScenes.first as! UIWindowScene).screen.bounds.size

let sampleData1 = CheckList(id: 0, title: "오키나와 준비", todoList: [
    TodoList(id: 0, title: "준비할 것 1", isDone: true),
    TodoList(id: 1, title: "준비할 것 2"),
    TodoList(id: 2, title: "준비할 것 3"),
    TodoList(id: 3, title: "준비할 것 4"),
    TodoList(id: 4, title: "준비할 것 5", isDone: true)
])

let sampleData2 = CheckList(id: 1, title: "토레스 준비", todoList: [
    TodoList(id: 0, title: "보험 가입", isDone: true),
    TodoList(id: 1, title: "저공해차량 등록", isDone: true),
    TodoList(id: 2, title: "이것저것 시공", isDone: true)
])

let sampleData3 = CheckList(id: 2, title: "포트폴리오를 해야 지원을 하지", todoList: [
    TodoList(id: 0, title: "product"),
    TodoList(id: 1, title: "product"),
    TodoList(id: 2, title: "product"),
    TodoList(id: 3, title: "product"),
    TodoList(id: 4, title: "product"),
    TodoList(id: 5, title: "product"),
    TodoList(id: 6, title: "product"),
    TodoList(id: 7, title: "product"),
    TodoList(id: 8, title: "product"),
    TodoList(id: 9, title: "product"),
    TodoList(id: 10, title: "product"),
    TodoList(id: 11, title: "product"),
    TodoList(id: 12, title: "product"),
    TodoList(id: 13, title: "sentence")
])




let sampleList: [SectionList] = [
    SectionList(id: 0, title: "개인", checkList: [
        sampleData1, sampleData2
    ], color: .yellow),
    SectionList(id: 1, title: "업무", checkList: [
        sampleData3
    ], color: .teal)
]
