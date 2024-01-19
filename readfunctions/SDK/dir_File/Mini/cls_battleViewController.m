//
//  cls_battleViewController.m
//  Game
//
//  Created by 9130Game on 2023/11/17.
//

#import "cls_battleViewController.h"
#import "cls_gameScene.h"
@interface cls_battleViewController ()

@end

@implementation cls_battleViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.pro_jinbobtn.hidden = true;
    
    [cls_BaseViewController fun_point_requst:[NSValue valueWithCGPoint:CGPointMake(6, 0)]];

    SKView *skview = [[SKView alloc]init];
    skview.frame = self.view.bounds;
//    skview.showsNodeCount = YES;
    cls_gameScene *scene =   [[cls_gameScene alloc]initWithSize:self.view.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    [self.view addSubview:skview];
    [skview presentScene:scene];

    
}



@end
