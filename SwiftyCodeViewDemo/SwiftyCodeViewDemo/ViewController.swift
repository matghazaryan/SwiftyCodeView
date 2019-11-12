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
    func codeViewIsNotFull() {
        let alert = UIAlertController(title: "Error", message: "Enter Code", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func codeView(sender: SwiftyCodeView, didFinishInput code: String) {
        resultLabel.text = code
    }
}

