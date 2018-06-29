//
//  ViewController.swift
//  SwiftyCodeViewDemoRX
//
//  Created by Artur Mkrtchyan on 6/30/18.
//  Copyright © 2018 arturdev. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SwiftyCodeView

class ViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    @IBOutlet weak var codeView: SwiftyCodeView!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let codeLenght = codeView.length
        codeView.rx.code.map({$0.count == codeLenght})
            .bind(to: submitButton.rx.isEnabled)
            .disposed(by: disposeBag)
    }
}

