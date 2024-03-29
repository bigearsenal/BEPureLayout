//
//  BETapGestureRecognizer.swift
//  BEPureLayout
//
//  Created by Giang Long Tran on 09.12.21.
//

import Foundation
import UIKit

// Taken from: https://stackoverflow.com/a/53601585 (Pavel Stepanov)

public typealias BEVoidCallback = () -> Void
public typealias BECallback<T> = (_ value: T) -> Void

public final class BETapGestureRecognizer: UITapGestureRecognizer {
    private var action: () -> Void
    
    public init(_ action: @escaping () -> Void) {
        self.action = action
        super.init(target: nil, action: nil)
        addTarget(self, action: #selector(execute))
    }
    
    @objc private func execute() {
        action()
    }
}

@available(iOS 13.0, *)
public final class BEAsyncTapGestureRecognizer: UITapGestureRecognizer {
    private var action: () async throws -> Void
    
    public init(_ action: @Sendable @escaping () async throws -> Void) {
        self.action = action
        super.init(target: nil, action: nil)
        addTarget(self, action: #selector(execute))
    }
    
    @objc private func execute() {
        Task {
            try await action()
        }
    }
}

public final class BELongPressGestureRecognizer: UILongPressGestureRecognizer {
    private var action: (UILongPressGestureRecognizer) -> Void
    
    public init(_ action: @escaping (UILongPressGestureRecognizer) -> Void) {
        self.action = action
        super.init(target: nil, action: nil)
        addTarget(self, action: #selector(execute(_:)))
    }
    
    @objc private func execute(_ gesture: UILongPressGestureRecognizer) {
        action(gesture)
    }
}

extension UIView {
    @discardableResult
    public func onTap(_ action: @escaping () -> Void) -> Self {
        addGestureRecognizer(BETapGestureRecognizer(action))
        return self
    }
    
    public func onTap(with recognizer: BETapGestureRecognizer) -> Self {
        addGestureRecognizer(recognizer)
        return self
    }
    
    @discardableResult
    public func onLongTap(_ action: @escaping (UILongPressGestureRecognizer) -> Void) -> Self {
        let gesture = BELongPressGestureRecognizer(action)
        addGestureRecognizer(gesture)
        return self
    }
    
    @available(iOS 13.0, *)
    @discardableResult
    public func onTap(_ action: @Sendable @escaping () async throws -> Void) -> Self {
        addGestureRecognizer(BEAsyncTapGestureRecognizer(action))
        return self
    }
}
