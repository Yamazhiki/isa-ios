//
// Created by Yamazhiki on 2018/4/18.
// Copyright (c) 2018 ENT-LIVE. All rights reserved.
//

import Foundation
import Api
import Moya
import RxSwift

enum EnvironmentType {
    case simulate
    case dev
    case production

    static func from(_ rawValue: Int) -> EnvironmentType {
        switch rawValue {
        case 0: return EnvironmentType.simulate
        case 1: return EnvironmentType.dev
        default:return EnvironmentType.production
        }
    }
}

extension EnvironmentType {
    var serverConfig: ServerConfigType {
        switch self {
        case .simulate: return ServerConfigImp.simulation
        case .dev: return ServerConfigImp.dev
        case .production: return ServerConfigImp.production
        }
    }
}

extension EnvironmentType {
    var stubDelay: Int {
        switch self {
        case .simulate: return 200
        default: return 0
        }
    }
}