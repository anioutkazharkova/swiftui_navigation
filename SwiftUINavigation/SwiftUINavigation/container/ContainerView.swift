//
//  ContainerView.swift
//  SwiftUINavigation
//
//  Created by Anna Zharkova on 06.09.2020.
//  Copyright © 2020 Anna Zharkova. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct ContainerView<Content>: IContainer, View where Content: View&IModelView {
    @ObservedObject var containerModel = ContainerModel()
    private var content: Content

    public init(content: Content) {
        self.content = content
        self.content.viewModel?.listener = self
    }

    var body : some View {
        ZStack {
            content
            if (self.containerModel.isLoading) {
                LoaderView()
            }
        }.alert(isPresented: $containerModel.hasError){
            Alert(title: Text(""), message: Text(containerModel.errorText), dismissButton: .default(Text("OK")){
                self.containerModel.errorShown()
                })
        }
    }
    
    func showError(error: String) {
        self.containerModel.setupError(error: error)
    }
    
    func showLoading() {
        self.containerModel.showLoading()
    }
    
    func hideLoading() {
        self.containerModel.hideLoading()
    }
}
