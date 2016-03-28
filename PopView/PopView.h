//
//  PopView.h
//  TensWeiBo_demo
//
//  Created by tens on 15-10-6.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    PopViewIsLeft, //显示在左边
    PopViewIsCenter,//显示在中间
    PopViewIsRight,//显示在右边
} PopViewType;

typedef void(^OperationBlock)(id info);

@interface PopView : UIView

@property (strong, nonatomic) void (^OperationBlock)(id info);

/**
 *  在popView中显示的视图，
 */
@property (nonatomic, strong) UIView *contentView;

/**
 *  工厂方法创建PopView
 *
 *  @return 返回创建好的popView
 */
+ (instancetype)creat;

/**
 *  调用此方法显示我们的popView
 *
 *  @param view 显示在哪里，这个View一般都是传入我们按钮或者其他出发我们显示方法的View
 *  @param type 枚举类型：主要控制弹出的视图是在左边，中间还是右边
 */
- (void)showPopImageView:(UIView *)view withType:(PopViewType)type;

@end
