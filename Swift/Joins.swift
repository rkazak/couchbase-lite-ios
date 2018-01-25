//
//  Joins.swift
//  CouchbaseLite
//
//  Created by Pasin Suriyentrakorn on 7/6/17.
//  Copyright © 2017 Couchbase. All rights reserved.
//

import Foundation


public protocol Joins: QueryProtocol, WhereRouter, OrderByRouter, LimitRouter  {
    
}

/// A Joins component represents a collection of the joins clauses of the query statement.
class QueryJoins: BaseQuery, Joins {
    
    init(query: BaseQuery, impl: [CBLQueryJoin]) {
        super.init()
        self.copy(query)
        self.joinsImpl = impl
    }
    
}
