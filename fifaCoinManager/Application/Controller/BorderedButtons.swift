//
//  BorderedButtons.swift
//  fifaCoinManager
//
//  Created by Artem Tyumencev on 22.08.2020.
//  Copyright © 2020 Artem Tyumencev. All rights reserved.
//

import UIKit

@IBDesignable class BorderedButtons : UIButton {
    /// Толщина границы
    @IBInspectable var borderWidth: CGFloat {
        set { layer.borderWidth = newValue }
        get { return layer.borderWidth }
    }
    /// Цвет границы
//    @IBInspectable var borderColor: UIColor? {
//        set { layer.borderColor = newValue?.cgColor }
//        get { return layer.borderColor?.UIColor }
//    }
    /// Радиус границы
    @IBInspectable var cornerRadius: CGFloat {
        set { layer.cornerRadius = newValue }
        get { return layer.cornerRadius  }
    }
}

extension CGColor {
    private var UIColor: UIKit.UIColor {
        return UIKit.UIColor(cgColor: self)
    }
}
