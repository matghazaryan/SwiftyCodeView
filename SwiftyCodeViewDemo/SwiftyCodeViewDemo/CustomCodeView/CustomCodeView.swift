//
//  CustomCodeView.swift
//  SwiftyCodeView
//
//  Created by Artur Mkrtchyan on 6/30/18.
//  Copyright © 2018 arturdev. All rights reserved.
//

import Foundation
import SwiftyCodeView

class CustomCodeView: SwiftyCodeView {
    override func generateItem() -> SwiftyCodeItemView {
        return Bundle(for: CustomCodeItemView.self)
            .loadNibNamed("CustomCodeItemView", owner: nil, options: nil)?
            .first as! SwiftyCodeItemView
    }
}
