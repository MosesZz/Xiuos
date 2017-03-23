//
//  FondViewController.m
//  XiuYiXiu
//
//  Created by 付强 on 2017/3/15.
//  Copyright © 2017年 付强. All rights reserved.
//

#import "FondViewController.h"
#import "Fond_1CollectionViewCell.h"
#import "Fond_3CollectionViewCell.h"
#import "Fond_2CollectionViewCell.h"
@interface FondViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collection;
@end
static NSString *headId = @"head";
@implementation FondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"发现";
    UIBarButtonItem * backButtonItem = [[UIBarButtonItem alloc] init];
    backButtonItem.title = @"";
    self.navigationItem.backBarButtonItem = backButtonItem;
    [self.navigationController.navigationBar setTitleTextAttributes:
     
     @{NSFontAttributeName:[UIFont fontWithName:@"Arial-BoldMT" size:(20.0)],
       
       NSForegroundColorAttributeName:[UIColor whiteColor]}];

    self.navigationItem.rightBarButtonItem =  [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"message"] style:UIBarButtonItemStylePlain target:self action:nil];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:255.0/255.0 green:82.0/255.0 blue:57.0/255.0 alpha:1]];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    
    UICollectionViewFlowLayout *laout = [[UICollectionViewFlowLayout alloc] init];
    //    [self.navigationController.navigationBar setTranslucent:NO];
    
    laout.scrollDirection = UICollectionViewScrollDirectionVertical;
    laout.minimumInteritemSpacing = 0;
    laout.minimumLineSpacing = 0;
    _collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, MyHight-64-50) collectionViewLayout:laout];
    _collection.delegate        = self;
    _collection.dataSource      = self;

    [_collection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader  withReuseIdentifier:headId];
    _collection.backgroundColor = [UIColor whiteColor];
    _collection.pagingEnabled   = NO;
        [_collection registerClass:[Fond_1CollectionViewCell class] forCellWithReuseIdentifier:@"celll"];
     [_collection registerClass:[Fond_2CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    

    _collection.backgroundColor = [UIColor colorWithRed:242.0/255.0 green:242.0/255.0 blue:242.0/255.0 alpha:1];
    
    [self.view addSubview:_collection];

    
    
    
    
}
#pragma mark-collection代理
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
                return CGSizeMake(MyWidth, 300*MyWidth/750);
    }else{
    if (indexPath.item == 0) {
        return CGSizeMake(MyWidth, 44*FitWidth);
    }else{
        return CGSizeMake(MyWidth/4, 102*FitWidth);
    }
    }
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    return 5;
    
}



- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return CGSizeMake(0, 0);
    }
        return CGSizeMake(0, 10);
    
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 4;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        UINib *nib = [UINib nibWithNibName:@"Fond_3CollectionViewCell" bundle:[NSBundle mainBundle]];
        [_collection registerNib:nib forCellWithReuseIdentifier:@"Fond_3CollectionViewCell"];
        
        Fond_3CollectionViewCell *cell = [[Fond_3CollectionViewCell alloc]init];
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Fond_3CollectionViewCell" forIndexPath:indexPath];
      
        
        return cell;
    }else{
    if (indexPath.item == 0) {
        
        UINib *nib = [UINib nibWithNibName:@"Fond_1CollectionViewCell" bundle:[NSBundle mainBundle]];
        [_collection registerNib:nib forCellWithReuseIdentifier:@"Fond_1CollectionViewCell"];
        
        Fond_1CollectionViewCell *cell = [[Fond_1CollectionViewCell alloc]init];
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Fond_1CollectionViewCell" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];

        if (indexPath.section == 1) {
            cell.name.textColor = [UIColor orangeColor];
            cell.name.text = @"团购商城";
        }else if (indexPath.section == 2){
            cell.name.textColor = [UIColor colorWithRed:0 green:145.0/255.0 blue:234.0/255.0 alpha:1];
            cell.name.text = @"美食外卖";
        }else{
            cell.name.textColor = [UIColor colorWithRed:76.0/255.0 green:175.0/255.0 blue:80.0/255.0 alpha:1];
            cell.name.text = @"生活便民";
        }
        return cell;

    }else{
        UINib *nib = [UINib nibWithNibName:@"Fond_2CollectionViewCell" bundle:[NSBundle mainBundle]];
        [_collection registerNib:nib forCellWithReuseIdentifier:@"Fond_2CollectionViewCell"];
        
        Fond_2CollectionViewCell *cell = [[Fond_2CollectionViewCell alloc]init];
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Fond_2CollectionViewCell" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        cell.name.textColor = [UIColor colorWithRed:112.0/255.0 green:112.0/255.0 blue:112.0/255.0 alpha:1];
        
        return cell;
    
    }
    }
    
    
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    
    UICollectionReusableView *h = [collectionView  dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headId forIndexPath:indexPath];

    h.backgroundColor = [UIColor colorWithRed:247.0/255.0 green:247.0/255.0 blue:247.0/255.0 alpha:1];
    
    return h;
    
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    if (section == 1) {
        return UIEdgeInsetsMake(0*self.view.frame.size.width/320, 0*self.view.frame.size.width/320, 0*self.view.frame.size.width/320, 0*self.view.frame.size.width/320);
    }else{
        return  UIEdgeInsetsMake(0, 0, 0,0);
    }
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
