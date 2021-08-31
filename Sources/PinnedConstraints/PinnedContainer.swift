import UIKit
import SnapKit

public struct ContainerLayout {
    public var pins: ContainerConstraints
    public var insets: UIEdgeInsets
    
    public init(pins: ContainerConstraints, insets: UIEdgeInsets) {
        self.pins = pins
        self.insets = insets
    }
}

public struct ContainerConstraints: OptionSet {
    
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public static let leading = ContainerConstraints(rawValue: 1 << 0)
    public static let trailing = ContainerConstraints(rawValue: 1 << 1)
    public static let top = ContainerConstraints(rawValue: 1 << 2)
    public static let bottom = ContainerConstraints(rawValue: 1 << 3)
    public static let centerX = ContainerConstraints(rawValue: 1 << 4)
    public static let centerY = ContainerConstraints(rawValue: 1 << 5)
    public static let center = ContainerConstraints(rawValue: 1 << 6)
    
}

public extension UIView {
    
    func addTo(_ containerView: UIView, layout: ContainerLayout) {
        containerView.addSubview(self)

        snp.makeConstraints {
            if layout.pins.contains(.leading) {
                $0.leading.equalToSuperview().inset(layout.insets.left)
            }
            
            if layout.pins.contains(.trailing) {
                $0.trailing.equalToSuperview().inset(layout.insets.right)
            }
            
            if layout.pins.contains(.top) {
                $0.top.equalToSuperview().inset(layout.insets.top)
            }
            
            if layout.pins.contains(.bottom) {
                $0.bottom.equalToSuperview().inset(layout.insets.bottom)
            }
            
            if layout.pins.contains(.center) {
                $0.center.equalToSuperview()
            } else {
                if layout.pins.contains(.centerX) {
                    $0.centerX.equalToSuperview()
                }
                
                if layout.pins.contains(.centerY) {
                    $0.centerY.equalToSuperview()
                }
            }
        }
        
    }
    
}
