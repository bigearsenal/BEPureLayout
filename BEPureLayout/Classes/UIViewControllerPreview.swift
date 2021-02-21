//
//  UIViewControllerPreview.swift
//  BEPureLayout
//
//  Created by Chung Tran on 18/01/2021.
//

import Foundation
import SwiftUI

@available(iOS 13, *)
public struct UIViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {
    let viewController: ViewController

    public init(_ builder: @escaping () -> ViewController) {
        viewController = builder()
    }

    public func makeUIViewController(context: Context) -> ViewController { viewController }

    public func updateUIViewController(_ uiViewController: ViewController, context: Context) {}
}

@available(iOS 13, *)
public struct UIViewPreview<View: UIView>: UIViewRepresentable {
    let view: View

    public init(_ builder: @escaping () -> View) {
        view = builder()
    }
    
    public func makeUIView(context: Context) -> View {
        view
    }
    
    public func updateUIView(_ uiView: View, context: Context) {}
}
