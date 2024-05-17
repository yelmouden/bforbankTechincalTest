//
//  SwiftUIView.swift
//  
//
//  Created by Yassin El Mouden on 16/05/2024.
//

import FlowStacks
import SwiftUI

enum Destination {
    case addBeneficiary
    case scan(Binding<String>)
}

public struct IBANCoordinator: View {
    @State private var routes: Routes<Destination> = [.root(.addBeneficiary, embedInNavigationView: true)]

    public init() {}
    
    public var body: some View {
        Router($routes) { screen, _ in
            switch screen {
            case .addBeneficiary:
                BeneficiaryAddView()
            case .scan(let binding):
                IBANScanView(selectedIban: binding)
            }
        }
    }
}

#Preview {
    IBANCoordinator()
}
