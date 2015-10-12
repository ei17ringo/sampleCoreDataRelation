//
//  Friend.h
//  sampleCoreDataRelation
//
//  Created by Eriko Ichinohe on 2015/10/10.
//  Copyright (c) 2015年 Eriko Ichinohe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NSManagedObject;

@interface Friend : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSManagedObject *area;

@end
