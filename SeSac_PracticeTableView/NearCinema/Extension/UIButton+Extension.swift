//
//  UIButton+Extension.swift
//  SeSac_PracticeTableView
//
//  Created by youngjoo on 1/24/24.
//

import UIKit

extension UIButton.Configuration {
    
    static func cinemaBtn(title: String, baseForegroundColor: UIColor, baseBackgroundColor: UIColor) -> UIButton.Configuration {
        
        var config = UIButton.Configuration.bordered()
        
        config.title = title
        
        config.baseForegroundColor = baseForegroundColor
        config.baseBackgroundColor = baseBackgroundColor
        
        return config
    }
}
