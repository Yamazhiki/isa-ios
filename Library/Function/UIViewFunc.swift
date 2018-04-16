//
// Created by Yamazhiki on 2018/4/12.
// Copyright (c) 2018 ENT-LIVE. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func apply(block: (UIView) -> Void) -> Void {
        block(self)
    }
}
