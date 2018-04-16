//
// Created by Yamazhiki on 30/03/2018.
// Copyright (c) 2018 ENT-LIVE. All rights reserved.
//

import Foundation

/*可持续任务类型*/
protocol ContinuableTaskType {
    /*当前任务可通过的条件*/
    var condition: Bool { get }
}
