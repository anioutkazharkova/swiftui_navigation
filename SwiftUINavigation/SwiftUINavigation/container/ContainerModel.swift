//
//  ContainerModel.swift
//  SwiftUINavigation
//
//  Created by Anna Zharkova on 06.09.2020.
//  Copyright © 2020 Anna Zharkova. All rights reserved.
//

import Foundation
import Combine


class ContainerModel:ObservableObject {
    @Published var hasError: Bool = false
    @Published var errorText: String = ""
    @Published var isLoading: Bool = false
    
    func setupError(error: String){
           self.errorText = error
           if (!error.isEmpty) {
               self.hasError = true
           }
       }
    
    func errorShown() {
        self.hasError = false
        self.errorText = ""
    }
    
    func showLoading() {
        self.isLoading = true
    }
    
    func hideLoading() {
        self.isLoading = false
    }
   
}
