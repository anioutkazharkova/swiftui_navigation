//
//  ContentView.swift
//  SwiftUINavigation
//
//  Created by Anna Zharkova on 06.09.2020.
//  Copyright © 2020 Anna Zharkova. All rights reserved.
//

import SwiftUI


struct FirstView:  View, IItemView {
    var listener: INavigationContainer?
    var body: some View {
        VStack {
            Text("FirstView")
            Button(action: {
                self.listener?.push(view:SecondView())
            }) { Text("To second")
            }
        }.onAppear {
            print("Appear first")
        }.onDisappear {
            print("Disappear first")
        }
    }
}

struct SecondView:  View,IItemView {
    var listener: INavigationContainer?
    
    var body: some View {
        VStack {
            Text("SecondView")
            Button(action: {
                self.listener?.push(view: ThirdView())
            }) { Text("To third")
            }
            Button(action: {
                self.listener?.pop()
            }) { Text("back")
            }
        }.onAppear {
            print("Appear sec")
        }.onDisappear {
            print("Disappear sec")
        }
    }
}

struct ThirdView:  View,IItemView {
    var listener: INavigationContainer?
    
    var body: some View {
        VStack {
            Text("ThirdView")
            Button(action: {
                self.listener?.pop()
            }) { Text("To second")
            }
            Button(action: {
                self.listener?.popToRoot()
            }) { Text("To root")
            }
        }.onAppear {
            print("Appear third")
        }.onDisappear {
            print("Disappear third")
        }
    }
}
