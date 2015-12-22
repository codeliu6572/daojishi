//
//  ViewController.m
//  倒计时
//
//  Created by yons on 15/7/30.
//  Copyright (c) 2015年 yons. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIButton *_obtainVerifiBtn;
    int djs_end_time; //60秒后重新获取验证码
    NSTimer *addDjsTimer;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _obtainVerifiBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    _obtainVerifiBtn.frame=CGRectMake(10, 200, 300, 50);
    _obtainVerifiBtn.backgroundColor=[UIColor cyanColor];
    [_obtainVerifiBtn setBackgroundImage:[UIImage imageNamed:@"bg_send_validate_code.png"] forState:UIControlStateNormal];
    [_obtainVerifiBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_obtainVerifiBtn addTarget:self action:@selector(obtainVerifiAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_obtainVerifiBtn];
}

- (void)obtainVerifiAction{
    djs_end_time = 59;
    [self handleTimer];
    addDjsTimer = [NSTimer scheduledTimerWithTimeInterval:(1.0) target:self selector:@selector(handleTimer) userInfo:nil repeats:YES];
    
}
-(void)handleTimer
{
    
    if(djs_end_time>=0)
    {
        [_obtainVerifiBtn setUserInteractionEnabled:NO];
        [_obtainVerifiBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        int sec = ((djs_end_time%(24*3600))%3600)%60;
        [_obtainVerifiBtn setTitle:[NSString stringWithFormat:@"(%d)重发验证码",sec] forState:UIControlStateNormal];
        
    }
    else
    {
        [_obtainVerifiBtn setUserInteractionEnabled:YES];
        [_obtainVerifiBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_obtainVerifiBtn setTitle:@"重发验证码" forState:UIControlStateNormal];
        
        [addDjsTimer invalidate];
        
    }
    djs_end_time = djs_end_time - 1;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
