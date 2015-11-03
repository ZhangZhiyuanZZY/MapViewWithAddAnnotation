//
//  ZYAnnotation.h
//  04添加大头针
//
//  Created by 章芝源 on 15/11/3.
//  Copyright © 2015年 ZZY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
///遵守协议  定义  自定义大头针的属性.
@interface ZYAnnotation : NSObject<MKAnnotation>
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy)NSString *subtitle;

@property (nonatomic, copy)NSString *imageName;

@end
