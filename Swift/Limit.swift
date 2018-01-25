//
//  Limit.swift
//  CouchbaseLite
//
//  Created by Pasin Suriyentrakorn on 7/10/17.
//  Copyright © 2017 Couchbase. All rights reserved.
//

import Foundation

public protocol Limit: QueryProtocol {
    
}

/// A Limit component represents the LIMIT clause of the query statement.
class QueryLimit: BaseQuery, Limit  {
    
    // MARK: Internal
    
    init(query: BaseQuery, limit: ExpressionProtocol, offset: ExpressionProtocol?) {
        super.init()
        
        self.copy(query)
        self.limitImpl = CBLQueryLimit(limit.toImpl(), offset: offset != nil ? offset!.toImpl() : nil)
    }
    
}
