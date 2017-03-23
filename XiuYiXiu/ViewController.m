//
//  ViewController.m
//  XiuYiXiu
//
//  Created by 付强 on 2017/3/14.
//  Copyright © 2017年 付强. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "FBXuQiuViewController.h"
#import "FBFuWuViewController.h"
#import "UIImageView+WebCache.h"
#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件
#import <BaiduMapAPI_Location/BMKLocationComponent.h>//引入定位功能所有的头文件
#define MYBUNDLE_NAME @ "mapapi.bundle"
#define MYBUNDLE_PATH [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: MYBUNDLE_NAME]
#define MYBUNDLE [NSBundle bundleWithPath: MYBUNDLE_PATH]
@interface ViewController ()<BMKMapViewDelegate,BMKLocationServiceDelegate>
{
        BMKCircle* circle;
        BMKPolygon* polygon;
        BMKPolygon* polygon2;
        BMKPolyline* polyline;
        BMKPolyline* colorfulPolyline;
        BMKArcline* arcline;
        BMKGroundOverlay* ground2;
        BMKPointAnnotation* pointAnnotation;
        BMKPointAnnotation* animatedAnnotation;
        BMKMapView* _mapView;
        UIImageView *bac_img;
        BMKLocationService* _locService;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"咻亿咻";
    UIBarButtonItem * backButtonItem = [[UIBarButtonItem alloc] init];
    backButtonItem.title = @"";
    self.navigationItem.backBarButtonItem = backButtonItem;
    [self.navigationController.navigationBar setTitleTextAttributes:
     
     @{NSFontAttributeName:[UIFont fontWithName:@"Arial-BoldMT" size:(20.0)],
       
       NSForegroundColorAttributeName:[UIColor whiteColor]}];

    
    UIView *backBtnView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 20)];
    backBtnView1.backgroundColor = [UIColor clearColor];
    UILabel *lname = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 20)];
    lname.textColor = [UIColor whiteColor];
    lname.text = @"朝阳";
