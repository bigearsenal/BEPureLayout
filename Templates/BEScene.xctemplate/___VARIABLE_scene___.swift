//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import Foundation
import RxCocoa

//protocol ___VARIABLE_scene___ScenesFactory {
//    func make___VARIABLE_scene___DetailViewController() -> ___VARIABLE_scene___DetailViewController
//}

protocol ___VARIABLE_scene___ViewModelType {
    var navigationDriver: Driver<___VARIABLE_scene___.NavigatableScene?> {get}
}

struct ___VARIABLE_scene___ {
    enum NavigatableScene {
        case detail
    }
}
