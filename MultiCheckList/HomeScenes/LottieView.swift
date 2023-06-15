//
//  LottieView.swift
//  MultiCheckList
//
//  Created by yeonhoc5 on 2023/06/06.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    
    let animationView = LottieAnimationView()
    let fileName: String
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView()
        
        animationView.animation = LottieAnimation.named(fileName)
        view.addSubview(animationView)
        
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
//        animationView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
//        animationView.frame = view.bounds
        
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        return view
    }
    
    
    
    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<LottieView>) {
        
    }
    
}
