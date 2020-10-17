//
//  MyApp.swift
//  SwiftUINavigation
//
//  Created by Anna Zharkova on 17.10.2020.
//  Copyright © 2020 Anna Zharkova. All rights reserved.
//

import Foundation
import SwiftUI

@main
struct MyApp : App {
    var body: some Scene {
        WindowGroup {
            NavigationContainerView(transition: .custom(.slide)) {
              FirstView()
            }
        }
    }
}
