//
//  SwiftUIView.swift
//  
//
//  Created by Yassin El Mouden on 16/05/2024.
//

import DesignSystem
import FlowStacks
import SwiftUI
import VisionKit

struct IBANScanView: View {
    @EnvironmentObject var navigator: FlowNavigator<Destination>

    @State var showAlertCameraNotPermited = false

    @State var startScan = false
    @State var foundIBAN: String?
    @Binding var selectedIban: String

    var body: some View {
        MainContainer {
            ZStack(alignment: .bottom) {
                if DataScannerViewController.isSupported {
                    IBANScannerViewController(startScan: $startScan, foundIBAN: $foundIBAN)
                }

                VStack {
                    Text(.localizable.scanViewDescription)
                        .bold()
                        .foregroundStyle(DSColors.white.swiftUIColor)
                        .padding(.top, Margins.medium)
                    Spacer()
                }

                if let iban = foundIBAN {
                    ConfirmationIBANView(
                        iban: iban,
                        onValidate: {
                            selectedIban = iban
                            foundIBAN = nil

                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                self.navigator.goBack()
                            }
                        },
                        onRetry: {
                            startScan = true
                            foundIBAN = nil
                        }
                    )
                    .zIndex(2)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                }
            }
            .ignoresSafeArea(edges: .bottom)
        }
        .onAppear {
            startScan = true
            showAlertCameraNotPermited = !DataScannerViewController.isAvailable
        }
        .onDisappear {
            startScan = false
        }
        .addBackButton {
            navigator.goBack()
        }
        .animation(.bouncy, value: foundIBAN)
        .onChange(of: foundIBAN, { _, newValue in
            startScan = newValue == nil
        })
        .alert(isPresented: $showAlertCameraNotPermited) {
            Alert(
                title: Text(.localizable.scanAlertViewTitle),
                message: Text(.localizable.scanAlertViewDescription)
            )
        }
        .navigationTitle(String(localized: .localizable.scanViewTitle))
    }
}

#Preview {
    NavigationStack {
        IBANScanView(selectedIban: .init(get: { "" }, set: { _ in }))
    }.onAppear {
        UINavigationBar.setupNavigationAppAppearance()
    }
}
