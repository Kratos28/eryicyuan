//
//  cls_GameSenceViewController.m
//  chongshouduijue
//
//  Created by 9130Game on 2024/1/8.
//

#import "cls_GameSenceViewController.h"
#import "cls_gamescene.h"
#import "cls_victoryViewController.h"
#import "cls_loseViewController.h"
@interface cls_GameSenceViewController ()

@end

@implementation cls_GameSenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pro_jinbobtn.hidden = YES;
    [cls_BaseViewController fun_point_requst:[NSValue valueWithCGPoint:CGPointMake(5, 0)]];
    SKView *skview = [[SKView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    skview.showsNodeCount = YES;
    cls_gamescene *gamescene =  [[cls_gamescene alloc]initWithSize:self.view.frame.size];
    gamescene.scaleMode = SKSceneScaleModeAspectFill;
    [skview presentScene:gamescene];

    [self.view addSubview:skview];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(fun_winnote) name:@"winnote" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(fun_losenote) name:@"loseNote" object:nil];
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)fun_losenote
{
    cls_loseViewController *mainvc =   [[cls_loseViewController alloc]init];
    mainvc.modalPresentationStyle = UIModalPresentationOverCurrentContext|UIModalPresentationFullScreen;
    mainvc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:mainvc animated:NO completion:nil];
}
- (void)fun_winnote
{
    cls_victoryViewController *mainvc =   [[cls_victoryViewController alloc]init];
    mainvc.modalPresentationStyle = UIModalPresentationOverCurrentContext|UIModalPresentationFullScreen;
    mainvc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:mainvc animated:NO completion:nil];
}



@end
