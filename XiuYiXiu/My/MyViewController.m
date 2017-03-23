//
//  MyViewController.m
//  XiuYiXiu
//
//  Created by 付强 on 2017/3/15.
//  Copyright © 2017年 付强. All rights reserved.
//

#import "MyViewController.h"
#import "My_1TableViewCell.h"
#import "My_2TableViewCell.h"
#import "My_3TableViewCell.h"
#import "LoginViewController.h"
@interface MyViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *table;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    self.table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, MyWidth, MyHight-50) style:UITableViewStylePlain];
    _table.delegate = self;
    _table.dataSource = self;
    _table.separatorStyle = UITableViewCellSeparatorStyleNone;
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
    

    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
            
        
        static NSString *indentda = @"cela";
        
        My_1TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentda];
        if (cell == nil) {
            
            
            cell = [[[NSBundle mainBundle] loadNibNamed:@"My_1TableViewCell" owner:self options:nil]lastObject];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            
        }
            NSLog(@"%f-%f",cell.img.frame.size.height,cell.img.frame.size.width);
        return cell;
        }else{
            static NSString *indentda = @"celaa";
            
            My_2TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentda];
            if (cell == nil) {
                
                
                cell = [[[NSBundle mainBundle] loadNibNamed:@"My_2TableViewCell" owner:self options:nil]lastObject];
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                
            }
            cell.qianbao.textColor = HeiSe;
            cell.fabu.textColor = HeiSe;
            cell.dingdan.textColor = HeiSe;
            return cell;
        }
        
    }else{
    
        static NSString *indentda = @"cela3a";
        
        My_3TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentda];
        if (cell == nil) {
            
            
            cell = [[[NSBundle mainBundle] loadNibNamed:@"My_3TableViewCell" owner:self options:nil]lastObject];
            [cell setSelectionStyle:UITableViewCellSelectionStyleDefault];
            
        }
        if (indexPath.section == 1) {
            if (indexPath.row == 0) {
                cell.img.image = [UIImage imageNamed:@"评价"];
                cell.name.textColor = HeiSe;
                cell.name.text = @"评价";
            }else{
                cell.img.image = [UIImage imageNamed:@"关注"];
                cell.name.textColor = HeiSe;
                cell.name.text = @"关注";
            }
        }else if(indexPath.section == 2){
        
            cell.img.image = [UIImage imageNamed:@"地址2"];
            cell.name.textColor = HeiSe;
            cell.name.text = @"地址";
        }else{
            cell.img.image = [UIImage imageNamed:@"客服"];
            cell.name.textColor = HeiSe;
            cell.name.text = @"联系客服";
        }
        
        return cell;
    }

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }else if (section == 1){
        return 2;
    }
            return 1;

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 4;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
                return 220.5*FitWidth;
        }else{
            return 79;
        }
    }
    return 61;
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    LoginViewController *login = [[LoginViewController alloc] init];
    
    [self presentViewController:login animated:YES completion:nil];
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

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
