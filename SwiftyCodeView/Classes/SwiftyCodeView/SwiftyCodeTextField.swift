//
//  SwiftyCodeTextField.swift
//
//  Created by arturdev on 6/30/18.
//

import UIKit

public protocol SwiftyCodeTextFieldDelegate: class {
	func deleteBackward(sender: SwiftyCodeTextField, prevValue: String?)
}

open class SwiftyCodeTextField: UITextField {
    
    weak open var deleteDelegate: SwiftyCodeTextFieldDelegate?

    override open func deleteBackward() {
		let prevValue = text
		super.deleteBackward()
        deleteDelegate?.deleteBackward(sender: self, prevValue: prevValue)
    }
}
