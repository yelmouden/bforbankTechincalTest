//
//  File.swift
//  
//
//  Created by Yassin El Mouden on 19/02/2024.
//

import Foundation
import SwiftUI

struct PaddingBottomScreen: ViewModifier {
    @State var bottomSafeArea: CGFloat = 0

    func body(
        content: Content
    ) -> some View {
        content
            .overlay {
                GeometryReader { proxy in
                    Color.clear
                        .onAppear {
                            bottomSafeArea = proxy.safeAreaInsets.bottom
                        }
                }
                
            }
            .ignoresSafeArea(
                edges: .bottom
            )
            .padding(.bottom, bottomSafeArea == 0 ? 16 : bottomSafeArea + 16)
    }
}

public extension View {
    func paddingBottomScreen() -> some View {
        modifier(
            PaddingBottomScreen()
        )
    }
}
