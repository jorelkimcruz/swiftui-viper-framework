//
//  RR+UIApplication.swift
//  viper-swift-ui-portfolio
//
//  Created by MAC HOME on 8/7/20.
//  Copyright © 2020 JORELCRUZ. All rights reserved.
//

import SwiftUI

extension UIApplication {
      // 1. Function that we can call via `UIApplication.setStatusBarStyle(...)`
    class func setStatusBarStyle(_ style: UIStatusBarStyle) {
          // Get the root view controller, which we've set to be `ContentHostingController`
        if let vc = UIApplication.getKeyWindow()?.rootViewController as? ContentHostingController {
                 // Call the method we've defined
            vc.changeStatusBarStyle(style)
        }
    }
      // 2. Helper function to get the key window
    private class func getKeyWindow() -> UIWindow? {
        return UIApplication.shared.windows.first{ $0.isKeyWindow }
    }
}

