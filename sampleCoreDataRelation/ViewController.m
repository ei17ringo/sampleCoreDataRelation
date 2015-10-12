//
//  ViewController.m
//  sampleCoreDataRelation
//
//  Created by Eriko Ichinohe on 2015/10/10.
//  Copyright (c) 2015年 Eriko Ichinohe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //AppDelegateで宣言されているCoreData用のManagedObjectContextを取得
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    self.managedObjectContext = context;
    
    NSDictionary *options = @{};
    
    _areaArray = [self selectAllData:options];

    
    self.areaTable.dataSource = self;
    self.areaTable.delegate = self;
    
    self.friendTable.dataSource = self;
    self.friendTable.delegate = self;
    
    _area_no = 0;
    _friend_no = 0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView.tag == 1) {
        return _areaArray.count;
    }else{
        return _friendArray.count;
    }
}

//行に表示するデータ（セルの生成）
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *CellIdentifier = @"Cell";
    
    //再利用可能なセルオブジェクトの生成
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil){
        //セルの初期化
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if (tableView.tag == 1) {
        cell.textLabel.text = [NSString stringWithFormat:@"%@",_areaArray[indexPath.row]];
    }else{
        cell.textLabel.text = [NSString stringWithFormat:@"%@",_friendArray[indexPath.row]];
    
    }
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapAddArea:(id)sender {
    //Areaに追加
    //新規追加したいデータを作成
    NSString *area_name = self.inputAreaText.text;
    _area_no++;
    NSNumber *newAreaNo = [[NSNumber alloc] initWithInt:_area_no];
    
    //CoreDataにデータを保存する
    Area *area = [NSEntityDescription insertNewObjectForEntityForName:@"Area" inManagedObjectContext:self.managedObjectContext];
    
    [area setArea_name:area_name];
    [area setArea_no:newAreaNo];
    
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        //エラー発生
        NSLog(@"%@",error);
    }else{
        NSLog(@"保存成功");
        //テーブル再読み込み
        [self reloadAreaTable];
    }

    
}

//エリアデータの取得とテーブルの再描画
-(void)reloadAreaTable{
    //データ取得
    NSDictionary *options = @{};
    
    _areaArray = [self selectAllData:options];
    
//    for (Area *area in _areaArray) {
//        NSLog(@"%@",area.area_name);
//    }

    [self.areaTable reloadData];
}

//CoreDataからデータを取得し配列にセット
-(NSArray *)selectAllData:(NSDictionary *)options{
    //fetch設定を生成
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Area"];
    
    //sort(並び順)条件を設定
//    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"created" ascending:NO];
//    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
//    [fetchRequest setSortDescriptors:sortDescriptors];
    
    //managedObjectContextからデータを取得
    NSArray *fetchResults = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    
    NSArray *results = [[NSArray alloc]init];
    
    for (Area *area in fetchResults) {
        results = [results arrayByAddingObject:area.area_name];
    }
    
    
    return results;
}

- (IBAction)tapAddFriend:(id)sender {
    //指定されているエリアを取得
    NSLog(@"%ld",self.areaTable.indexPathForSelectedRow.row);
    
    //Friendに追加
    //新規追加したいデータを作成
    NSString *friend_name = self.inputFriendText.text;
    _friend_no++;
    NSNumber *newFriendNo = [[NSNumber alloc] initWithInt:_friend_no];
    
    //CoreDataにデータを保存する
    Friend *friend = [NSEntityDescription insertNewObjectForEntityForName:@"Friend" inManagedObjectContext:self.managedObjectContext];
    
    [friend setName:friend_name];
    //[friend setArea:];
    
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        //エラー発生
        NSLog(@"%@",error);
    }else{
        NSLog(@"保存成功");
        //テーブル再読み込み
        [self reloadAreaTable];
    }

    
}
- (IBAction)tapAreaReturn:(id)sender {
}
@end
