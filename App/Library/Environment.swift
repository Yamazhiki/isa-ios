//
// Created by 斌王 on 05/03/2018.
// Copyright (c) 2018 斌王. All rights reserved.
// App唯一容器类定义
//

import Foundation
import Api

//typealias LiveStreamType = LiveStreamBeautyType & LiveStreamBeautyType & LiveStreamControllerType & LiveStreamBgmType

struct Environment {

    /// 当前用户
    fileprivate let mUser: UserType

    /// 数据交互Api管理类
    let api: ApiProvider<Client>

    /// 网络反馈
    let reachability: ReachabilityService

    /*路由管理器*/
    let router: RouterManager<MessageRouter>

    /*JSON Encoder*/
    let encoder: JSONEncoder

    /*JSON DeCoder*/
    let decoder: JSONDecoder

    init(
            user: UserType = DefaultUserImp(),
            api: ApiProvider<Client> = ApiProvider.provider,
            reachability: ReachabilityService = try! DefaultReachabilityService(),
            router: RouterManager<MessageRouter> = RouterManager<MessageRouter>(),
            encoder: JSONEncoder = JSONEncoder(),
            decoder: JSONDecoder = JSONDecoder()
    ) {

        self.mUser = user
        self.api = api
        self.reachability = reachability
        self.router = router
        self.encoder = encoder
        self.decoder = decoder
    }
}


extension ApiProvider {
    static var provider: ApiProvider {
        return ApiProvider(baseURL: EnvironmentType.dev.serverConfig.apiBaseURL)
    }
}

extension Environment {
    var user: User {
        return mUser as! User
    }

}
