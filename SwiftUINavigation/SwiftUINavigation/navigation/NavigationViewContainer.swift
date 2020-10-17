//
//  NavigationViewContainer.swift
//  SwiftUINavigation
//
//  Created by Anna Zharkova on 06.09.2020.
//  Copyright © 2020 Anna Zharkova. All rights reserved.
//

import Foundation
import SwiftUI

enum Transition {
    case none
    case custom(AnyTransition)
}

enum NavigationType {
    case push
    case pop
    case popToRoot
}


struct NavigationContainerView<Content>: View where Content: View&IItemView{
   @ObservedObject private var viewModel: NavigationViewModel = NavigationViewModel.shared
    private let animation: Animation = .easeOut(duration: 0.33)
    private let content:  NavigationItemContainer<Content>
    private let transition: (push: AnyTransition, pop: AnyTransition)
    
    init(transition: Transition, @ViewBuilder content: @escaping () -> Content) {
        self.content = NavigationItemContainer(content: content())
        switch transition {
        case .custom(let transition):
            self.transition = (transition, transition)
        case .none:
            self.transition = (.identity, .identity)
        }
    }
    
    var body: some View {
        let isRoot = viewModel.currentScreen == nil
        return ZStack {
            if isRoot {
            content
               // .environmentObject(self.viewModel)
                    .animation(self.animation)
                    .transition(viewModel.navigationType == .push ? transition.push : transition.pop)
            } else {
                viewModel.currentScreen?.screenView
                    //.environmentObject(viewModel)
                    .animation(self.animation)
                    .transition(viewModel.navigationType == .push ? transition.push : transition.pop)
                
            }
        }
    }
    
    
}
