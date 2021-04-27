//
//  BEStackViewBuilder.swift
//  BEPureLayout
//
//  Created by Chung Tran on 27/04/2021.
//

import Foundation

@resultBuilder
public struct BEStackViewBuilder {
    public static func buildBlock(_ components: BEStackViewElement...) -> [BEStackViewElement] {
        components.flatMap { $0.elements }
    }
    
    public static func buildOptional(_ component: [BEStackViewElement]?) -> [BEStackViewElement] {
        component?.flatMap {$0.elements} ?? []
    }
    
    public static func buildEither(first component: [BEStackViewElement]) -> [BEStackViewElement] {
        return component.flatMap { $0.elements }
    }
    
    public static func buildEither(second component: [BEStackViewElement]) -> [BEStackViewElement] {
        return component.flatMap { $0.elements }
    }
}
