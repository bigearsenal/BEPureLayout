//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import Foundation
import UIKit


//@objc protocol ___VARIABLE_scene___ViewControllerDelegate {
//
//}

extension ___VARIABLE_scene___ {
    class ViewController: BaseVC {
        
        // MARK: - Properties
        private let viewModel: ___VARIABLE_scene___ViewModelType
        
        // MARK: - Initializer
        init(viewModel: ___VARIABLE_scene___ViewModelType)
        {
            self.viewModel = viewModel
            super.init()
        }
        
        // MARK: - Methods
        override func loadView() {
            view = RootView(viewModel: viewModel)
        }
        
        override func setUp() {
            super.setUp()
            
        }
        
        override func bind() {
            super.bind()
            viewModel.navigationDriver
                .drive(onNext: {[weak self] in self?.navigate(to: $0)})
                .disposed(by: disposeBag)
        }
        
        // MARK: - Navigation
        private func navigate(to scene: NavigatableScene?) {
            switch scene {
            case .detail:
                break
            default:
                break
            }
        }
    }
}
