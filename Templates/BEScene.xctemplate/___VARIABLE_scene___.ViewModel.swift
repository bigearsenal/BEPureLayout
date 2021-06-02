//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import Foundation
import RxSwift
import RxCocoa

extension ___VARIABLE_scene___ {
    enum NavigatableScene {
        case detail
    }
    
    class ViewModel: ViewModelType {
        // MARK: - Nested type
        struct Input {
            
        }
        struct Output {
            let navigationScene: Driver<NavigatableScene>
        }
        
        // MARK: - Properties
        private let disposeBag = DisposeBag()
        
        let input: Input
        let output: Output
        
        // MARK: - Subject
        private let navigationSubject = PublishSubject<NavigatableScene>()
        
        // MARK: - Initializer
        init() {
            self.input = Input()
            self.output = Output(
                navigationScene: navigationSubject
                    .asDriver(onErrorJustReturn: .detail)
            )
            
            bind()
        }
        
        /// Bind subjects
        private func bind() {
            bindOutputIntoInput()
            bindSubjectsIntoSubjects()
        }
        
        private func bindOutputIntoInput() {
            
        }
        
        private func bindSubjectsIntoSubjects() {
            
        }
        
        // MARK: - Actions
        @objc func showDetail() {
            navigationSubject.onNext(.detail)
        }
    }
}
