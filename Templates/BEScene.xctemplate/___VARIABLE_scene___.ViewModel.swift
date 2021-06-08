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
    class ViewModel: ViewModelType {
        // MARK: - Nested type
        struct Input {
            
        }
        struct Output {
            let navigationScene: Driver<NavigatableScene?>
        }
        
        // MARK: - Dependencies
        
        // MARK: - Properties
        private let disposeBag = DisposeBag()
        
        let input: Input
        let output: Output
        
        // MARK: - Subject
        private let navigationSubject = BehaviorRelay<NavigatableScene?>(value: nil)
        
        // MARK: - Initializer
        init() {
            self.input = Input()
            self.output = Output(
                navigationScene: navigationSubject
                    .asDriver(onErrorJustReturn: nil)
            )
            
            bind()
        }
        
        /// Bind subjects
        private func bind() {
            bindInputIntoSubjects()
            bindSubjectsIntoSubjects()
        }
        
        private func bindInputIntoSubjects() {
            
        }
        
        private func bindSubjectsIntoSubjects() {
            
        }
        
        // MARK: - Actions
        @objc func showDetail() {
            navigationSubject.accept(.detail)
        }
    }
}
