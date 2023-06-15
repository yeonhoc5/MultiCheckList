//
//  TotoListView.swift
//  MultiCheckList
//
//  Created by yeonhoc5 on 2023/06/08.
//

import SwiftUI
import FirebaseRemoteConfig

struct TotoListView: View {
    let title: String

    @State var todoList: [TodoList]
    @State var id: Int = 0
    let remoteConfig = RemoteConfig.remoteConfig()
    
    var body: some View {
        VStack {
            Text(title)
            List(todoList) { list in
                HStack {
                    ZStack {
                        Image(systemName: "square")
                        if list.isDone {
                            Image(systemName: "checkmark")
                                .resizable()
                                .frame(width: 16, height: 17)
                                .foregroundColor(.red)
                                .fontWeight(.semibold)
                                .offset(x: 0, y: -4)
                                .background{
                                    Image(systemName: "checkmark")
                                        .resizable()
                                        .frame(width: 16, height: 17)
                                        .foregroundColor(.white)
                                        .fontWeight(.black)
                                        .offset(x: 0, y: -4)
                                }
                        }
                    }
                    Text(list.title)
                    Rectangle()
                        .foregroundColor(.white)
                }
                .onTapGesture {
                    id = list.id
                    withAnimation {
                        todoList[id].isDone.toggle()
                    }
                }
                .foregroundColor(.black)
                .listRowBackground(Color.white)
            }
        }
    }
}

//struct TotoListView_Previews: PreviewProvider {
//    static var previews: some View {
//        TotoListView(title: "To do List",todoList: sampleData1.todoList)
//    }
//}
