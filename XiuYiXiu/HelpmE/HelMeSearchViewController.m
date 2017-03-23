//
//  HelMeSearchViewController.m
//  XiuYiXiu
//
//  Created by 付强 on 2017/3/20.
//  Copyright © 2017年 付强. All rights reserved.
//

#import "HelMeSearchViewController.h"
#import "FTextField.h"
#import "Helpme_1TableViewCell.h"
#import "ToptableTableViewCell.h"
@interface HelMeSearchViewController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
{
    FTextField *search;
}
@property (nonatomic, strong) UITableView *table;
@end

@implementation HelMeSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];

      UIImageView *left  = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search11"]];
    search = [[FTextField alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width-80*320/self.view.frame.size.width*2, 25*self.view.frame.size.height/568) Icon:left];
    search.placeholder = @"输入关键词";
    search.clearButtonMode = UITextFieldViewModeAlways;
    search.returnKeyType =UIReturnKeySearch;
    search.clearsOnBeginEditing = YES;
    search.layer.cornerRadius= 5;
    search.backgroundColor = [UIColor whiteColor];
    search.textColor = [UIColor colorWithRed:85.0/255.0 green:85.0/255.0 blue:85.0/255.0 alpha:1];
    search.clearButtonMode = UITextFieldViewModeWhileEditing;
    search.delegate = self;
    search.font = [UIFont systemFontOfSize:15];
    self.navigationItem.titleView = search;
    self.navigationItem.rightBarButtonItem =  [[UIBarButtonItem alloc]initWithTitle:@"搜索" style:UIBarButtonItemStylePlain target:self action:nil];
    self.table = [[UITableView alloc] initWithFrame:CGRectMake(0,0, MyWidth, MyHight-64) style:UITableViewStylePlain];
    _table.delegate = self;
    _table.dataSource = self;
    [self.view addSubview:_table];
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
    
    if (tableView.tag == 1001) {
        
        static NSString *indentda = @"cela";
        
        ToptableTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentda];
        if (cell == nil) {
            
            
            cell = [[[NSBundle mainBundle] loadNibNamed:@"ToptableTableViewCell" owner:self options:nil]lastObject];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            
        }
        UILabel *xian = [[UILabel alloc] initWithFrame:CGRectMake(65, 40*FitWidth-0.3, MyWidth-16, 0.3)];
        xian.backgroundColor = QianHui;
        [cell addSubview:xian];
        cell.name.textColor = QianHei;
        cell.name.text = @"扫地";
        return cell;
    }else{
        
        static NSString *indentda = @"cel";
        
        Helpme_1TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentda];
        if (cell == nil) {
            
            
            cell = [[[NSBundle mainBundle] loadNibNamed:@"Helpme_1TableViewCell" owner:self options:nil]lastObject];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            
        }
        
        cell.price.textColor = HongSe;
        cell.name.textColor = HeiSe;
        cell.detial.textColor = QianHui;
        cell.km.textColor = QianHei;
        return cell;
    }
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView.tag == 1001) {
      
            return 0;
        
    }else{
        return 10;
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView.tag == 1001) {
        return 5;
    }
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (tableView.tag == 1001) {
        return 50*FitWidth;
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag == 1001) {
        
        return 40*FitWidth;
    }
    return 100;
    
    
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
