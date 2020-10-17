//
//  NavigationItemContainer.swift
//  SwiftUINavigation
//
//  Created by Anna Zharkova on 07.09.2020.
//  Copyright © 2020 Anna Zharkova. All rights reserved.
//

import SwiftUI

protocol IItemView:View {
    var listener: INavigationContainer? {get set}
}


protocol INavigationContainer {
    
    func push<Content: View&IItemView>(view: Content)
    
    func pop()
    
    func popToRoot()
}


struct NavigationItemContainer<Content>: View , INavigationContainer where Content:View&IItemView{
    var viewModel = NavigationViewModel.shared
    //@EnvironmentObject var vm: NavigationViewModel
    
    @State var title: String = ""
    
    private var contentView: Content
    
    public init(content: Content, _ title: String = "") {
        self.contentView = content
        self.contentView.listener = self
    }
    
    var body: some View {
        return ZStack {
            self.contentView
        }.background(Color.white)
    }
    
    
    func push<Content: View&IItemView>(view: Content) {
        let item = NavigationItemContainer<Content>(content: view)
        self.viewModel.push(item.toAnyView())
    }
    
    func pop() {
        self.viewModel.pop()
    }
    
    func popToRoot() {
        self.viewModel.popToRoot()
    }
    
}
