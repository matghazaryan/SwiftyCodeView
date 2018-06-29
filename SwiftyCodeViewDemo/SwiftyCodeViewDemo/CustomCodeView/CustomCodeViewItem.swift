//
//  CustomCodeViewItem.swift
//  SwiftyCodeView
//
//  Created by Artur Mkrtchyan on 6/30/18.
//  Copyright © 2018 arturdev. All rights reserved.
//

import UIKit
import SwiftyCodeView

class CustomCodeItemView: SwiftyCodeItemView {
    @IBOutlet weak var borderView: UIView!
    
    override func awakeFromNib() {
        isUserInteractionEnabled = false
        textField.text = ""
        
        borderView.layer.borderWidth = 1
        borderView.layer.borderColor = UIColor.darkGray.cgColor
    }
}
