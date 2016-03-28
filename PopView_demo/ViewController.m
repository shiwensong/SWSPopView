//
//  ViewController.m
//  PopView_demo
//
//  Created by 施文松 on 16/1/5.
//  Copyright © 2016年 shiwensong. All rights reserved.
//

#import "ViewController.h"
#import "PopView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor grayColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:button];
    [button setTitle:@"按钮" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor blueColor]];
    button.frame = CGRectMake(100, 150, 100, 40);
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom Accessory

- (void)buttonAction:(UIButton *)sender {
    
    PopView *popView = [PopView creat];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    button.bounds = CGRectMake(0, 0, 150, 100);
    
    [button addTarget:self action:@selector(buttonActionwithButton:) forControlEvents:UIControlEventTouchUpInside];
    popView.contentView = button;
    
    [popView showPopImageView:sender withType:PopViewIsCenter];
    
}


- (void)buttonActionwithButton:(UIButton *)sender {
    
    NSLog(@"里面的按钮！");
    
}

@end
