//
//  HelpTaDetialViewController.m
//  XiuYiXiu
//
//  Created by 付强 on 2017/3/20.
//  Copyright © 2017年 付强. All rights reserved.
//

#import "HelpTaDetialViewController.h"
#import "HelpTa_2TableViewCell.h"
#import "Help_3TableViewCell.h"
#import "Help_4TableViewCell.h"
@interface HelpTaDetialViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    CGFloat heii;
}
@property (nonatomic, strong) UITableView *table;

@end

@implementation HelpTaDetialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"帮帮Ta详情";
    self.table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-44*FitWidth-64) style:UITableViewStylePlain];
    _table.delegate = self;
    _table.dataSource = self;
    _table.backgroundColor =[UIColor colorWithRed:242.0/255.0 green:242.0/255.0 blue:242.0/255.0 alpha:1];

    [self.view addSubview:_table];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(0, self.view.frame.size.height-44*FitWidth-64, MyWidth, 44*FitWidth);
    [btn setTitle:@"立刻帮助" forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"确认发布bg"] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:(17.0)],
    [self.view addSubview:btn];
    
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, MyWidth, MyWidth/750*423)];
    img.backgroundColor = [UIColor orangeColor];
    _table.tableHeaderView = img;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (tableView.tag == 1001) {
        
        UIView* myView = [[UIView alloc] init];
        myView.backgroundColor = [UIColor whiteColor];
        myView.frame = CGRectMake(0, 0, self.view.frame.size.width, 50*FitWidth);
        
        
        
        return myView;
    }else{
        UIView* myView = [[UIView alloc] init];
        myView.backgroundColor = [UIColor colorWithRed:242.0/255.0 green:242.0/255.0 blue:242.0/255.0 alpha:1];
        myView.frame = CGRectMake(0, 0, self.view.frame.size.width, 100);
        
        
        return myView;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView* myView = [[UIView alloc] init];
    myView.backgroundColor = [UIColor colorWithRed:242.0/255.0 green:242.0/255.0 blue:242.0/255.0 alpha:1];
    myView.frame = CGRectMake(0, 0, self.view.frame.size.width, 100);
    
    
    return myView;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
    
        static NSString *indentda = @"cel";
        
        HelpTa_2TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentda];
        if (cell == nil) {
            
            
            cell = [[[NSBundle mainBundle] loadNibNamed:@"HelpTa_2TableViewCell" owner:self options:nil]lastObject];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            
        }
        
        cell.name.text = @"需要家政打扫清理家里卫生";
        cell.name.textColor = HeiSe;
        cell.price.text = @"30/天";
        cell.price.textColor = HongSe;
        cell.date.text = @"求助截止时间: 2017/05/31";
        cell.date.textColor = QianHei;
        cell.detial.text = @"经常加班，偶尔需要出差，所以家里需要找个人帮忙清扫最好可以找个长期的，谢谢经常加班，偶尔需要出差，所以家里需要找个人帮忙清扫最好可以找个长期的，谢谢经常加班，偶尔需要出差，所以家里需要找个人帮忙清扫最好可以找个长期的，谢谢";
        cell.detial.textColor = QianHui;
        
        
        heii = [self heightForString:cell.detial.text fontSize:cell.detial.font andWidth:cell.detial.frame.size.width];
        
        
        heii = heii+10;
        return cell;
    
    }else if (indexPath.section == 1){
        
        static NSString *indentda = @"cela";
        
        Help_3TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentda];
        if (cell == nil) {
            
            
            cell = [[[NSBundle mainBundle] loadNibNamed:@"Help_3TableViewCell" owner:self options:nil]lastObject];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            
        }
        
        cell.name.textColor = QianHei;
        
        return cell;
    
    }else{
    
        
        static NSString *indentda = @"ceala";
        
        Help_4TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentda];
        if (cell == nil) {
            
            
            cell = [[[NSBundle mainBundle] loadNibNamed:@"Help_4TableViewCell" owner:self options:nil]lastObject];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            
        }
        
        cell.touxiang.layer.cornerRadius = cell.touxiang.frame.size.width/2;
        cell.touxiang.layer.masksToBounds = YES;
        
        cell.name.textColor = HeiSe;
        cell.detial.textColor = QianHui;
        
        return cell;
    }
    
}
- (float)heightForString:(NSString *)value fontSize:(UIFont *)fontSize andWidth:(float)width
{
    CGSize sizeToFit = [value sizeWithFont:fontSize constrainedToSize:CGSizeMake(width, CGFLOAT_MAX) lineBreakMode:0];//此处的换行类型（lineBreakMode）可根据自己的实际情况进行设置
    return sizeToFit.height;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
 
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
 
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 89+heii;
    }else if (indexPath.section == 1){
        return 44*FitWidth;
    }else{
        return 80;
    }
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
