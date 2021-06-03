//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import Foundation
import UIKit

//protocol ___VARIABLE_scene___ScenesFactory {
//    func make___VARIABLE_scene___DetailViewController() -> ___VARIABLE_scene___DetailViewController
//}
//
//@objc protocol ___VARIABLE_scene___ViewControllerDelegate {
//
//}

extension ___VARIABLE_scene___ {
    class ViewController: BaseVC {
        
        // MARK: - Properties
        let viewModel: ViewModel
        
        // MARK: - Initializer
        init(viewModel: ViewModel)
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
            viewModel.output.navigationScene
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
