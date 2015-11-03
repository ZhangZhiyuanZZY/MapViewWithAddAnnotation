//
//  ViewController.m
//  04添加大头针
//
//  Created by 章芝源 on 15/11/3.
//  Copyright © 2015年 ZZY. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "ZYAnnotation.h"
@interface ViewController ()<MKMapViewDelegate>
///地图视图
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    ///创建手势附带方法
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(AddAnnotationInMapView:)];
    ///设置代理
    self.mapView.delegate = self;
    ///将手势添加到视图
    [self.mapView addGestureRecognizer:tap];
}

///点击视图的时候调用
- (void)AddAnnotationInMapView:(UITapGestureRecognizer *)tap
{
    //1. 获取位置   手势点击视图的位置
    CGPoint point = [tap locationInView:self.mapView];
    
    //创建大头针模型对象
    ZYAnnotation *anno = [[ZYAnnotation alloc]init];
    
    //2. 将坐标转化成经纬度
    anno.coordinate = [self.mapView convertPoint:point toCoordinateFromView:self.mapView];
    //设置属性
    anno.title = @"东莞";
    anno.subtitle = @"一个神奇的地方";
    anno.imageName = @"category_3";
    
    ///将大头针添加到视图
    [self.mapView addAnnotation:anno]; //这里的
}



#pragma mark - MKMapViewDelegate
/**
 *  每添加一个大头针 模型  就会调用的代理方法  返回一个大头针视图
 *
 *  @param mapView    mapView
 *  @param annotation 大头针模型 这个大头针模型
 */
#warning TODO annotation是什么鬼?  文档里说是,当前被添加到view的大头针对象. 里面有上面anno被设置属性但是不能使用点语法
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    static NSString *ID = @"anno";
    MKAnnotationView *view = [mapView dequeueReusableAnnotationViewWithIdentifier:ID];
    
    if (view == nil) {
        view = [[MKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:ID];
        // If YES, a standard callout bubble will be shown when the annotation is selected.
        // The annotation must have a title for the callout to be shown.
        //显示详情, 返回yes的话, 必须设置大头针的title
        view.canShowCallout = YES;
        //设置大头针
        view.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeContactAdd];
        view.leftCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        
        ///得到当前的大头针
        ZYAnnotation *anno = annotation;
        view.image = [UIImage imageNamed:anno.imageName];
    }
    return view;
}


@end
