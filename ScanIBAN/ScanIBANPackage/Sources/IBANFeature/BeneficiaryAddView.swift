//
//  SwiftUIView.swift
//  
//
//  Created by Yassin El Mouden on 16/05/2024.
//

import DesignSystem
import FlowStacks
import SwiftUI

struct BeneficiaryAddView: View {
    @EnvironmentObject var navigator: FlowNavigator<Destination>

    @State var textIBAN: String = ""
    
    var body: some View {
        MainContainer {
            HStack {
                VStack(alignment: .leading, spacing: Margins.medium) {
                    Text(.localizable.addBeneficiaryViewTitle)
                        .foregroundStyle(DSColors.white.swiftUIColor)

                    HStack {
                        Spacer()

                        Button(action: {
                            navigator.push(.scan($textIBAN))
                        }, label: {
                            HStack {
                                Image(systemName: "camera")
                                Text(.localizable.addBeneficiaryButtonScanTitle)
                            }
                            .frame(maxWidth: .infinity)
                            .contentShape(Rectangle())

                        })
                        .accessibilityIdentifier("scan")
                        .buttonStyle(.ghost)

                        Spacer()
                    }

                    TextField(
                        "",
                        text: $textIBAN,
                        prompt: Text("FR76 XXXX")
                            .foregroundColor(DSColors.white.swiftUIColor.opacity(0.6))
                    )
                    .frame(height: 50)
                    .tint(DSColors.white.swiftUIColor)
                    .foregroundColor(DSColors.white.swiftUIColor)
                    .padding([.leading, .trailing], Margins.small)
                    .background(
                        RoundedRectangle(cornerRadius: CornerRadius.small)
                            .stroke(
                                textIBAN.isValidFrenchIBAN ? Color.green : Color.clear,
                                lineWidth: 1
                            )
                        .fill(Color.white.opacity(0.1))
                    )
                    .overlay {
                        VStack {
                            Spacer()
                            Rectangle()
                                .fill(DSColors.white.swiftUIColor.opacity(0.4))
                                .frame(height: 2)
                        }
                        .padding([.leading, .trailing], Margins.small)
                        .padding(.bottom, Margins.verySmall)
                    }

                    Spacer()

                }

                Spacer()
            }
            .padding(Margins.medium)

        }
        .navigationTitle(String(localized: .localizable.addBeneficiaryNavigationViewTitle))
    }
}

#Preview {
    NavigationStack {
        BeneficiaryAddView()
    }.onAppear {
        UINavigationBar.setupNavigationAppAppearance()
    }
}
