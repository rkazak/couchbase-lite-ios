//
//  Limit.swift
//  CouchbaseLite
//
//  Created by Pasin Suriyentrakorn on 7/10/17.
//  Copyright © 2017 Couchbase. All rights reserved.
//

import Foundation


/// A Limit component represents the LIMIT clause of the query statement.
public protocol Limit: QueryProtocol {
    
}

class QueryLimit: BaseQuery, Limit  {
    
    init(query: BaseQuery, limit: ExpressionProtocol, offset: ExpressionProtocol?) {
        super.init()
        
        self.copy(query)
        self.limitImpl = CBLQueryLimit(limit.toImpl(), offset: offset != nil ? offset!.toImpl() : nil)
    }
    
}
