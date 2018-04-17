//
// Created by Yamazhiki on 19/03/2018.
// Copyright (c) 2018 ISA. All rights reserved.
//

import Foundation

enum UIDataStatus<T> {
    case error(Int, String, String)
    case result(T)
}
