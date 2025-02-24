//
//  File.swift
//  
//
//  Created by Yassin El Mouden on 19/03/2024.
//

import DesignSystem
import Foundation
import SnapshotTesting
import SwiftUI
import UIKit
import XCTest


public extension XCTestCase {
    class func configureSnapshotTest() {
        UINavigationBar.setupNavigationAppAppearance()

        SnapshotTesting.diffTool = "ksdiff"
    }

    func convertToViewControllerForSnapshotTesting(view: some View) -> UIViewController {
        let viewController = UIHostingController(rootView: view.transaction { $0.animation = nil })

        let window = UIWindow(frame: .init(origin: .zero, size: .init(width: 1, height: 1)))
        window.rootViewController = viewController
        window.makeKeyAndVisible()

        return viewController
    }
}
