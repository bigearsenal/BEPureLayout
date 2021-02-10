//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit
import RxSwift
import RxCocoa

enum ___VARIABLE_entityName___NavigatableScene {
//    case detail
}

struct ___VARIABLE_entityName___ViewModel {
    // MARK: - Constants
    
    // MARK: - Properties
    let bag = DisposeBag()
    
    // MARK: - Subjects
    let navigationSubject = PublishSubject<___VARIABLE_entityName___NavigatableScene>()
    
    // MARK: - Input
//    let textFieldInput = BehaviorRelay<String?>(value: nil)
    
    // MARK: - Initializer
    init() {
        bind()
    }
    
    // MARK: - Binding
    func bind() {
        
    }
    
    // MARK: - Actions
//    @objc func showDetail() {
//        
//    }
}
