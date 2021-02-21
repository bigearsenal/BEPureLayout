//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit
//import SwiftUI

class ___VARIABLE_entityName___RootView: BEView {
    // MARK: - Constants
    
    // MARK: - Properties
    let viewModel: ___VARIABLE_entityName___ViewModel
    
    // MARK: - Subviews
    
    // MARK: - Initializers
    init(viewModel: ___VARIABLE_entityName___ViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
    }
    
    // MARK: - Methods
    override func commonInit() {
        super.commonInit()
        layout()
        bind()
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        
    }
    
    // MARK: - Layout
    private func layout() {
        
    }
    
    private func bind() {
        
    }
}

//@available(iOS 13, *)
//struct ___VARIABLE_entityName___ViewController_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            UIViewPreview {
//                ___VARIABLE_entityName___RootView(viewModel: ___VARIABLE_entityName___ViewModel())
//            }
//            .previewDevice("iPhone SE (2nd generation)")
//        }
//    }
//}
