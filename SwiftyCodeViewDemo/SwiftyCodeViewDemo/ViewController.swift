//
//  ViewController.swift
//  SwiftyCodeViewDemo
//
//  Created by Artur Mkrtchyan on 6/30/18.
//  Copyright © 2018 arturdev. All rights reserved.
//

import UIKit
import SwiftyCodeView

class ViewController: UIViewController {

    @IBOutlet weak var codeView: SwiftyCodeView!
    @IBOutlet weak var customCodeView: CustomCodeView!
    @IBOutlet weak var resultLabel: UILabel!
}

extension ViewController: SwiftyCodeViewDelegate {
    func codeView(sender: SwiftyCodeView, didFinishInput code: String) {
        resultLabel.text = code
    }
}

