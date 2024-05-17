//
//  SwiftUIView.swift
//  
//
//  Created by Yassin El Mouden on 16/05/2024.
//

import SwiftUI

public struct MainContainer<Content: View>: View {

    private let content: Content

    public init(@ViewBuilder contentView: @escaping () -> Content) {
        self.content = contentView()
    }

    public var body: some View {
        ZStack {
            DSColors.background.swiftUIColor
                .ignoresSafeArea()
            content
        }
    }
}

#Preview {
    MainContainer {
        VStack {

        }
    }
}
