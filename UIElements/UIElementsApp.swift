//
//  UIElementsApp.swift
//  UIElements
//
//  Created by JungHoon Noh on 2023/04/20.
//

import SwiftUI

@main
struct UIElementsApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                NavigationLink("Font Styles") {
                    FontStyleView()
                }
                
                NavigationLink("UIColor") {
                    UIColorView()
                }
            }
            
        }
    }
}
