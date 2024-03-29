//
//  BEStackViewBuilder.swift
//  BEPureLayout
//
//  Created by Chung Tran on 27/04/2021.
//

import Foundation

@resultBuilder
public struct BEStackViewBuilder {
    public typealias Expression = BEStackViewElement
    
    public typealias Component = [BEStackViewElement]
    
    public static func buildExpression(_ expression: Expression) -> Component {
        [expression]
    }
    
    public static func buildBlock(_ component: Component) -> Component {
        component
    }
    
    public static func buildBlock(_ components: Component...) -> Component {
        components.flatMap { $0 }
    }
    
    public static func buildOptional(_ component: Component?) -> Component {
        (component ?? [])
    }
    
    public static func buildEither(first component: Component) -> Component {
        component
    }
    
    public static func buildEither(second component: Component) -> Component {
        component
    }
    
    public static func buildArray(_ components: [Component]) -> Component {
        components.flatMap { $0 }
    }
    
    public static func buildLimitedAvailability(_ component: Component) -> Component {
        component
    }
}
