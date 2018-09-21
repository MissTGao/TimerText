//
//  ViewController.m
//  Test
//
//  Created by HTYL on 2018/6/28.
//  Copyright © 2018年 HTYL. All rights reserved.
//

#import "ViewController.h"
#import "AAAACell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) NSArray * data;
@property (strong, nonatomic) AAAACell * cell;
@property (assign, nonatomic) NSInteger timerLength;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.data = @[@20,@50,@100,@300,@500,@1000,@121,@34,@434,@48];
    UITableView *tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 375, 667)];
    tableview.delegate = self;
    tableview.dataSource = self;
    [self.view addSubview:tableview];
    
    NSTimer *timer = [[NSTimer alloc] initWithFireDate:[NSDate date] interval:1 target:self selector:@selector(timerTest) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];


}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AAAACell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (!cell) {
        cell = [[AAAACell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
    }
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    cell.label.text =  [self.data[indexPath.row] stringValue];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.cell = [tableView cellForRowAtIndexPath:indexPath];
    self.timerLength = self.cell.label.text.integerValue;
}

-(void)timerTest{
    self.cell.label.text = [NSString stringWithFormat:@"%lu",--self.timerLength];
}
@end



