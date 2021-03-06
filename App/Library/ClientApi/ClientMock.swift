//
// Created by Yamazhiki on 16/03/2018.
// Copyright (c) 2018 ISA. All rights reserved.
//

import Foundation
import Api
import Moya

extension Client: ApiTargetType {
    public var sampleData: Data {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        return stub(type: self)
    }
    public var task: Task {
        switch self {
        case .detail(let id):
            return .requestParameters(parameters: ["id": id], encoding: URLEncoding.default)
        case .login(let username, let password):
            return .requestParameters(parameters: ["username": username, "password": password], encoding: URLEncoding.httpBody)
        default:
            return .requestPlain
        }
    }
}

private func stub(type: Client) -> Data {
    let s = "\(type)".split(separator: "(")
    if let url = Bundle.main.url(forResource: s[0].description, withExtension: "json"),
       let data = try? Data.init(contentsOf: url) {
        return data
    }
    return Data()
}
