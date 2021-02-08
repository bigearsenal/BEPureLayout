//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import Foundation
import UIKit
import SwiftUI

class ___VARIABLE_entityName___ViewController: ___VARIABLE_baseClass___ {
    
    // MARK: - Properties
    let viewModel: ___VARIABLE_entityName___ViewModel
    
    // MARK: - Subviews
    
    // MARK: - Initializer
    init(viewModel: ___VARIABLE_entityName___ViewModel = ___VARIABLE_entityName___ViewModel())
    {
        self.viewModel = viewModel
        super.init()
    }
    
    // MARK: - Methods
    override func loadView() {
        view = ___VARIABLE_entityName___RootView(viewModel: viewModel)
    }
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func bind() {
        super.bind()
        
    }
    
    // MARK: - Helpers
}

@available(iOS 13, *)
struct ___VARIABLE_entityName___ViewController_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UIViewControllerPreview {
                ___VARIABLE_entityName___ViewController()
            }
            .previewDevice("iPhone SE (2nd generation)")
        }
    }
}
