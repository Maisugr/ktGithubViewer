//
//  UIColor+Additions.swift
//  ktGithubViewver
//
//  Created by Karcsú Tamás on 5/31/19.
//  Copyright © 2019 tApp. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    @nonobjc class var ktDark: UIColor {
        return UIColor(red: 22.0 / 255.0, green: 19.0 / 255.0, blue: 39.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var ktTealish: UIColor {
        return UIColor(red: 60.0 / 255.0, green: 202.0 / 255.0, blue: 206.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var ktTealishAlpha: UIColor {
        return UIColor(red: 60.0 / 255.0, green: 202.0 / 255.0, blue: 206.0 / 255.0, alpha: 0.6)
    }
    @nonobjc class var ktCharcoalGrey: UIColor {
        return UIColor(red: 53.0 / 255.0, green: 53.0 / 255.0, blue: 57.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var ktCharcoalGreyTwo: UIColor {
        return UIColor(red: 62.0 / 255.0, green: 62.0 / 255.0, blue: 66.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var ktTealishTwo: UIColor {
        return UIColor(red: 65.0 / 255.0, green: 215.0 / 255.0, blue: 173.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var ktCornflower: UIColor {
        return UIColor(red: 96.0 / 255.0, green: 123.0 / 255.0, blue: 1.0, alpha: 1.0)
    }
    @nonobjc class var ktLightRoyalBlue: UIColor {
        return UIColor(red: 58.0 / 255.0, green: 43.0 / 255.0, blue: 243.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var ktDarkGreyBlue: UIColor {
        return UIColor(red: 46.0 / 255.0, green: 40.0 / 255.0, blue: 87.0 / 255.0, alpha: 1.0)
    }
}

// Text styles
extension UIFont {
    class var ktTextStyle: UIFont {
        return UIFont(name: "Avenir-Medium", size: 24.0)!
    }
    class var ktTextStyle2: UIFont {
        return UIFont(name: "Avenir-Book", size: 16.0)!
    }
}
