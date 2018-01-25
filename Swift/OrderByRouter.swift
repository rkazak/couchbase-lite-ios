//
//  OrderByRouter.swift
//  CouchbaseLite
//
//  Created by Pasin Suriyentrakorn on 3/20/17.
//  Copyright © 2017 Couchbase. All rights reserved.
//

import Foundation


/// OrderByRouter for creating and chaning a query ORDER BY clause.
public protocol OrderByRouter {
    
    /// Creates and chains an OrderBy object for specifying the orderings of the query result.
    ///
    /// - Parameter orderings: The Ordering objects.
    /// - Returns: The OrderBy object that represents the ORDER BY clause of the query.
    func orderBy(_ orderings: OrderingProtocol...) -> OrderBy
}

extension OrderByRouter {
    
    func orderBy(_ orderings: OrderingProtocol...) -> OrderBy {
        return QueryOrderBy(query: self as! BaseQuery,
                            impl: QueryOrdering.toImpl(orderings: orderings))
    }
    
}
