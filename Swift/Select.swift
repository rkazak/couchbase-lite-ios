//
//  Select.swift
//  CouchbaseLite
//
//  Created by Pasin Suriyentrakorn on 3/20/17.
//  Copyright © 2017 Couchbase. All rights reserved.
//

import Foundation


/// A Select component represents the returning properties in each query result row.
public protocol Select: QueryProtocol, FromRouter {
    
}

class QuerySelect: BaseQuery, Select {
    
    init(impl: [CBLQuerySelectResult], distinct: Bool) {
        super.init()
        
        self.selectImpl = impl
        self.distinct = distinct
    }
    
}
