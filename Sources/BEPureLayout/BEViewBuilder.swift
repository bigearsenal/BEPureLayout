//
// Created by Giang Long Tran on 09.12.21.
//

import Foundation

public typealias Builder = () -> [UIView]

extension Array where Element == UIView {
    public func build() -> UIView {
        switch (count) {
        case 0: return BEView()
        case 1: return self[0]
        default: return UIStackView(axis: .vertical, arrangedSubviews: self)
        }
    }
}

@resultBuilder
public struct BEViewBuilder {
    
    public typealias Expression = UIView
    
    public typealias Component = [UIView]
    
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