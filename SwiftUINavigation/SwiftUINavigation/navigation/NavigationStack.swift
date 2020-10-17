//
//  NavigationStack.swift
//  SwiftUINavigation
//
//  Created by Anna Zharkova on 06.09.2020.
//  Copyright © 2020 Anna Zharkova. All rights reserved.
//

import Foundation

struct NavigationStack {
    
    private var screens = [Screen]()
    
    func top() -> Screen? {
        self.screens.last
    }
    
    mutating func push(_ s: Screen) {
        self.screens.append(s)
    }
    
    mutating func popToPrevious() {
        _ = self.screens.popLast()
    }
    
    mutating func popToRoot() {
        self.screens.removeAll()
    }
}
