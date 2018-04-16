//
// Created by Yamazhiki on 16/03/2018.
// Copyright (c) 2018 ENT-LIVE. All rights reserved.
// App 与 服务端接口定义
//

import Foundation
import Moya

enum Client {

    case users
    case singleUser(Int)
    case detail(Int)
    case login(String, String)

    public var path: String {
        switch self {
        case .users: return "users"
        case .singleUser(let id):return "user/\(id)"
        case .detail(let id): return "detail/\(id)"
        case .login(_, _): return "login"
        }
    }
    public var method: Moya.Method {
        return .get
    }
}
