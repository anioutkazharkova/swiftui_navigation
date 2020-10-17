//
//  ModuleConfig.swift
//  NewsSwiftUI
//
//  Created by 1 on 16.02.2020.
//  Copyright © 2020 azharkova. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

protocol IConfugator: class {
    func createScreen(_ data: Any?)->UIViewController
}

class ModuleConfig{
    private init(){}
    static let shared = ModuleConfig()
    
    func config<Content:View>(screen: Content.Type)->IConfugator? {
        /*if screen == NewsListView.self {
            return NewsListConfigurator.shared
        }
        if screen == NewsItemView.self {
            return NewsItemConfigurator.shared 
        }
        if screen == SearchView.self {
            return SearchConfigurator.shared
        }*/
        return nil
    }
}
