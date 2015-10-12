//
//  Area.h
//  sampleCoreDataRelation
//
//  Created by Eriko Ichinohe on 2015/10/10.
//  Copyright (c) 2015年 Eriko Ichinohe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Friend;

@interface Area : NSManagedObject

@property (nonatomic, retain) NSNumber * area_no;
@property (nonatomic, retain) NSString * area_name;
@property (nonatomic, retain) NSSet *friend;
@end

@interface Area (CoreDataGeneratedAccessors)

- (void)addFriendObject:(Friend *)value;
- (void)removeFriendObject:(Friend *)value;
- (void)addFriend:(NSSet *)values;
- (void)removeFriend:(NSSet *)values;

@end
