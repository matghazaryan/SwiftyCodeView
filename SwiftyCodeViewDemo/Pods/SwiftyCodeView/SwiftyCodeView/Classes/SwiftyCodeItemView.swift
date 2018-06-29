//
//  SwiftyCodeItemView.swift
//
//  Created by arturdev on 6/28/18.
//

import UIKit

open class SwiftyCodeItemView: UIView {

    @IBOutlet open weak var textField: SwiftyCodeTextField!
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        textField.text = ""
        applyBorderedShadow()
        
        isUserInteractionEnabled = false
    }
    
    private func applyBorderedShadow() {
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor(red: 227/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowRadius = 8
        layer.masksToBounds = false
        layer.cornerRadius = 4
    }
    
    override open func becomeFirstResponder() -> Bool {
        return textField.becomeFirstResponder()
    }
    
    override open func resignFirstResponder() -> Bool {
        return textField.resignFirstResponder()
    }
}
