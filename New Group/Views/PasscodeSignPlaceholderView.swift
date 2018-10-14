//
//  PasscodeSignPlaceholderView.swift
//  ThinkRiot
//
//  Created by MacBookPro on 10/8/18.
//  Copyright © 2018 LittlelinkInc. All rights reserved.
//

import UIKit

@IBDesignable
public class PasscodeSignPlaceholderView: UIView {
    
    public enum State {
        case Inactive
        case Active
        case Error
    }
    
    @IBInspectable
    public var inactiveColor: UIColor = UIColor.white {
        didSet {
            setupView()
        }
    }
    
    @IBInspectable
    public var activeColor: UIColor = UIColor.gray {
        didSet {
            setupView()
        }
    }
    
    @IBInspectable
    public var errorColor: UIColor = UIColor.red {
        didSet {
            setupView()
        }
    }
    
    public override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setupView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    //public override func intrinsicContentSize() -> CGSize {
    //    return CGSizeMake(16, 16)
    //}
    
    private func setupView() {
        
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = activeColor.cgColor
        backgroundColor = inactiveColor
    }
    
    private func colorsForState(state: State) -> (backgroundColor: UIColor, borderColor: UIColor) {
        
        switch state {
        case .Inactive: return (inactiveColor, activeColor)
        case .Active: return (activeColor, activeColor)
        case .Error: return (errorColor, errorColor)
        }
    }
    
    public func animateState(state: State) {
        
        let colors = colorsForState(state: state)
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 0,
            options: [],
            animations: {
                
                self.backgroundColor = colors.backgroundColor
                self.layer.borderColor = colors.borderColor.cgColor
                
        },
            completion: nil
        )
    }
}
