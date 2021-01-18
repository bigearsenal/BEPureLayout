//
//  UIViewControllerPreview.swift
//  BEPureLayout
//
//  Created by Chung Tran on 18/01/2021.
//

import Foundation
import SwiftUI

@available(iOS 13, *)
struct UIViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {
    let viewController: ViewController

    init(_ builder: @escaping () -> ViewController) {
        viewController = builder()
    }

    func makeUIViewController(context: Context) -> ViewController { viewController }

    func updateUIViewController(_ uiViewController: ViewController, context: Context) {}
}
