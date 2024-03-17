//
//  cls_FightVC.m
//  erciyuan
//
//  Created by k on 2024/3/16.
//

#import "cls_FightVC.h"
#import "GAME01RenWuPlayGroundView.h"
#import "cls_Tool.h"
#import "GAME01PlayGroundPlayGround.h"
#import "GAME01renwu.h"
#import "cls_shibaiViewController.h"
@interface cls_FightVC ()
@property (nonatomic,strong)GAME01RenWuPlayGroundView *difangMonsterBGView;
@property (nonatomic,strong)GAME01RenWuPlayGroundView *woMonsterBGView;
@end

@implementation cls_FightVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *var_imageview = [[UIImageView alloc]init];
    var_imageview.image = [cls_Tool fun_imageName:@"角色1场景"];
    viewFrameBlock(var_imageview,^(UIView *b){
        b.frame = CGRectMake(RPX(0), RPY(0),self.view.width, self.view.height);
        
    });
    [self.view addSubview:var_imageview];

    {
        UIImageView *var_imageview = [[UIImageView alloc]init];
        var_imageview.image = [cls_Tool fun_imageName:@"jiemianlan"];
        viewFrameBlock(var_imageview,^(UIView *b){
            b.frame = CGRectMake(RPX(0), RPY(0),b.width, b.height);
            
        });
        [self.view addSubview:var_imageview];
        
        
        {
            UIButton *var_button = [[UIButton alloc]init];
            [var_button setTitle:@"挑战" forState:0];
            var_button.titleLabel.font = [cls_Tool fun_cusstomFontSize:40];
            viewFrameBlock(var_button,^(UIView *b){
                b.frame = CGRectMake(RPX(120), RPY(10),RPX(200), RPY(50));
            });
       
            [var_imageview addSubview:var_button];
        }
    }
    
    
    [self.pro_backbtn removeTarget:self action:@selector(fun_goback) forControlEvents:64];;

    [self.pro_backbtn addTarget:self action:@selector(back) forControlEvents:64];

    GAME01RenWuPlayGroundView *play = [[GAME01RenWuPlayGroundView alloc] initWithFrame:CGRectZero withshifoudiren:false];
    play.frame = CGRectMake(RPX(0), RPY(300), RPX(450), RPY(600));
    [self.view addSubview:play];
    self.woMonsterBGView = play;
    
    
    GAME01RenWuPlayGroundView *boss = [[GAME01RenWuPlayGroundView alloc] initWithFrame:CGRectZero withshifoudiren:true];
    boss.frame = CGRectMake(RPX(600), RPY(300), RPX(450), RPY(600));
    [self.view addSubview:boss];
    self.difangMonsterBGView = boss;
    
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(jianchasiwang:) name:siwang object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(gongjiWillwangchengNotefunc:) name:gongjiWillwangchengNote object:nil];

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(gongjiDidwangchengNotefunc:) name:gongjiDIDwangchengNote object:nil];
    
    
    
    
//    UIButton *back= [[UIButton alloc] init];
//    back.frame = CGRectMake(X(0), Y(0), W(679), H(176));
//    [back   setBackgroundImage:[UIImage imageNamed:@"11-战斗_Fanhui"] forState:UIControlStateNormal];
//    [back  addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:back];
    
}
- (void)jianchasiwang:(NSNotification *)note
{
    GAME01renwu *ccview = note.object;
        //敌方卡牌
    if (self.difangMonsterBGView.playView.subviews.count == 0)
        { //敌方死亡了
            
            
//            GAME01ShengliViewController *v =  [[GAME01ShengliViewController alloc]initWithNibName:@"GAME01ShengliViewController" bundle:nil];
//                __weak typeof(self) weakSelf = self;
//            [v setBu:^(int a) {
//                PlayModel *p = getS();
//                 p.stage +=p.stage;
//
//
//                save(p);
//
//                 if (index==0) {
//                     [weakSelf.presentingViewController dismissViewControllerAnimated:false completion:nil];
//                 }
//
//                 [weakSelf.presentingViewController dismissViewControllerAnimated:false completion:nil];
////                 [NoteCenter postNotificationName:kcoinUpdate object:nil];
//            }];
//
//                v.modalPresentationStyle = 6;
//                [self presentViewController:v animated:false completion:nil];
            

        }
        if (self.woMonsterBGView.playView.subviews.count == 0)
            { //我放死亡了
                
//                __weak typeof(self) weakSelf = self;
//
//                GAME01ShibaiViewController*v =  [[GAME01ShibaiViewController alloc]initWithNibName:@"GAME01ShibaiViewController" bundle:nil];
//                v.modalPresentationStyle = 6;
//                [v setBu:^(int index) {
//                    if (index==0) {
//                        [weakSelf.presentingViewController dismissViewControllerAnimated:false completion:nil];
//                    }
//                    [weakSelf.presentingViewController dismissViewControllerAnimated:false completion:nil];
//
//                }];
//                [self presentViewController:v animated:false completion:nil];

                cls_shibaiViewController *v =  [[cls_shibaiViewController alloc]init];
                v.modalPresentationStyle =  UIModalPresentationFullScreen;
                [self presentViewController:v animated:NO completion:nil];


            }
}

