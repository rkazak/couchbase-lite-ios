//
//  OrderBy.swift
//  CouchbaseLite
//
//  Created by Pasin Suriyentrakorn on 3/20/17.
//  Copyright © 2017 Couchbase. All rights reserved.
//

import Foundation


/// An OrderBy represents an ORDER BY clause of the query statement.
public protocol OrderBy: QueryProtocol, LimitRouter {
    
}

class QueryOrderBy: BaseQuery, OrderBy {

    init(query: BaseQuery, impl: [CBLQueryOrdering]) {
        super.init()
        self.copy(query)
        self.orderingsImpl = impl
    }
    
}
