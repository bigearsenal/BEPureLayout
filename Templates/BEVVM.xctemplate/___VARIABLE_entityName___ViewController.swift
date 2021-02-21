//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import Foundation
import UIKit

class ___VARIABLE_entityName___ViewController: ___VARIABLE_baseClass___ {
    
    // MARK: - Properties
    let viewModel: ___VARIABLE_entityName___ViewModel
    
    // MARK: - Initializer
    init(viewModel: ___VARIABLE_entityName___ViewModel)
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
        viewModel.navigationSubject
            .subscribe(onNext: {self.navigate(to: $0)})
            .disposed(by: disposeBag)
    }
    
    // MARK: - Navigation
    private func navigate(to scene: ___VARIABLE_entityName___NavigatableScene) {
        switch scene {
        
        }
    }
}
