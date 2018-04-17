//
// Created by Yamazhiki on 2018/4/12.
// Copyright (c) 2018 ISA. All rights reserved.
//

import Foundation

protocol FunctionProtocol {
    func apply<T>(m: (T) -> Void) -> T
}