//    lname.font = [UIFont systemFontOfSize:11];
    [backBtnView1 addSubview:lname];
    
    UIImage *xiaobiantu = [UIImage imageNamed:@"下标"];
    UIImageView *xiabiao = [[UIImageView alloc] initWithFrame:CGRectMake(40, (20-xiaobiantu.size.height)/2, xiaobiantu.size.width, xiaobiantu.size.height)];
    xiabiao.image = xiaobiantu;
    [backBtnView1 addSubview:xiabiao];
    
    
    
    
    
    self.navigationItem.rightBarButtonItem =  [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"message"] style:UIBarButtonItemStylePlain target:self action:nil];
    
    self.navigationItem.leftBarButtonItem =  [[UIBarButtonItem alloc]initWithCustomView:backBtnView1];
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:255.0/255.0 green:82.0/255.0 blue:57.0/255.0 alpha:1]];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    
    //适配ios7
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0))
    {
        //        self.edgesForExtendedLayout=UIRectEdgeNone;
        self.navigationController.navigationBar.translucent = NO;
    }
    
    _mapView = [[BMKMapView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64-50)];
    [self.view addSubview:_mapView];
    _locService = [[BMKLocationService alloc]init];
    _locService.delegate = self;
    [_locService startUserLocationService];
    _mapView.showsUserLocation = NO;//先关闭显示的定位图层
    _mapView.userTrackingMode = BMKUserTrackingModeNone;//设置定位的状态


    //设置地图缩放级别
    [_mapView setZoomLevel:9];
    _mapView.delegate = self;

    [self addAnimatedAnnotation];
    
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(self.view.frame.size.width-55*FitWidth-10, MyHight-55*FitWidth-20-64-50, 55*FitWidth, 55*FitWidth);
    btn.backgroundColor = [UIColor colorWithRed:49.0/255.0 green:49.0/255.0 blue:49.0/255.0 alpha:1];
    btn.layer.cornerRadius = 55*FitWidth/2;
    btn.layer.masksToBounds = YES;
    [btn setTitle:@"发布" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(fabu) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: btn];
    
    
    UIApplication *appli=[UIApplication sharedApplication];
    AppDelegate *app=appli.delegate;
    bac_img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, MyWidth, MyHight)];
    bac_img.image = [UIImage imageNamed:@"black_bg"];
    bac_img.userInteractionEnabled = YES;
    UIButton *btna = [UIButton buttonWithType:UIButtonTypeCustom];
    btna.frame = CGRectMake((MyWidth-70*FitWidth)/2, MyHight/2, 70*FitWidth, 70*FitWidth);
    [btna setImage:[UIImage imageNamed:@"需要帮助"] forState:UIControlStateNormal];
    [btna addTarget:self action:@selector(xuyao) forControlEvents:UIControlEventTouchUpInside];
    [bac_img addSubview:btna];
    UILabel *helpme = [[UILabel alloc] initWithFrame:CGRectMake((MyWidth-70*FitWidth)/2, MyHight/2+70*FitWidth+10, 70*FitWidth, 20)];
    helpme.text = @"需要帮助";
    helpme.textColor = LanSe;
    helpme.textAlignment = NSTextAlignmentCenter;
    [bac_img addSubview:helpme];
    
    UIButton *btnt = [UIButton buttonWithType:UIButtonTypeCustom];
    btnt.frame = CGRectMake((MyWidth-70*FitWidth)/2, MyHight/2+70*FitWidth+80, 70*FitWidth, 70*FitWidth);
    [btnt setImage:[UIImage imageNamed:@"帮助别人"] forState:UIControlStateNormal];
    [btnt addTarget:self action:@selector(bangta) forControlEvents:UIControlEventTouchUpInside];
    [bac_img addSubview:btnt];
    UILabel *helpta = [[UILabel alloc] initWithFrame:CGRectMake((MyWidth-70*FitWidth)/2, MyHight/2+70*FitWidth+90+70*FitWidth, 70*FitWidth, 20)];
    helpta.text = @"帮助别人";
    helpta.textColor = HongSe;
    helpta.textAlignment = NSTextAlignmentCenter;
    [bac_img addSubview:helpta];
    
    UIButton *del = [UIButton buttonWithType:UIButtonTypeCustom];
    del.frame = CGRectMake(MyWidth-10-30*FitWidth, 64, 30*FitWidth, 30*FitWidth);
    [del setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    [del addTarget:self action:@selector(dell) forControlEvents:UIControlEventTouchUpInside];
    [bac_img addSubview:del];
    
    [app.window addSubview:bac_img];
    bac_img.hidden = YES;
    
}
-(void)dell{
  bac_img.hidden = YES;
}
-(void)xuyao{
        bac_img.hidden = YES;
    FBXuQiuViewController *xuqiu = [[FBXuQiuViewController alloc] init];
    xuqiu.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:xuqiu animated:YES];

    
}
-(void)bangta{
        bac_img.hidden = YES;
    FBFuWuViewController *fuwu = [[FBFuWuViewController alloc] init];
    fuwu.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:fuwu animated:YES];

}
-(void)fabu{
    bac_img.hidden = NO;
    
    
}
/**
     *用户位置更新后，会调用此函数
     *@param userLocation 新的用户位置
*/
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{

    if (pointAnnotation == nil) {
        BMKCoordinateRegion region;

        region.center.latitude =userLocation.location.coordinate.latitude;
        region.center.longitude =userLocation.location.coordinate.longitude;
        region.span.latitudeDelta = 0.05;
        region.span.longitudeDelta = 0.05;
        [_mapView setRegion:region animated:YES];//执行设定显示范围
        
        [_mapView setCenterCoordinate:region.center animated:YES];
        [_mapView updateLocationData:userLocation];
        pointAnnotation = [[BMKPointAnnotation alloc]init];
        CLLocationCoordinate2D coor;
        coor.latitude = userLocation.location.coordinate.latitude;

        coor.longitude = userLocation.location.coordinate.longitude;
        NSLog(@"%f--%f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
        pointAnnotation.coordinate = coor;
        pointAnnotation.title = @"我的定位";
        pointAnnotation.subtitle = @"";
        [_mapView addAnnotation:pointAnnotation];
    }
    

    
    
    
}
    

-(void)viewWillAppear:(BOOL)animated {
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
}
    
-(void)viewWillDisappear:(BOOL)animated {
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
}
    
- (void)dealloc {
    if (_mapView) {
        _mapView = nil;
    }
}

    // 添加动画Annotation
- (void)addAnimatedAnnotation {


    NSMutableArray *ai = [NSMutableArray array];
//    [_mapView addAnnotation:animatedAnnotation];
    
    for (int i = 0; i < 1; i ++) {
        animatedAnnotation = [[BMKPointAnnotation alloc]init];
        CLLocationCoordinate2D coor;
        coor.latitude = 38.868494+0.004;
        coor.longitude = 121.526832+0.001;
        animatedAnnotation.coordinate = coor;
        
        animatedAnnotation.title = @"1";
//        animatedAnnotation.subtitle = @"此Annotation可拖拽!";
        [ai addObject:animatedAnnotation];
    }
         [_mapView addAnnotations:ai];
    
}
    

-(UIImage *)getImageFromView:(UIView *)view{
    
    UIGraphicsBeginImageContext(view.bounds.size);
    
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
    
}
    
    // 根据anntation生成对应的View
- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation
    {
        
       NSString *s = [annotation title];
        NSString *AnnotationViewID = @"ClusterMark";
        
//        BMKPinAnnotationView *cluster = (BMKPinAnnotationView*)annotation;
        
        if ([s isEqualToString:@"我的定位"]) {
            BMKPinAnnotationView *annotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationViewID];
            
            //    annotationView.size = cluster.size;
            
            annotationView.canShowCallout = YES;//在点击大头针的时候会弹出那个黑框框
            
            annotationView.draggable = NO;//禁止标注在地图上拖动
            
            
            annotationView.centerOffset=CGPointMake(0,0);
            
            if (self.view.frame.size.width >= 414) {
                UIView *viewForImage=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 500, 330)];
                
                
                
                UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake((500-220)/2, 70, 220, 260)];
                
                [imageview setImage:[UIImage imageNamed:@"附近头像"]];
                
                
                UIImageView *im = [[UIImageView alloc] initWithFrame:CGRectMake(30, 30, 160, 160)];
                NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://api.luodafu.com.cn/product/051126639.jpg"]];
                
                im.image = [UIImage imageWithData:data];
                im.layer.cornerRadius = 80;
                im.layer.masksToBounds = YES;
                [imageview addSubview:im];
                
                
                
                [viewForImage addSubview:imageview];
                annotationView.image=[self getImageFromView:viewForImage];
                
            }else{
                UIView *viewForImage=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 110, 190)];
                
                
                
                UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 60, 110, 130)];
                
                [imageview setImage:[UIImage imageNamed:@"用户头像"]];
                
                //    imageview.layer.masksToBounds=YES;
                //
                //    imageview.layer.cornerRadius = 10;
                UIImageView *im = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 80, 80)];
