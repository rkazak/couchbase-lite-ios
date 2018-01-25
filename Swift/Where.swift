//
//  Where.swift
//  CouchbaseLite
//
//  Created by Pasin Suriyentrakorn on 3/20/17.
//  Copyright © 2017 Couchbase. All rights reserved.
//

import Foundation

/// Where class represents the WHERE clause of the query statement.
public protocol Where: QueryProtocol, GroupByRouter, OrderByRouter, LimitRouter {
    
}

class QueryWhere: BaseQuery, Where {
    
    init(query: BaseQuery, impl: CBLQueryExpression) {
        super.init()
        
        self.copy(query)
        self.whereImpl = impl
    }
    
}
