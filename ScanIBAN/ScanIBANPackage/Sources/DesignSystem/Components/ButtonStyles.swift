//
//  SwiftUIView.swift
//  
//
//  Created by Yassin El Mouden on 16/05/2024.
//

import SwiftUI

public struct GhostButtonStyle: ButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(DSColors.teal.swiftUIColor)
            .background(
                RoundedRectangle(
                    cornerRadius: CornerRadius.extraLarge,
                    style: .continuous
                )
                .stroke(DSColors.teal.swiftUIColor, lineWidth: 2)

            )
    }
}

public extension ButtonStyle where Self == GhostButtonStyle {
    static var ghost: GhostButtonStyle { .init() }
}

public struct PrimaryButtonStyle: ButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(DSColors.white.swiftUIColor)
            .background(
                RoundedRectangle(
                    cornerRadius: CornerRadius.extraLarge,
                    style: .continuous
                )
                .fill(DSColors.teal.swiftUIColor)

            )
    }
}

public extension ButtonStyle where Self == PrimaryButtonStyle {
    static var primary: PrimaryButtonStyle { .init() }

}

#Preview {
    Group {
        Button(action: {

        }, label: {
            HStack {
                Text("Button")
            }
        })
        .buttonStyle(.ghost)

        Button(action: {

        }, label: {
            HStack {
                Text("Button")
            }
        })
        .buttonStyle(.primary)
    }

}
