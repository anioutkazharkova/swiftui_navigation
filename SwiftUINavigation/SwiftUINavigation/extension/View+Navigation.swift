//
//  View+Navigation.swift
//  SwiftUINavigation
//
//  Created by Anna Zharkova on 07.09.2020.
//  Copyright © 2020 Anna Zharkova. All rights reserved.
//

import Foundation
import SwiftUI

protocol INavigationItemView {
    func push(view: AnyView)
    
    func pop()
    
    func popToRoot()
}

