//
//  KHBaseModel.swift
//  kaiheila_ios
//
//  Created by 忠良 on 2021/11/4.
//  Copyright © 2021 admin. All rights reserved.
//

import Foundation
import SwiftyJSON



protocol KHBaseModelProtocol {
    
    init(json:JSON)
    
}


class KHBaseModel : KHBaseModelProtocol {
    
    required init(json: JSON) {
        
    }
    
    init() {
    
    }
    class func getModes<T: KHBaseModelProtocol>(type: T.Type,jsons:[JSON]) -> [T]{
        
        var list : [T] = []
        for json in jsons {
            list.append(type.init(json: json))
        }
        return list
        
    }
    
}


