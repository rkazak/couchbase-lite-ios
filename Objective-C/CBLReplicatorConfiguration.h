//
//  CBLReplicatorConfiguration.h
//  CouchbaseLite
//
//  Created by Pasin Suriyentrakorn on 5/25/17.
//  Copyright © 2017 Couchbase. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Security/SecCertificate.h>
@class CBLDatabase;
@class CBLAuthenticator;
@protocol CBLConflictResolver;

NS_ASSUME_NONNULL_BEGIN

/** Replicator type. */
typedef enum {
    kCBLPushAndPull = 0,    ///< Bidirectional; both push and pull
    kCBLPush,               ///< Pushing changes to the target
    kCBLPull                ///< Pulling changes from the target
} CBLReplicatorType;


/** Replicator target, which can be either a URL to the remote database or a local database. */
@interface CBLReplicatorTarget : NSObject

/** A URL to the remote database */
@property (readonly, nonatomic, nullable) NSURL* url;

/** A local database */
@property (readonly, nonatomic, nullable) CBLDatabase* database;

/** Create a CBLReplicatorTarget with a URL to the remote database.
    @param url  the url to the remote database.
    @result the CBLReplicatorTarget initialized the the given url. */
+ (instancetype) url: (NSURL*)url;

/** Create a CBLReplicatorTarget with a local database.
    @param database the local database.
    @result the CBLReplicatorTarget initialized with the given local database. */
+ (instancetype) database: (CBLDatabase*)database;

/** Initialze a CBLReplicatorTarget with a URL to the remote database.
    @param url  the url to the remote database.
    @result the CBLReplicatorTarget initialized the the given url. */
- (instancetype) initWithURL: (NSURL*)url;

/** Initialze a CBLReplicatorTarget with a local database.
    @param database the local database.
    @result the CBLReplicatorTarget initialized with the given local database. */
- (instancetype) initWithDatabase: (CBLDatabase*)database;

@end


/** Replicator configuration. */
@interface CBLReplicatorConfiguration : NSObject <NSCopying>

/** The local database to replicate with the target database. The database property is required. */
@property (nonatomic, nullable) CBLDatabase* database;

/** The replication target to replicate with. The replication target can be either a URL to
    the remote database or a local databaes. The target property is required. */
@property (nonatomic, nullable) CBLReplicatorTarget* target;

/** Replication type indicating the direction of the replication. The default value is
    .pushAndPull which is bidrectional. */
@property (nonatomic) CBLReplicatorType replicatorType;

/** Should the replicator stay active indefinitely, and push/pull changed documents?. The
    default value is NO. */
@property (nonatomic) BOOL continuous;

/** The conflict resolver for this replicator. The default value is nil, which means the default
    algorithm will be used, where the revision with more history wins. */
@property (nonatomic, nullable) id <CBLConflictResolver> conflictResolver;

/** If this property is non-null, the server is required to have this exact SSL/TLS certificate,
    or the connection will fail. */
@property (nonatomic, nullable) SecCertificateRef pinnedServerCertificate;

/** An Authenticator to authenticate with a remote server. Currently there are two types of
    the authenticators, CBLBasicAuthenticator and CBLSessionAuthenticator, supported. */
@property (nonatomic, nullable) CBLAuthenticator* authenticator;

/** Initialize a CBLReplicatorConfiguration with the default values. */
- (instancetype) init;

@end


NS_ASSUME_NONNULL_END
