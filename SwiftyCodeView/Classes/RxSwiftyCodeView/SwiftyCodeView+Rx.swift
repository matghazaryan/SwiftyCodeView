//
//  SwiftyCodeView.swift
//
//  Created by arturdev on 6/28/18.
//

import UIKit

#if canImport(RxCocoa)
import RxSwift
import RxCocoa

public extension Reactive where Base: SwiftyCodeView {
    
    /// Reactive wrapper for `code` property.
    var code: ControlProperty<String> {
        return controlProperty(editingEvents: [.allEditingEvents, .valueChanged],
                               getter: { codeView in
                                codeView.code
        }, setter: { codeView, value in
            codeView.code = value
        })
    }
}
#endif
