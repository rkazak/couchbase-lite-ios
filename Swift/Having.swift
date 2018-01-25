//
//  Having.swift
//  CouchbaseLite
//
//  Created by Pasin Suriyentrakorn on 7/5/17.
//  Copyright © 2017 Couchbase. All rights reserved.
//

import Foundation


/// Having represents a HAVING clause of the query statement used for filtering the aggregated
/// values from the the GROUP BY clause.
public protocol Having: QueryProtocol, OrderByRouter, LimitRouter {
    
}

class QueryHaving: BaseQuery, Having {
    
    init(query: BaseQuery, impl: CBLQueryExpression) {
        super.init()
        
        self.copy(query)
        self.havingImpl = impl
    }
    
}
