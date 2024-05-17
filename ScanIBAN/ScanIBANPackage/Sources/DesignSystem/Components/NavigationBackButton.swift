//
//  SwiftUIView.swift
//  
//
//  Created by Yassin El Mouden on 16/05/2024.
//

import SwiftUI

struct NavigationBackButton: ViewModifier {
    let action: () -> Void

    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: action, label: {
                        Image(systemName: "arrow.left")
                            .foregroundStyle(DSColors.teal.swiftUIColor)
                    })
                }
            }
    }
}

public extension View {
    func addBackButton(action: @escaping () -> Void) -> some View {
        modifier(NavigationBackButton(action: action))
    }
}
