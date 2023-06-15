//
//  HomeView.swift
//  MultiCheckList
//
//  Created by yeonhoc5 on 2023/06/05.
//

import SwiftUI


struct HomeView: View {
    @StateObject var viewModel = ViewModel()
    let myList: [SectionList] = sampleList
    @State var isAdding: Bool = false
    @State var sectionToAdd: String = ""
    @FocusState var isFocused: Bool
    @State var selection: Int = 0
    @State var isSectionEdit: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 10) {
                    lottieAnimationView
                        .frame(height: 100)
                    ForEach(myList) { list in
                        eachSectionView(list: list)
                    }
                }
            }
            .onTapGesture {
                turnOffAddSection()
            }
            .overlay(alignment: .bottomLeading) {
                addSectionButton
            }
            .navigationTitle("멀티 체크리스트")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        LogInView()
                    } label: {
                        Text("LogIn")
                    }
                }
            }
        }
        .alert("\(viewModel.title)", isPresented: $viewModel.isShowingAlert) {
            Button("눌러") {
                viewModel.isShowingAlert = false
            }
            Button("싫어?") {
            }
        } message: {
            Text("\(viewModel.message)")
        }
    }
}


extension HomeView {
    
    func eachSectionView(list: SectionList) -> some View {
        VStack(alignment: .leading) {
            sectionView(section: list)
                .padding(.horizontal, 10)
            if isSectionEdit {
                sectionEditView
            }
            checkListView(color: list.color, checkList: list.checkList)
                .padding(.bottom, 10)
                .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 0)
        }
    }
    
    var sectionEditView: some View {
        VStack {
            HStack {
                Text("섹션명 : ")
                Rectangle()
            }
            Text("컬러 :")
        }
    }
    
    var lottieAnimationView: some View {
        let lottieView1 = LottieView(fileName: "checkList")
        let lottieView2 = LottieView(fileName: "stamp")
        return TabView(selection: $selection) {
            lottieView1
                .tag(0)
                .onAppear {
                    lottieView1.animationView.play { finished in
                        if finished {
                            withAnimation {
                                selection = 1
                            }
                        }
                    }
                }
            lottieView2
                .tag(1)
                .onAppear {
                    lottieView2.animationView.play { finished in
                        if finished {
                            withAnimation {
                                selection = 0
                            }
                        }
                    }
                }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
    
    func sectionView(section: SectionList) -> some View {
        HStack(spacing: 20) {
            Image(systemName: "triangle.fill")
                .rotationEffect(.degrees(90))
            Text(section.title)
                .frame(height: 20)
            Spacer()
            Button {
            } label: {
                Image(systemName: "tray.full.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(section.color)
            }
            Button {
            } label: {
                Image(systemName: "gear")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(section.color)
            }
            Button {
            } label: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 18)
                    .foregroundColor(section.color)
            }
        }
    }
    
    func checkListView(color: Color, checkList: [CheckList]) -> some View {
        let row = Array(repeating: GridItem(.flexible(), spacing: 20, alignment: .center), count: 1)
        return ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: row, alignment: .center, spacing: 10, pinnedViews: .sectionHeaders) {
                ForEach(checkList) { list in
                    NavigationLink {
                        TotoListView(title: list.title, todoList: list.todoList)
                    } label: {
                        CheckListView(color: color, checkList: list)
                    }
                    .buttonStyle(ScaleEffect(scale: 0.95))
                }
            }
            .padding(.horizontal, 10)
        }
        .frame(height: 160)
        
    }
    
    var addSectionButton: some View {
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.white)
                .frame(width: isAdding ? screenSize.width - 60 : 50, height: 50)
                .shadow(color: .primary.opacity(0.6), radius: 3, x: 0, y: 0)
                .onTapGesture {
                    if !isAdding {
                        withAnimation(.easeInOut(duration: 0.45)) {
                            isAdding = true
                            isFocused = true
                        }
                    }
                }
            HStack {
                if isAdding {
                    TextField("추가할 섹션 이름을 입력하세요.", text: $sectionToAdd, axis: .horizontal)
                        .focused($isFocused)
                        .foregroundColor(.black)
                    
                }
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(isAdding ? .blue : .gray)
            }
            .padding(.horizontal, 20)
        }
        .frame(width: isAdding ? screenSize.width - 60 : 50, height: 50)
        .padding(.leading, 30)
        .padding(.bottom, isAdding ? 20 : 0)
    }
    
    func turnOffAddSection() {
        if isAdding {
            withAnimation {
                isAdding = false
            }
        }
    }
    
}




struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
