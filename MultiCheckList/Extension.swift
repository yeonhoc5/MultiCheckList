//
//  Extension.swift
//  MultiCheckList
//
//  Created by yeonhoc5 on 2023/06/08.
//

import Foundation
import SwiftUI

struct ScaleEffect: ButtonStyle {

    var scale: CGFloat = 0.95
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scale : 1)
    }
    
    
}
