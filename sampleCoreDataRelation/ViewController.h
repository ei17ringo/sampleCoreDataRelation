//
//  ViewController.h
//  sampleCoreDataRelation
//
//  Created by Eriko Ichinohe on 2015/10/10.
//  Copyright (c) 2015年 Eriko Ichinohe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Area.h"
#import "Friend.h"

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{

    int *_area_no;
    int *_friend_no;
    NSArray *_areaArray;
    NSArray *_friendArray;
}

@property (strong,nonatomic)NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (weak, nonatomic) IBOutlet UIButton *addArea;
- (IBAction)tapAddArea:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *addFriend;
- (IBAction)tapAddFriend:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *inputAreaText;
@property (weak, nonatomic) IBOutlet UITableView *areaTable;
@property (weak, nonatomic) IBOutlet UITableView *friendTable;
- (IBAction)tapAreaReturn:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *inputFriendText;

@end

