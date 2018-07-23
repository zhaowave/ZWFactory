//
//  ViewController.m
//  ZWFactory
//
//  Created by zhaowei on 2018/7/23.
//  Copyright © 2018年 zhaowei. All rights reserved.
//

#import "ViewController.h"
#import <Weibo_SDK/WeiboSDK.h>
#import "ZTestItem.h"
#import "ZShareViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = [[ZTestDataManager sharedInstance] loadTestItems];
    [self setupUI];
}

- (void) setupUI {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *str = @"mycellid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:str];
        cell.accessoryType = UITableViewCellAccessoryDetailButton;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    ZTestItem *item = self.dataArray[indexPath.row];
    cell.textLabel.text = item.title;
    cell.detailTextLabel.text = item.detail;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ZTestItem *item = self.dataArray[indexPath.row];
    UIViewController *vc = [NSClassFromString(item.viewControllerName) new];
    [self.navigationController pushViewController:vc animated:YES];
//    [WeiboSDK shareToWeibo:@"fdaf"];
//    return;
//    WBMessageObject *wbmessage = [WBMessageObject message];
//    // 消息的图片内容中，图片数据不能为空并且大小不能超过10M
//    WBImageObject *imageObject = [WBImageObject object];
//    UIImage *image = [UIImage imageNamed:@"testImage"];
//    imageObject.imageData = UIImagePNGRepresentation(image);
//    wbmessage.imageObject = imageObject;
//    wbmessage.text = @"下载地址 https://itunes.apple.com/cn/app/jie-zou-da-shi/id493901993?mt=8";
//    WBSendMessageToWeiboRequest *request = [WBSendMessageToWeiboRequest requestWithMessage:wbmessage];
//    [WeiboSDK sendRequest:request];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