- (void)gongjiWillwangchengNotefunc:(NSNotification *)note
{

    

    GAME01RenWuPlayGroundView * ccview = note.userInfo[@"KaiPaiBackgroundView"];
    if (ccview == self.difangMonsterBGView) {
        //敌人攻击
        
        self.difangMonsterBGView.userInteractionEnabled = false;
            [self.woMonsterBGView beigongjikouxue];

    }else
    {
        
        [self.difangMonsterBGView beigongjikouxue];
        self.difangMonsterBGView.userInteractionEnabled = false;
        self.difangMonsterBGView.userInteractionEnabled = true;
        self.woMonsterBGView.userInteractionEnabled = false;


    }


    self.woMonsterBGView.userInteractionEnabled = false;
}

- (void)gongjiDidwangchengNotefunc:(NSNotification *)note
{
    GAME01RenWuPlayGroundView *ccview = note.userInfo[@"KaiPaiBackgroundView"];
    GAME01renwu *cardVie = note.userInfo[@"KaiPaiBackgroundView"];

    if (ccview==self.difangMonsterBGView) {
        //复位下移动

        [self performSelector:@selector(difanggongji) withObject:nil afterDelay:1];
        
        
        
        [UIView animateWithDuration:0.5 animations:^{
        self.woMonsterBGView.lastView.frame = CGRectMake(self.woMonsterBGView.lastView.frame.origin.x- RPX(80), self.woMonsterBGView.lastView.frame.origin.y ,  self.woMonsterBGView.lastView.frame.size.width,  self.woMonsterBGView.lastView.frame.size.height);
        } completion:^(BOOL finished) {


        }];
        
        
    }else
    {
        
//        UIButton *taopaobutton =  (UIButton*)[self.view viewWithName:@"taopao"];

        [UIView animateWithDuration:0.5 animations:^{
        self.difangMonsterBGView.lastView.frame = CGRectMake(self.difangMonsterBGView.lastView.frame.origin.x+ RPX(80), self.difangMonsterBGView.lastView.frame.origin.y ,  self.difangMonsterBGView.lastView.frame.size.width,  self.difangMonsterBGView.lastView.frame.size.height);
        } completion:^(BOOL finished) {
            self.woMonsterBGView.userInteractionEnabled = true;
            self.woMonsterBGView.flag = true;
 
            
        }];

        
    }
}

- (void)difanggongji
{
    if (self.difangMonsterBGView.playView.subviews.count ==0 || self.woMonsterBGView.playView.subviews.count == 0 ) {
        return;;
    }


    
    __weak typeof(self) weakSelf = self;
    
    
    int a =  0 + arc4random()%((self.difangMonsterBGView.playView.subviews.count-1) - 0 + 1);
    GAME01renwu *cardVie =  self.difangMonsterBGView.playView.subviews[a];
    self.woMonsterBGView.userInteractionEnabled =false;
    [weakSelf.difangMonsterBGView touchanimateRight:cardVie];
//    [weakSelf.difangMonsterBGView
//     autogongjiwithwithwithwangcheng:^{
//
//    }];
}
- (void)back
{
    
    

    alertWithok(self, @"确定逃跑?", @"确定", @"取消", ^(int a) {

        if (a ==1) {
            if (self.woMonsterBGView.flag == false) {

                return;;
            }

            [self dismissViewControllerAnimated:false completion:nil];

        }

    });


}



@end
