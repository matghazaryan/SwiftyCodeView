//
//  SwiftyCodeView.swift
//
//  Created by arturdev on 6/28/18.
//

import UIKit

@objc
public protocol SwiftyCodeViewDelegate: class {
    func codeView(sender: SwiftyCodeView, didFinishInput code: String)
}

@IBDesignable
open class SwiftyCodeView: UIControl {
    @IBInspectable open var length: Int = 4 {
        didSet {
            setupUI()
        }
    }
    
    @IBOutlet open weak var delegate: SwiftyCodeViewDelegate?
    
    var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return stackView
    }()
    
    fileprivate var items: [SwiftyCodeItemView] = []
    open var code: String {
        get {
            let items = stackView.arrangedSubviews.map({$0 as! SwiftyCodeItemView})
            let values = items.map({$0.textField.text ?? ""})
            return values.joined()
        }
        set {
            let array = newValue.map(String.init)
            for i in 0..<array.count {
                let item = stackView.arrangedSubviews[i] as! SwiftyCodeItemView
                item.textField.text = array[i]
            }
        }
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(becomeFirstResponder))
        addGestureRecognizer(tap)
    }
    
    fileprivate func setupUI() {
        stackView.frame = self.bounds
        if stackView.superview == nil {
            addSubview(stackView)
        }
        stackView.arrangedSubviews.forEach{($0.removeFromSuperview())}
        
        for i in 0..<length {
            let itemView = generateItem()
            itemView.textField.deleteDelegate = self
            itemView.textField.delegate = self
            itemView.tag = i
            itemView.textField.tag = i
            stackView.addArrangedSubview(itemView)
        }
    }
    
    open func generateItem() -> SwiftyCodeItemView {
        let type = SwiftyCodeItemView.self
        let typeStr = type.description().components(separatedBy: ".").last ?? ""
        let bundle = Bundle(for: type)
        return bundle
            .loadNibNamed(typeStr,
                          owner: nil,
                          options: nil)?
            .last as! SwiftyCodeItemView
    }
    
    override open func becomeFirstResponder() -> Bool {
        let items = stackView.arrangedSubviews
            .map({$0 as! SwiftyCodeItemView})
        return (items.filter({($0.textField.text ?? "").isEmpty}).first ?? items.last)!.becomeFirstResponder()
    }
    
    override open func resignFirstResponder() -> Bool {
        stackView.arrangedSubviews.forEach({$0.resignFirstResponder()})
        return true
    }
    
    override open func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupUI()
    }
}

extension SwiftyCodeView: UITextFieldDelegate, SwiftyCodeTextFieldDelegate {
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if string == "" { //is backspace
            return true
        }
        
        if !textField.hasText {
            let index = textField.tag
            let item = stackView.arrangedSubviews[index] as! SwiftyCodeItemView
            item.textField.text = string
            sendActions(for: .valueChanged)
            if index == length - 1 { //is last textfield
                delegate?.codeView(sender: self, didFinishInput: self.code)
                textField.resignFirstResponder()
                return false
            }
            
            _ = stackView.arrangedSubviews[index + 1].becomeFirstResponder()
        }
        
        return false
    }
    
    public func deleteBackward(sender: SwiftyCodeTextField) {
        for i in 1..<length{
            let itemView = stackView.arrangedSubviews[i] as! SwiftyCodeItemView
            
            if !itemView.textField.isFirstResponder {
                continue
            }
            
            let prevItem = stackView.arrangedSubviews[i-1] as! SwiftyCodeItemView
            _ = prevItem.becomeFirstResponder()
            prevItem.textField.text = ""
        }
        sendActions(for: .valueChanged)
    }
}
