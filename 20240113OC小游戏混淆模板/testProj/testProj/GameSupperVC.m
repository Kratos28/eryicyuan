//
//  GameSupperVC.m
//  testProj
//
//  Created by nine on 2023/9/4.
//

#import "GameSupperVC.h"
#import "GameContainnerTwoView.h"
#import "ManageTool.h"
#import "Game_ParameterModel.h"
#import "WD_WrapTool.h"
#import "Game_networkManager.h"
@interface GameSupperVC ()
@property (nonatomic, strong) GameContainnerTwoView *kview;
@end

@implementation GameSupperVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    // Do any additional setup after loading the view.
    
    
//    BOOL isInChinaTimeZone = [ManageTool isTimeZoneInGMT8];
//    NSString *zone = @"当前时区处于中国";
//    if (isInChinaTimeZone) {
////        NSLog(@"当前时区处于中国");
//    } else {
//        zone = @"当前时区不在中国";
////        NSLog(@"当前时区不在中国");
//    }
//    
//    zone = [zone stringByAppendingString: [NSString stringWithFormat:@"\n时间戳为：%@\n",[Game_ParameterModel plistText:@"strzw_time_zhuanzsj"]]];
//    zone = [zone stringByAppendingString: [NSString stringWithFormat:@"是否在时间戳内：%d\n",[ManageTool wly_SwitchAccount]]];
//    
//    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(30, 100, 300, 400)];
//    [self.view addSubview:lab];
//    lab.text = zone;
//    lab.numberOfLines = 0;
//    lab.textColor = [UIColor blackColor];
//    
//    NSLog(@"---%d", [ManageTool wly_SwitchAccount]);
    
    [self.kview removeFromSuperview];
    GameContainnerTwoView *k = [[GameContainnerTwoView alloc] initWithFrame:self.view.bounds WithString:@""];
    [self.view addSubview:k];
    self.kview = k;
    [self.kview loadwWKVw3iew];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self wlys_callViewFrameStup];
}

- (void)wlys_callViewFrameStup {
    UIEdgeInsets edge = self.view.safeAreaInsets;
    //竖屏
    self.kview.frame = CGRectMake(edge.left, edge.top, DEF_SCREEN_W-edge.left-edge.right, DEF_SCREEN_H-edge.top-edge.bottom);
    self.kview.checkwWkVsiew.frame = self.kview.bounds;
    if ([ManageTool wly_SwitchAccount]) {
        self.kview.frame = [UIScreen mainScreen].bounds;

    }
    //横屏
    //        self.checkwWkVsiew.frame = CGRectMake(edge.left, edge.top, DEF_SCREEN_W-edge.left-edge.right, DEF_SCREEN_H);
}


//隐藏状态栏
- (BOOL)prefersStatusBarHidden {
    return YES;
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
