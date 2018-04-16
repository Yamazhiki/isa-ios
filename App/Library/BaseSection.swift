//
// Created by Yamazhiki on 2018/4/12.
// Copyright (c) 2018 ENT-LIVE. All rights reserved.
//

import Foundation
import RxDataSources

struct BaseSection<T>: SectionModelType {
    var items: [T]
    
    init(original: BaseSection<T>, items: [T]) {
        self.items = items
        self = original
    }
}
