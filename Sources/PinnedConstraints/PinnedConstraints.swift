import UIKit
import SnapKit

// MARK: - Mertirc Constraints

public extension UIView {
    
    @discardableResult
    func size(equalTo size: CGSize) -> UIView {
        snp.makeConstraints { $0.size.equalTo(size) }
        return self
    }
    
    @discardableResult
    func height(_ height: CGFloat) -> UIView {
        snp.makeConstraints { $0.height.equalTo(height) }
        return self
    }
    
    @discardableResult
    func minHeight(_ height: CGFloat) -> UIView {
        heightGreaterOrEqual(height)
    }
    
    @discardableResult
    func heightGreaterOrEqual(_ height: CGFloat) -> UIView {
        snp.makeConstraints { $0.height.greaterThanOrEqualTo(height) }
        return self
    }
    
    @discardableResult
    func maxHeight(_ height: CGFloat) -> UIView {
        heightLessThanOrEqual(height)
    }
    
    @discardableResult
    func heightLessThanOrEqual(_ height: CGFloat) -> UIView {
        snp.makeConstraints { $0.height.lessThanOrEqualTo(height) }
        return self
    }
    
    @discardableResult
    func width(_ width: CGFloat) -> UIView {
        snp.makeConstraints { $0.width.equalTo(width) }
        return self
    }
    
    @discardableResult
    func width(greaterThanOrEqualTo value: CGFloat) -> UIView {
        snp.makeConstraints { $0.width.greaterThanOrEqualTo(value) }
        return self
    }
    
    @discardableResult
    func widthLessThenOrEqualToSuperview(multipliedBy amount: CGFloat = 0) -> UIView {
        snp.makeConstraints {
            if amount > 0 {
                $0.width.lessThanOrEqualToSuperview().multipliedBy(amount)
            } else {
                $0.width.lessThanOrEqualToSuperview()
            }
        }
        return self
    }
    
    @discardableResult
    func maxWidth(_ width: CGFloat) -> UIView {
        widthLessThanOrEqual(width)
    }
    
    @discardableResult
    func widthLessThanOrEqual(_ width: CGFloat) -> UIView {
        snp.makeConstraints { $0.width.lessThanOrEqualTo(width) }
        return self
    }
    
    @discardableResult
    func heightEqualToSuperview(inset: CGFloat = .zero) -> UIView {
        snp.makeConstraints { $0.height.equalToSuperview().inset(inset) }
        return self
    }
    
    @discardableResult
    func aspectRatio(_ x: CGFloat, by y: CGFloat) -> UIView {
        snp.makeConstraints {
            $0.width.equalTo(snp.height).multipliedBy(x / y)
        }
        return self
    }
    
}

// MARK: - Pins

public extension UIView {
    
    @discardableResult
    func pinToSuperview(insets: UIEdgeInsets = .zero) -> UIView {
        snp.makeConstraints { $0.edges.equalToSuperview().inset(insets) }
        return self
    }
 
    @discardableResult
    func pinToBottomEdges(insets: UIEdgeInsets = .zero) -> UIView {
        snp.makeConstraints {
            $0.leading.equalToSuperview().inset(insets.left)
            $0.trailing.equalToSuperview().inset(insets.right)
            $0.bottom.equalToSuperview().inset(insets.bottom)
        }
        return self
    }
    
    @discardableResult
    func pinToBottomSafeAreaEdges(insets: UIEdgeInsets = .zero) -> UIView {
        guard let superview = superview else { return self }
        snp.makeConstraints {
            $0.leading.equalToSuperview().inset(insets.left)
            $0.trailing.equalToSuperview().inset(insets.right)
            $0.bottom.equalTo(superview.safeAreaLayoutGuide.snp.bottom).inset(insets.bottom)
        }
        return self
    }
    
    @discardableResult
    func pinToTopEdges(insets: UIEdgeInsets = .zero) -> UIView {
        snp.makeConstraints {
            $0.leading.equalToSuperview().inset(insets.left)
            $0.trailing.equalToSuperview().inset(insets.right)
            $0.top.equalToSuperview().inset(insets.top)
        }
        return self
    }
    
    @discardableResult
    func pinToTopSafeArea(insets: UIEdgeInsets = .zero) -> UIView {
        guard let superview = superview else { return self }
        snp.makeConstraints {
            $0.top.equalTo(superview.safeAreaLayoutGuide.snp.top).inset(insets.top)
        }
        return self
    }
    
    @discardableResult
    func pinToTop(inset: CGFloat = .zero) -> UIView {
        snp.makeConstraints {
            $0.top.equalToSuperview().inset(inset)
        }
        return self
    }
    
