//
//  Navigator.swift
//  NewsSwiftUI
//
//  Created by 1 on 16.02.2020.
//  Copyright © 2020 azharkova. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

class Navigator {
    private init(){}
    
    static let shared = Navigator()
    
    private weak var view: UIViewController?
    
    internal weak var nc: UINavigationController? {
        get {
            
            if  let scene = UIApplication.shared.connectedScenes.first,
                let sceneDelegate = scene as? UIWindowScene ,
                let rootVC = sceneDelegate.windows.first?.rootViewController {
                if rootVC is UINavigationController  {
                    return rootVC as? UINavigationController
                }else {
                    return rootVC.navigationController
                }
            }
            return self.view?.navigationController
        }
    }
        
        func setup(view: UIViewController) {
        self.view = view
        }
        
        
        internal func open<Content:View>(screen: Content.Type, _ data: Any? = nil) {
        if let vc = ModuleConfig.shared.config(screen: screen)?
        .createScreen(data) {
        self.nc?.pushViewController(vc, animated: true)
        }
        }
        
        internal func present<Content:View>(screen: Content.Type, _ data: Any? = nil) {
        if let vc = ModuleConfig.shared.config(screen: screen)?
        .createScreen(data) {
        nc?.present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
        }
        }
        
        internal func get<Content:View>(screen: Content.Type, _ data: Any? = nil)->UIViewController? {
        return ModuleConfig.shared.config(screen: screen)?.createScreen(data)
        }
        
        
        func setRootController(controller: UIViewController) {
        SceneDelegate.setupRoot(vc: controller)
        }
        
        func setRootController<Content:View>(screen: Content.Type) {
        if let vc = ModuleConfig.shared.config(screen: screen)?
        .createScreen(nil) {
        let nc = UINavigationController(rootViewController: vc)
        nc.isNavigationBarHidden = true
        setRootController(controller: nc)
        }
        }
        
        func back() {
        if (nc?.viewControllers.count == 1) {
        nc?.dismiss(animated: true, completion: nil)
        } else {
        nc?.popViewController(animated: true)
        }
        }
        
        
        func finish() {
        nc?.dismiss(animated: true, completion: nil)
        }
        
}
