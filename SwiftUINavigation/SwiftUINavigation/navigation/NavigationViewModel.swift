//
//  NavigationModel.swift
//  SwiftUINavigation
//
//  Created by Anna Zharkova on 06.09.2020.
//  Copyright © 2020 Anna Zharkova. All rights reserved.
//

import Foundation
import SwiftUI

class NavigationViewModel: ObservableObject {
    static var shared = NavigationViewModel()
    
    
    @Published var currentScreen: Screen?
    var navigationType: NavigationType = .push
    
    private var screenStack = NavigationStack() {
        didSet {
            currentScreen = screenStack.top()
        }
    }
    
    
    
    func push(_ screenView: AnyView) {
        self.navigationType = .push
        let screen = Screen(screenView: screenView)
        screenStack.push(screen)
        
    }
    
    func pop() {
        self.navigationType = .pop
        screenStack.popToPrevious()
    }
    
    func popToRoot() {
        self.navigationType = .popToRoot
        screenStack.popToRoot()
    }
    
}
