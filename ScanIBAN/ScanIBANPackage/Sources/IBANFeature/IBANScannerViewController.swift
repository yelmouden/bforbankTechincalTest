//
//  File.swift
//  
//
//  Created by Yassin El Mouden on 16/05/2024.
//

import DesignSystem
import SwiftUI
import UIKit
import Utils
import VisionKit

struct IBANScannerViewController: UIViewControllerRepresentable {
    enum Constant {
        static let heightIndicator = 50.0
        static let yOffsetIndicatorView = 30.0
    }

    @Binding var startScan: Bool
    @Binding var foundIBAN: String?

    var indicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.opacity = 0.6
        return view
    }()

    func makeUIViewController(context: Context) -> DataScannerViewController {
        let viewController = DataScannerViewController(
            recognizedDataTypes: [.text()],
            qualityLevel: .fast,
            isGuidanceEnabled: false
        )

        viewController.view.layer.cornerRadius = CornerRadius.medium
        viewController.view.layer.masksToBounds = true
        viewController.delegate = context.coordinator

        viewController.view.addSubview(indicatorView)

        return viewController
    }

    func updateUIViewController(_ viewController: DataScannerViewController, context: Context) {
        startScan ? try? viewController.startScanning() : viewController.stopScanning()
    }

    func sizeThatFits(_ proposal: ProposedViewSize, uiViewController: DataScannerViewController, context: Context) -> CGSize? {
        let width = proposal.width ?? 0
        let height = proposal.height ?? 0

        indicatorView.frame = .init(x: 0, y: 0, width: width, height: height)

        let frameRegionOfInterest: CGRect = .init(
            x: Margins.small,
            y: ((height - Constant.heightIndicator) / 2) - Constant.yOffsetIndicatorView,
            width: width - (Margins.small * 2),
            height: Constant.heightIndicator
        )

        uiViewController.regionOfInterest = frameRegionOfInterest
        indicatorView.displayRegionOfInterest(frame: frameRegionOfInterest)

        return .init(width: width, height: height)
    }

    func makeCoordinator() -> Coordinator {
        IBANScannerViewController.Coordinator(self)
    }
}

extension IBANScannerViewController {
    class Coordinator: NSObject, DataScannerViewControllerDelegate {
        var parent: IBANScannerViewController

        init(_ parent: IBANScannerViewController) {
            self.parent = parent
        }

        func dataScanner(_ dataScanner: DataScannerViewController, didAdd addedItems: [RecognizedItem], allItems: [RecognizedItem]) {
            if let item = allItems.last {
                switch item {
                case .text(let recognizedText):
                    if recognizedText.transcript.isValidFrenchIBAN {
                        parent.foundIBAN = recognizedText.transcript
                    }
                default: break
                }
            }
        }
    }
}

extension UIView {
    func displayRegionOfInterest(frame: CGRect) {
        let entireViewPath = UIBezierPath(rect: self.bounds)
        let roundedRectPath = UIBezierPath(
            roundedRect: frame,
            byRoundingCorners: .allCorners,
            cornerRadii: CGSize(width: 16.0, height: 16.0)
        )
        entireViewPath.append(roundedRectPath)
        entireViewPath.usesEvenOddFillRule = true

        let maskLayer = CAShapeLayer()
        maskLayer.path = entireViewPath.cgPath
        maskLayer.fillRule = CAShapeLayerFillRule.evenOdd
        maskLayer.fillColor = UIColor.black.cgColor
        layer.mask = maskLayer
    }
}
