//
//  GroupByRouter.swift
//  CouchbaseLite
//
//  Created by Pasin Suriyentrakorn on 7/5/17.
//  Copyright © 2017 Couchbase. All rights reserved.
//

import Foundation

/// GroupByRouter for creating and chaning a query GROUP BY clause.
public protocol GroupByRouter {
    
    /// Creates and chains a GroupBy object to group the query result.
    ///
    /// - Parameter expressions: The group by expression.
    /// - Returns: The GroupBy object that represents the GROUP BY clause of the query.
    func groupBy(_ expressions: ExpressionProtocol...) -> GroupBy
    
}

extension GroupByRouter {
    
    func groupBy(_ expressions: ExpressionProtocol...) -> GroupBy {
        return QueryGroupBy(query: self as! BaseQuery,
                            impl: QueryExpression.toImpl(expressions: expressions))
    }
    
}
