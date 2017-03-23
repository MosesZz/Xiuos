//
//  HelpTaViewController.m
//  XiuYiXiu
//
//  Created by 付强 on 2017/3/15.
//  Copyright © 2017年 付强. All rights reserved.
//

#import "HelpTaViewController.h"
#import "Helpme_1TableViewCell.h"
#import "ToptableTableViewCell.h"
#import "HelpTaSearchViewController.h"
#import "HelpTa_1TableViewCell.h"
#import "HelpTaDetialViewController.h"
@interface HelpTaViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSInteger toucell;
}
@property (nonatomic, strong) UITableView *table;
@property (nonatomic, strong) UITableView *toptable;

@end

@implementation HelpTaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"帮帮Ta";
    UIBarButtonItem * backButtonItem = [[UIBarButtonItem alloc] init];
    backButtonItem.title = @"";
    self.navigationItem.backBarButtonItem = backButtonItem;
    [self.navigationController.navigationBar setTitleTextAttributes:
     
     @{NSFontAttributeName:[UIFont fontWithName:@"Arial-BoldMT" size:(20.0)],
       
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    
    self.navigationItem.rightBarButtonItem =  [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"search"] style:UIBarButtonItemStylePlain target:self action:@selector(touyou)];
    
    
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:255.0/255.0 green:82.0/255.0 blue:57.0/255.0 alpha:1]];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    UIView *topview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MyWidth, 44)];
    topview.backgroundColor = [UIColor whiteColor];
    
    for (int i = 0; i < 3; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(MyWidth/3*i, 0, MyWidth/3, 44);
        btn.backgroundColor = [UIColor whiteColor];
        if (i == 0) {
            [btn setTitle:@"全部" forState:UIControlStateNormal];
        }else if (i == 1){
            [btn setTitle:@"价格" forState:UIControlStateNormal];
        }else{
            [btn setTitle:@"距离" forState:UIControlStateNormal];
        }
        
        
        UIImage *imgArrow = [UIImage imageNamed:@"全部-上标@2x.png"];
        
        if ( i == 0) {
            
            
            if (self.view.frame.size.width==320) {
                [btn setImageEdgeInsets:UIEdgeInsetsMake(0, btn.frame.size.width/2.5, 0, -btn.frame.size.width/2.5)];
            }else{
                [btn setImageEdgeInsets:UIEdgeInsetsMake(0, btn.frame.size.width/3, 0, -btn.frame.size.width/3)];
            }
            [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, -imgArrow.size.width, 0, imgArrow.size.width)];
            [btn setImage:imgArrow forState:UIControlStateNormal];
        }
        btn.tag = i+100;
        [btn setTitleColor:HeiSe forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(toutop:) forControlEvents:UIControlEventTouchUpInside];
        [topview addSubview:btn];
    }
    
    UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(0, 43.7, MyWidth, 0.3)];
    l.backgroundColor = QianHui;
    [topview addSubview:l];
    [self.view addSubview:topview];
    
    self.table = [[UITableView alloc] initWithFrame:CGRectMake(0,44, MyWidth, MyHight-44-50-64) style:UITableViewStylePlain];
    _table.delegate = self;
    _table.dataSource = self;
    _table.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_table];
    
    self.toptable = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, MyWidth, MyHight-44-50-64) style:UITableViewStylePlain];
    _toptable.delegate = self;
    _toptable.dataSource = self;
    _toptable.separatorStyle = UITableViewCellSeparatorStyleNone;
    _toptable.tag = 1001;
    [self.view addSubview: _toptable];
    _toptable.hidden = YES;
}
-(void)touyou{
    HelpTaSearchViewController *sear = [[HelpTaSearchViewController alloc] init];
    [self.navigationController pushViewController:sear animated:YES];
    
}
-(void)toutop:(UIButton *)btn{
    if ([btn.titleLabel.text isEqualToString:@"全部"]) {
        
        if (_toptable.hidden == YES) {
            _toptable.hidden = NO;
            [btn setImage:[UIImage imageNamed:@"全部-下"] forState:UIControlStateNormal];
        }else{
            _toptable.hidden = YES;
            [btn setImage:[UIImage imageNamed:@"全部-上标"] forState:UIControlStateNormal];
        }
    }else{
        _toptable.hidden = YES;
        UIButton *btna = [self.view viewWithTag:100];
        [btna setImage:[UIImage imageNamed:@"全部-上标"] forState:UIControlStateNormal];
    }
    
}



- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (tableView.tag == 1001) {
        
        UIView* myView = [[UIView alloc] init];
        myView.backgroundColor = [UIColor whiteColor];
        myView.frame = CGRectMake(0, 0, self.view.frame.size.width, 50*FitWidth);
        
        UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(16, 0, MyWidth-16, 50*FitWidth)];
        if (section == 0) {
            lable.text = @"全部";
        }else{
            lable.text = @"家政";
        }
        lable.font = [UIFont fontWithName:@"Arial-BoldMT" size:19];
        lable.textColor = HeiSe;
        [myView addSubview:lable];
        UILabel *xian = [[UILabel alloc] initWithFrame:CGRectMake(16, 50*FitWidth-0.3, MyWidth-16, 0.3)];
        xian.backgroundColor = QianHui;
        [myView addSubview:xian];
        
        UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
        if (section != 0) {
            
            
            if (toucell == section) {
                [bt setImage:[UIImage imageNamed:@"家政-上标"] forState:UIControlStateNormal];
            }else{
                [bt setImage:[UIImage imageNamed:@"维修-下标"] forState:UIControlStateNormal];
            }
        }
        bt.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        bt.frame = CGRectMake(16, 0, MyWidth-16-16, 50*FitWidth);
        [bt addTarget:self action:@selector(toucell:) forControlEvents:UIControlEventTouchUpInside];
        bt.tag = section+1;
        [myView addSubview:bt];
        return myView;
    }else{
        UIView* myView = [[UIView alloc] init];
        myView.backgroundColor = [UIColor colorWithRed:242.0/255.0 green:242.0/255.0 blue:242.0/255.0 alpha:1];
        myView.frame = CGRectMake(0, 0, self.view.frame.size.width, 100);
        
        
        return myView;
    }
}
-(void)toucell:(UIButton *)btn{
    if (btn.tag == 1) {
        _toptable.hidden = YES;
    }
    
    
    toucell = btn.tag - 1;
    [_toptable reloadData];
    
    UIButton *btna = [self.view viewWithTag:100];
    [btna setImage:[UIImage imageNamed:@"全部-上标"] forState:UIControlStateNormal];
    
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
        
        HelpTa_1TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentda];
        if (cell == nil) {
            
            
            cell = [[[NSBundle mainBundle] loadNibNamed:@"HelpTa_1TableViewCell" owner:self options:nil]lastObject];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            
        }
        
        cell.price.textColor = HongSe;
        cell.name.textColor = HeiSe;
        cell.leixing.textColor = QianHui;
        cell.km.textColor = QianHei;
        cell.date.textColor = QianHei;
        cell.img.layer.cornerRadius = cell.img.frame.size.width/2;
        cell.img.layer.masksToBounds = YES;
        UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(0, 79.7, MyWidth, 0.3)];
        l.backgroundColor = QianHui;
        [cell addSubview:l];
        return cell;
    }
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView.tag == 1001) {
        if (section == 0) {
            return 0;
        }
        if (section == toucell) {
            return 4;
        }else{
            return 0;
        }
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
    return 80;
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HelpTaDetialViewController *hel = [[HelpTaDetialViewController alloc] init];
    hel.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:hel animated:YES];
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
