//
//  File.swift
//  
//
//  Created by Yassin El Mouden on 16/05/2024.
//

import Foundation
import UIKit

public extension UINavigationBar {
    static func setupNavigationAppAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = DSColors.background.color

        let uiTitleColor = DSColors.white.color
        appearance.largeTitleTextAttributes = [.foregroundColor: uiTitleColor]
        appearance.titleTextAttributes = [.foregroundColor: uiTitleColor]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}