//                im.image = [UIImage imageNamed:@"icon-1"];
//                    [im setImageWithURL:[NSURL URLWithString:@"http://api.luodafu.com.cn/product/051126639.jpg"]];
                NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://api.luodafu.com.cn/product/051126639.jpg"]];
                
                im.image = [UIImage imageWithData:data];
                im.layer.cornerRadius = 80/2;
                im.layer.masksToBounds = YES;
                [imageview addSubview:im];
                
                
                
                [viewForImage addSubview:imageview];
                
                annotationView.image=[self getImageFromView:viewForImage];
                
            }
            
            
            
            UIImageView *popViewa = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
            
            BMKActionPaopaoView *pView = [[BMKActionPaopaoView alloc]initWithCustomView:popViewa];
            pView.frame = CGRectMake(0, 0, 150, 50);
            ((BMKPinAnnotationView*)annotationView).paopaoView = pView;
            
            return annotationView;
        }else{
        BMKPinAnnotationView *annotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationViewID];
        
        //    annotationView.size = cluster.size;
        
        annotationView.canShowCallout = YES;//在点击大头针的时候会弹出那个黑框框
        
        annotationView.draggable = NO;//禁止标注在地图上拖动
        
 
        annotationView.centerOffset=CGPointMake(0,0);
        
        if (self.view.frame.size.width >= 414) {
            UIView *viewForImage=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 400, 410)];
            
            
            
            UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake((400-180)/2, 150, 180, 213)];
            
            [imageview setImage:[UIImage imageNamed:@"附近头像"]];
            
   
            UIImageView *im = [[UIImageView alloc] initWithFrame:CGRectMake(25, 25, 130, 130)];
