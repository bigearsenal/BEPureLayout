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
    class ViewModel: ___VARIABLE_scene___ViewModelType {
        // MARK: - Dependencies
        
        // MARK: - Properties
        private let disposeBag = DisposeBag()
        
        // MARK: - Subject
        private let navigationSubject = BehaviorRelay<NavigatableScene?>(value: nil)
        
        // MARK: - Input
        
        // MARK: - Output
        var navigationDriver: Driver<SerumSwap.NavigatableScene?> {
            navigationSubject.asDriver()
        }
        
        // MARK: - Initializer
        init() {
        }
        
        /// Bind subjects
        private func bind() {
            
        }
        
        // MARK: - Actions
        @objc func showDetail() {
            navigationSubject.accept(.detail)
        }
    }
}
