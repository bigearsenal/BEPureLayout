//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import Foundation
import RxSwift
import RxCocoa

enum ___VARIABLE_scene___NavigatableScene {
     case detail
}

extension ___VARIABLE_scene___ {
    class ViewModel: ViewModelType {
        // MARK: - Nested type
        struct Input {
            
        }
        struct Output {
             let navigationScene: Driver<___VARIABLE_scene___NavigatableScene>
        }
        
        // MARK: - Properties
        private let disposeBag = DisposeBag()
        
        let input: Input
        let output: Output
        
        // MARK: - Subject
         private let navigationSubject = PublishSubject<___VARIABLE_scene___NavigatableScene>()
        
        // MARK: - Initializer
        init() {
            self.input = Input()
            self.output = Output(
                 navigationScene: navigationSubject.asDriver(onErrorJustReturn: .detail)
            )
            
            bind()
        }
        
        /// Bind output into input
        private func bind() {
            
        }
        
        // MARK: - Actions
        @objc func showDetail() {
            navigationSubject.onNext(.detail)
        }
    }
}
