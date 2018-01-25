//
//  From.swift
//  CouchbaseLite
//
//  Created by Pasin Suriyentrakorn on 3/20/17.
//  Copyright © 2017 Couchbase. All rights reserved.
//

import Foundation


/// A From component representing a FROM clause for specifying the data source of the query.
public protocol From: QueryProtocol, JoinRouter, WhereRouter, GroupByRouter, OrderByRouter, LimitRouter {
    
}

class QueryFrom: BaseQuery, From {
    
    /** An internal constructor. */
    init(query: BaseQuery, impl: CBLQueryDataSource, database: Database) {
        super.init()
        
        self.copy(query)
        self.fromImpl = impl
        self.database = database
    }
    
}