//            im.image = [UIImage imageNamed:@"icon-1"];
            NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://api.luodafu.com.cn/product/051126639.jpg"]];
            
            im.image = [UIImage imageWithData:data];
            im.layer.cornerRadius = 130/2;
            im.layer.masksToBounds = YES;
            [imageview addSubview:im];
            
            
            
            [viewForImage addSubview:imageview];

            
            UIImageView *popView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 400, 150)];
            
            popView.image = [UIImage imageNamed:@"圆角矩形-bg"];
            
            popView.alpha = 1;
            
            popView.userInteractionEnabled = YES;
            viewForImage.userInteractionEnabled = YES;
            imageview.userInteractionEnabled = YES;
            
            UIImageView *tou = [[UIImageView alloc] initWithFrame:CGRectMake(40, 40, 70, 70)];
            tou.layer.masksToBounds = YES;
            tou.layer.cornerRadius = 70/2;
            tou.image = [UIImage imageNamed:@"服务icon"];
            [popView addSubview:tou];
            
            UILabel *titt = [[UILabel alloc] initWithFrame:CGRectMake(130, 40, 260, 35)];
            titt.text = @"我会修空调，谁需要";
            titt.font = [UIFont systemFontOfSize:22];
            titt.textColor = [UIColor blackColor];
            [popView addSubview:titt];
            
            UILabel *tott = [[UILabel alloc] initWithFrame:CGRectMake(130, 75, 260, 35)];
            
            tott.text = @"隔壁王";
            tott.font = [UIFont systemFontOfSize:19];
            tott.textColor = [UIColor colorWithRed:85.0/255.0 green:85.0/255.0 blue:85.0/255.0 alpha:1];
            [popView addSubview:tott];
            
            [viewForImage addSubview:popView];
            annotationView.image=[self getImageFromView:viewForImage];
            
        }else{
            UIView *viewForImage=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 250, 230)];
            
            
            
            UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake((250-110)/2, 100, 110, 130)];
            
            [imageview setImage:[UIImage imageNamed:@"附近头像"]];
            
            //    imageview.layer.masksToBounds=YES;
            //
            //    imageview.layer.cornerRadius = 10;
            UIImageView *im = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 80, 80)];
//            im.image = [UIImage imageNamed:@"icon-1"];
            NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://api.luodafu.com.cn/product/051126639.jpg"]];
            
            im.image = [UIImage imageWithData:data];
            im.layer.cornerRadius = 80/2;
            im.layer.masksToBounds = YES;
            [imageview addSubview:im];
            
            
            
            [viewForImage addSubview:imageview];
            
            

            
            UIImageView *popView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 250, 100)];
            
            popView.image = [UIImage imageNamed:@"圆角矩形-bg"];
            
            popView.alpha = 1;
            
            popView.userInteractionEnabled = YES;
            viewForImage.userInteractionEnabled = YES;
            imageview.userInteractionEnabled = YES;
            
            UIImageView *tou = [[UIImageView alloc] initWithFrame:CGRectMake(20, 25, 50, 50)];
            tou.layer.masksToBounds = YES;
            tou.layer.cornerRadius = 25;
            tou.image = [UIImage imageNamed:@"服务icon"];
            [popView addSubview:tou];
            
            UILabel *titt = [[UILabel alloc] initWithFrame:CGRectMake(80, 20, 160, 30)];
            titt.text = @"我会修空调";
            titt.font = [UIFont systemFontOfSize:22];
            titt.textColor = HeiSe;
            [popView addSubview:titt];
            
            UILabel *tott = [[UILabel alloc] initWithFrame:CGRectMake(80, 50, 160, 30)];
            

            tott.font = [UIFont systemFontOfSize:18];
            tott.textColor = QianHui;
            
            NSMutableAttributedString * strr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"隔壁王   200/次"]];
            
            [strr addAttribute:NSForegroundColorAttributeName value:HongSe range:NSMakeRange(6,5)];
            
            
            
            tott.attributedText = strr;
            
            [popView addSubview:tott];
            
            [viewForImage addSubview:popView];
            annotationView.image=[self getImageFromView:viewForImage];
        }
        


        UIImageView *popViewa = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        
        BMKActionPaopaoView *pView = [[BMKActionPaopaoView alloc]initWithCustomView:popViewa];
        pView.frame = CGRectMake(0, 0, 150, 50);
        ((BMKPinAnnotationView*)annotationView).paopaoView = pView;
        
        
        
        
        
        
        

        
            return annotationView;
        }
    }
    
// 当点击annotation view弹出的泡泡时，调用此接口
- (void)mapView:(BMKMapView *)mapView annotationViewForBubble:(BMKAnnotationView *)view;
    {
        NSLog(@"paopaoclick");
    }
    
-(void)mapView:(BMKMapView *)mapView didSelectAnnotationView:(BMKAnnotationView *)view{
   
    NSString *tit = [view.annotation title];
    if ([tit isEqualToString:@"我的定位"]) {
         NSLog(@"按了");
    }
    
    [_mapView deselectAnnotation: animatedAnnotation animated:NO];


}
- (void)mapView:(BMKMapView *)mapView didDeselectAnnotationView:(BMKAnnotationView *)view{
    NSLog(@"0000");

}
@end
