import UIKit

/// Represents a single `NSLayoutConstraint`
enum BELayoutAnchor {
    case constant(attribute: NSLayoutConstraint.Attribute,
                  relation: NSLayoutConstraint.Relation,
                  constant: CGFloat)
    
    case relative(attribute: NSLayoutConstraint.Attribute,
                  relation: NSLayoutConstraint.Relation,
                  relatedTo: NSLayoutConstraint.Attribute,
                  multiplier: CGFloat,
                  constant: CGFloat)
}

// MARK: - Factory methods
extension BELayoutAnchor {
    static let leading = relative(attribute: .leading, relation: .equal, relatedTo: .leading)
    static let trailing = relative(attribute: .trailing, relation: .equal, relatedTo: .trailing)
    static let top = relative(attribute: .top, relation: .equal, relatedTo: .top)
    static let bottom = relative(attribute: .bottom, relation: .equal, relatedTo: .bottom)
    
    static let centerX = relative(attribute: .centerX, relation: .equal, relatedTo: .centerX)
    static let centerY = relative(attribute: .centerY, relation: .equal, relatedTo: .centerY)
    
    static let width = constant(attribute: .width, relation: .equal)
    static let height = constant(attribute: .height, relation: .equal)
    
    static func constant(
        attribute: NSLayoutConstraint.Attribute,
        relation: NSLayoutConstraint.Relation
    ) -> (CGFloat) -> BELayoutAnchor {
        return { constant in
            .constant(attribute: attribute, relation: relation, constant: constant)
        }
    }
    
    static func relative(
        attribute: NSLayoutConstraint.Attribute,
        relation: NSLayoutConstraint.Relation,
        relatedTo: NSLayoutConstraint.Attribute,
        multiplier: CGFloat = 1
    ) -> (CGFloat) -> BELayoutAnchor {
        return { constant in
            .relative(attribute: attribute, relation: relation, relatedTo: relatedTo, multiplier: multiplier, constant: constant)
        }
    }
}

// MARK: - Conveniences
extension UIView {
    func addSubview(_ subview: UIView, anchors: [BELayoutAnchor]) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        subview.activate(anchors: anchors, relativeTo: self)
    }
    
    func activate(anchors: [BELayoutAnchor], relativeTo item: UIView? = nil) {
        let constraints = anchors.map { NSLayoutConstraint(from: self, to: item, anchor: $0) }
        NSLayoutConstraint.activate(constraints)
    }
}

extension NSLayoutConstraint {
    convenience init(from: UIView, to item: UIView?, anchor: BELayoutAnchor) {
        switch anchor {
        case let .constant(attribute: attr, relation: relation, constant: constant):
            self.init(
                item: from,
                attribute: attr,
                relatedBy: relation,
                toItem: nil,
                attribute: .notAnAttribute,
                multiplier: 1,
                constant: constant
            )
        case let .relative(attribute: attr,
                           relation: relation,
                           relatedTo: relatedTo,
                           multiplier: multiplier,
                           constant: constant):
            self.init(
                item: from,
                attribute: attr,
                relatedBy: relation,
                toItem: item,
                attribute: relatedTo,
                multiplier: multiplier,
                constant: constant
            )
        }
    }
}
