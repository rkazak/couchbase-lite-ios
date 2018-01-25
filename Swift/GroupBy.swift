//
//  GroupBy.swift
//  CouchbaseLite
//
//  Created by Pasin Suriyentrakorn on 7/5/17.
//  Copyright © 2017 Couchbase. All rights reserved.
//

import Foundation


/// A GroupBy represents the GROUP BY clause to group the query result.
/// The GROUP BY clause is normally used with aggregate functions (AVG, COUNT, MAX, MIN, SUM)
/// to aggregate the group of the values.
public protocol GroupBy: QueryProtocol, HavingRouter, OrderByRouter, LimitRouter {
    
}

class QueryGroupBy: BaseQuery, GroupBy {
    
    init(query: BaseQuery, impl: [CBLQueryExpression]) {
        super.init()
        self.copy(query)
        self.groupByImpl = impl
    }
    
}
