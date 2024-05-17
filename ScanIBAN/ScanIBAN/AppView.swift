//
//  ContentView.swift
//  ScanIBAN
//
//  Created by Yassin El Mouden on 16/05/2024.
//

import IBANFeature
import SwiftUI

struct AppView: View {
    init() {
        UINavigationBar.setupNavigationAppAppearance()
    }

    var body: some View {
        IBANCoordinator()
    }
}

#Preview {
    AppView()
}
