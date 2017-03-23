//
//  FBXuQiuViewController.m
//  XiuYiXiu
//
//  Created by 付强 on 2017/3/16.
//  Copyright © 2017年 付强. All rights reserved.
//

#import "FBXuQiuViewController.h"
#import "FBXuQiuTableViewCell.h"
#import "FBXuQiu_2TableViewCell.h"
#import "FBXuQiu_3TableViewCell.h"
#import "FBXuQiu_4TableViewCell.h"
#import "FBXuQiu_5TableViewCell.h"
@interface FBXuQiuViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *table;
@end

@implementation FBXuQiuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    self.title = @"发布需求";
    self.navigationItem.rightBarButtonItem =  [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"message"] style:UIBarButtonItemStylePlain target:self action:nil];
    self.view.backgroundColor = [UIColor whiteColor];
    self.table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-44*FitWidth-64) style:UITableViewStylePlain];
    _table.delegate = self;
    _table.dataSource = self;
    [self.view addSubview:_table];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(0, self.view.frame.size.height-44*FitWidth-64, MyWidth, 44*FitWidth);
    [btn setTitle:@"确认发布" forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"确认发布bg"] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* myView = [[UIView alloc] init];
    myView.backgroundColor = [UIColor colorWithRed:242.0/255.0 green:242.0/255.0 blue:242.0/255.0 alpha:1];
    myView.frame = CGRectMake(0, 0, self.view.frame.size.width, 100);
    
    
    return myView;
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
        if (indexPath.row == 4) {
            static NSString *indentda = @"cel";
            
            FBXuQiu_2TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentda];
            if (cell == nil) {
                
                
                cell = [[[NSBundle mainBundle] loadNibNamed:@"FBXuQiu_2TableViewCell" owner:self options:nil]lastObject];
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                
            }
            cell.name.text = @"地址";
            cell.waite.placeholder = @"输入地址";
            cell.name.textColor = HeiSe;
            cell.waite.textColor = QianHui;
            return cell;
        }else{
            static NSString *indentda = @"cell";
            
            FBXuQiuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentda];
            if (cell == nil) {
                
                
                cell = [[[NSBundle mainBundle] loadNibNamed:@"FBXuQiuTableViewCell" owner:self options:nil]lastObject];
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                
            }
            if (indexPath.row == 0) {
                cell.name.text = @"名称";
                cell.waite.placeholder = @"取个信息明确的名称";
            }else if (indexPath.row == 1){
                cell.name.text = @"价格";
                cell.waite.placeholder = @"输入合适的价格(元)";
            
            }else if (indexPath.row == 2){
                cell.name.text = @"联系人";
                cell.waite.placeholder = @"联系人姓名";
            }else if (indexPath.row == 3){
                cell.name.text = @"联系方式";
                cell.waite.placeholder = @"输入手机号码";
            }
            cell.name.textColor = HeiSe;
            cell.waite.textColor = QianHui;
            return cell;
        }
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            static NSString *indentda = @"celll";
            
            FBXuQiu_3TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentda];
            if (cell == nil) {
                
                
                cell = [[[NSBundle mainBundle] loadNibNamed:@"FBXuQiu_3TableViewCell" owner:self options:nil]lastObject];
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                
            }
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.xuanze.textColor = QianHui;
            cell.name.textColor = HeiSe;
            return cell;
            
        }else if (indexPath.row == 1){
            static NSString *indentda = @"cellll";
            
            FBXuQiuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentda];
            if (cell == nil) {
                
                
                cell = [[[NSBundle mainBundle] loadNibNamed:@"FBXuQiuTableViewCell" owner:self options:nil]lastObject];
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                
            }
            cell.name.textColor = HeiSe;
            cell.name.text = @"有效期限";
            cell.waite.textColor = QianHui;
            cell.waite.placeholder = @"输入截止时间";
            return cell;
        
        }else{
            static NSString *indentda = @"celllal";
            
            FBXuQiu_4TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentda];
            if (cell == nil) {
                
                
                cell = [[[NSBundle mainBundle] loadNibNamed:@"FBXuQiu_4TableViewCell" owner:self options:nil]lastObject];
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                
            }
            cell.name.textColor = HeiSe;
            cell.waite.textColor = QianHui;
//            cell.waite.text = @"输入具体的求助信息，清楚准确的信息更容易被帮助";
            return cell;
        }
    
    }else{
        static NSString *indentda = @"cellalal";
        
        FBXuQiu_5TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentda];
        if (cell == nil) {
            
            
            cell = [[[NSBundle mainBundle] loadNibNamed:@"FBXuQiu_5TableViewCell" owner:self options:nil]lastObject];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            
        }
        
        return cell;
    
    }

    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 5;
    }else if (section == 1){
        return 3;
    }
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 10;
    }
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 44*FitWidth;
    }else if (indexPath.section == 1){
        if (indexPath.row == 2) {
            return 93*FitWidth;
        }else{
            return 44*FitWidth;
        }
    
    }
    return 93*FitWidth;
    
    
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
