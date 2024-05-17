//
//  SwiftUIView.swift
//  
//
//  Created by Yassin El Mouden on 16/05/2024.
//

import DesignSystem
import SwiftUI
import Utils

struct ConfirmationIBANView: View {

    let iban: String
    let onValidate: () -> Void
    let onRetry: () -> Void

    var body: some View {
        VStack {
            Text(.localizable.confirmationViewTitle)
                .foregroundStyle(DSColors.white.swiftUIColor)
                .font(.body)
                .bold()
                .padding(.bottom, Margins.verySmall)
            
            Text(.localizable.confirmationViewDescription)
                .foregroundStyle(DSColors.white.swiftUIColor)
                .font(.callout)

            Text(iban)
                .foregroundStyle(DSColors.white.swiftUIColor)
                .font(.body)
                .bold()
                .padding(.bottom, Margins.medium)

            Button(action: onValidate) {
                Text(.localizable.confirmationButtonValidateTitle)
                    .frame(maxWidth: .infinity)
                    .contentShape(Rectangle())
            }
            .buttonStyle(.primary)

            Button(action: onRetry) {
                Text(.localizable.confirmationButtonRetryTitle)
                    .frame(maxWidth: .infinity)
                    .contentShape(Rectangle())
            }
            .buttonStyle(.ghost)
        }
        .padding([.top, .leading, .trailing])
        .paddingBottomScreen()
        .frame(maxWidth: .infinity)
        .background(DSColors.background.swiftUIColor)
        .roundedCorner(CornerRadius.medium, corners: [.topLeft, .topRight])

    }
}

#Preview {
    ConfirmationIBANView(iban: "FR76 3000 3000 3000 1234 5678 901", onValidate: {}, onRetry: {})
}