    @discardableResult
    func pinToTopGreaterThanOrEqual(inset: CGFloat = .zero) -> UIView {
        snp.makeConstraints {
            $0.top.greaterThanOrEqualTo(inset)
        }
        return self
    }
    
    @discardableResult
    func pinToBottom(inset: CGFloat = .zero) -> UIView {
        snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(inset)
        }
        return self
    }
    
    @discardableResult
    func pinToBottom(lessThanOrEqualTo value: CGFloat) -> UIView {
        snp.makeConstraints {
            $0.bottom.lessThanOrEqualTo(value)
        }
        return self
    }

    @discardableResult
    func pinToLeft(inset: CGFloat = .zero) -> UIView {
        snp.makeConstraints {
            $0.leading.equalToSuperview().inset(inset)
        }
        return self
    }
    
    @discardableResult
    func pinToRight(inset: CGFloat = .zero) -> UIView {
        snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(inset)
        }
        return self
    }
    
    @discardableResult
    func pinToRightLessThanOrEqual(inset: CGFloat = .zero) -> UIView {
        snp.makeConstraints {
            $0.trailing.lessThanOrEqualToSuperview().inset(inset)
        }
        return self
    }

    @discardableResult
    func pinToLeftEdges(insets: UIEdgeInsets = .zero) -> UIView {
        snp.makeConstraints {
            $0.leading.equalToSuperview().inset(insets.left)
            $0.bottom.equalToSuperview().inset(insets.bottom)
            $0.top.equalToSuperview().inset(insets.top)
        }
        return self
    }
    
    @discardableResult
    func pinToRightEdges(insets: UIEdgeInsets = .zero) -> UIView {
        snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(insets.right)
            $0.bottom.equalToSuperview().inset(insets.bottom)
            $0.top.equalToSuperview().inset(insets.top)
        }
        return self
    }
    
    @discardableResult
    func centerVertically(offset: CGFloat = .zero) -> UIView {
        snp.makeConstraints { $0.centerY.equalToSuperview().offset(offset) }
        return self
    }
    
    @discardableResult
    func centerHorizontally(offset: CGFloat = .zero) -> UIView {
        snp.makeConstraints { $0.centerX.equalToSuperview().offset(offset) }
        return self
    }
    
    @discardableResult
    func centerInSuperview() -> UIView {
        self
            .centerVertically()
            .centerHorizontally()
        return self
    }
 
    @discardableResult
    func pinHorizontally(insets: UIEdgeInsets = .zero) -> UIView {
        snp.makeConstraints {
            $0.leading.equalToSuperview().inset(insets.left)
            $0.trailing.equalToSuperview().inset(insets.right)
        }
        return self
    }
    
    func makeWidthEqualToSuperview(inset: CGFloat = 0) {
        snp.makeConstraints { $0.width.equalToSuperview().inset(inset) }
    }
    
}

// MARK: - Relative Constraints

public extension UIView {
    
    @discardableResult
    func putBelow(_ aboveView: UIView, inset: CGFloat = .zero) -> UIView {
        snp.makeConstraints { $0.top.equalTo(aboveView.snp.bottom).inset(inset) }
        return self
    }
    
    @discardableResult
    func putAbove(_ belowView: UIView, inset: CGFloat = .zero) -> UIView {
        snp.makeConstraints { $0.bottom.equalTo(belowView.snp.top).inset(inset) }
        return self
    }
    
    @discardableResult
    func putNext(to previousView: UIView, inset: CGFloat = .zero) -> UIView {
        snp.makeConstraints { $0.leading.equalTo(previousView.snp.trailing).inset(inset) }
        return self
    }
    
    @discardableResult
    func putAfter(_ beforeView: UIView, greaterThanOrEqualTo offset: CGFloat) -> UIView {
        snp.makeConstraints {
            $0.leading.greaterThanOrEqualTo(beforeView.snp.trailing).offset(offset)
        }
        return self
    }
    
    @discardableResult
    func putBefore(_ afterView: UIView, lessThanOrEqualTo offset: CGFloat) -> UIView {
        snp.makeConstraints {
            $0.trailing.lessThanOrEqualTo(afterView.snp.leading).offset(offset)
        }
        return self
    }
    
    @discardableResult
    func putBefore(_ afterView: UIView, offset: CGFloat) -> UIView {
        snp.makeConstraints {
            $0.trailing.equalTo(afterView.snp.leading).offset(offset)
        }
        return self
    }
    
}
