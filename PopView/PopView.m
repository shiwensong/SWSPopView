//
//  PopView.m
//  TensWeiBo_demo
//
//  Created by tens on 15-10-6.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import "PopView.h"
#import "UIView+Extension.h"

@interface PopView ()

@property (strong, nonatomic) UIImageView *popImageView;

@end

@implementation PopView

+ (instancetype)creat{
    
    static PopView *popView = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        popView = [[self alloc] init];
    });
    
    return popView;
    
}

#pragma mark - UIResponder

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self removeFromSuperview];
}

#pragma mark - Custom Accessors

- (UIImageView *)popImageView
{
    if (_popImageView == nil) {
        _popImageView = [[UIImageView alloc] init];
        _popImageView.userInteractionEnabled = YES;
        [self addSubview:_popImageView];
    }
    return _popImageView;
}

- (void)setContentView:(UIView *)contentView{
    
    _contentView = contentView;
    
    contentView.x = 5;
    contentView.y = 10;
    
    self.popImageView.width = contentView.width + 10;
    self.popImageView.height = contentView.height + 20;
    
    [self.popImageView addSubview:contentView];
}

#pragma mark - Private

- (void)showPopImageView:(UIView *)view withType:(PopViewType)type{
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:self];
    
    self.frame = keyWindow.bounds;
    CGRect newFrame = [view convertRect:view.bounds toView:keyWindow];
    
    self.popImageView.y = CGRectGetMaxY(newFrame);
   
    NSString *imageName = nil;
    if (type == PopViewIsLeft) {
        imageName = @"popover_background_left";
        self.popImageView.x = CGRectGetMinX(newFrame);
    }else if (type == PopViewIsCenter){
        imageName = @"popover_background";
         self.popImageView.centerX = CGRectGetMidX(newFrame);
    }else if (type == PopViewIsRight){
        imageName = @"popover_background_right";
        self.popImageView.x = CGRectGetMaxX(newFrame) - CGRectGetWidth(self.popImageView.frame);
    }

    _popImageView.image = [[UIImage imageNamed:imageName] stretchableImageWithLeftCapWidth:20 topCapHeight:20];

}

@end
