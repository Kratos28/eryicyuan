//
//  cls_MainViewController.m
//  xuanzhuang
//
//  Created by 9130Game on 2023/11/7.
//

#import "cls_MainViewController.h"
#import "cls_yuanyuan.h"
#import "cls_DoublyLinkedList.h"
#import "cls_yuanyuanNode.h"
#import "cls_EquipViewController.h"
#import "cls_petViewController.h"
#import "cls_methodViewController.h"
#import "cls_immortalLeagueViewController.h"
#import "cls_FightViewController.h"
@interface cls_MainViewController () <cls_yuanyuanDelegate>
@property (nonatomic,strong)cls_DoublyLinkedList *pro_list;
@property (nonatomic,strong)cls_yuanyuan *pro_yuan;
@property (nonatomic,strong)UIImageView *pro_tipImageView;

@end

@implementation cls_MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pro_backbtn.hidden = true;
    {
        UIImageView *var_imageview = [[UIImageView alloc]init];
        var_imageview.contentMode = UIViewContentModeScaleToFill;
        var_imageview.image = [cls_Tool fun_imageName:@"img_bg_1"];
        var_imageview.frame = [cls_Tool fun_frameWithProportionalValuesForRPX:0 RPY:0 withImage:var_imageview.image];
        [self.view addSubview:var_imageview];
    }
    
    
    
    

  
    
    
    {
        UIButton *var_button = [[UIButton alloc]init];
        [var_button setBackgroundImage:[cls_Tool fun_imageName:@"img_btn_z6"] forState:UIControlStateNormal];
        var_button.frame = [cls_Tool fun_frameWithProportionalValuesForRPX:550 RPY:630 withImage:var_button.currentBackgroundImage];
        [var_button fun_handleinTarget:self block:^(id  _Nonnull target, UIButton * _Nonnull b) {
            
            
          
            UIViewController *mainvc =   [[cls_FightViewController alloc]init];
            mainvc.modalPresentationStyle = UIModalPresentationFullScreen;
            mainvc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentViewController:mainvc animated:NO completion:nil];
      
            
        } Event:64];
        [self.view addSubview:var_button];
    }
    
    {
        UIButton *var_button = [[UIButton alloc]init];
        [var_button setBackgroundImage:[cls_Tool fun_imageName:@"img_btn_z1"] forState:UIControlStateNormal];
        var_button.frame = [cls_Tool fun_frameWithProportionalValuesForRPX:700 RPY:630 withImage:var_button.currentBackgroundImage];
        [var_button fun_handleinTarget:self block:^(id  _Nonnull target, UIButton * _Nonnull b) {
            UIViewController *mainvc =   [[cls_petViewController alloc]init];
            mainvc.modalPresentationStyle = UIModalPresentationFullScreen;
            mainvc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentViewController:mainvc animated:NO completion:nil];
        } Event:64];
        [self.view addSubview:var_button];
    }
    
    
    {
        UIButton *var_button = [[UIButton alloc]init];
        [var_button setBackgroundImage:[cls_Tool fun_imageName:@"img_btn_z2"] forState:UIControlStateNormal];
        var_button.frame = [cls_Tool fun_frameWithProportionalValuesForRPX:850 RPY:630 withImage:var_button.currentBackgroundImage];
        [var_button fun_handleinTarget:self block:^(id  _Nonnull target, UIButton * _Nonnull b) {
            UIViewController *mainvc =   [[cls_EquipViewController alloc]init];
            mainvc.modalPresentationStyle = UIModalPresentationFullScreen;
            mainvc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentViewController:mainvc animated:NO completion:nil];
        } Event:64];
        [self.view addSubview:var_button];
    }
    
   
    
    {
        UIButton *var_button = [[UIButton alloc]init];
        [var_button setBackgroundImage:[cls_Tool fun_imageName:@"img_btn_z3"] forState:UIControlStateNormal];
        var_button.frame = [cls_Tool fun_frameWithProportionalValuesForRPX:1000 RPY:630 withImage:var_button.currentBackgroundImage];
        [var_button fun_handleinTarget:self block:^(id  _Nonnull target, UIButton * _Nonnull b) {
            
            UIViewController *mainvc =   [[cls_methodViewController alloc]init];
            mainvc.modalPresentationStyle = UIModalPresentationFullScreen;
            mainvc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentViewController:mainvc animated:NO completion:nil];
            
        } Event:64];
        [self.view addSubview:var_button];
    }
    
    
    {
        UIButton *var_button = [[UIButton alloc]init];
        [var_button setBackgroundImage:[cls_Tool fun_imageName:@"img_btn_z5"] forState:UIControlStateNormal];
        var_button.frame = [cls_Tool fun_frameWithProportionalValuesForRPX:1150 RPY:630 withImage:var_button.currentBackgroundImage];
        [var_button fun_handleinTarget:self block:^(id  _Nonnull target, UIButton * _Nonnull b) {
            
            
            UIViewController *mainvc =   [[cls_immortalLeagueViewController alloc]init];
            mainvc.modalPresentationStyle = UIModalPresentationFullScreen;
            mainvc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentViewController:mainvc animated:NO completion:nil];
        } Event:64];
        [self.view addSubview:var_button];
    }
    

    
    

    self.pro_list = [[cls_DoublyLinkedList alloc] init];
    {
        cls_Arrive *arrvie =  [[cls_Arrive alloc]init];
        arrvie.pro_nextarrive = true;
        arrvie.pro_arriveAngle = 330;
        
        cls_yuanyuan *yuan =  [[cls_yuanyuan alloc]initWithFrame:CGRectMake(RPX(455), RPY(100), RPX(240), RPX(240)) withcircleImageView:@"img_1" withAvatarImageName:@"img_zj" withpro_jinbishuliang:3];
        if ([UIDevice currentDevice].userInterfaceIdiom ==  UIUserInterfaceIdiomPad)
        {
            yuan =  [[cls_yuanyuan alloc]initWithFrame:CGRectMake(RPX(455), RPY(150), RPX(240), RPX(240)) withcircleImageView:@"img_1" withAvatarImageName:@"img_zj" withpro_jinbishuliang:3];
        }else if ([[cls_Tool fun_iphoneType] isEqualToString:@"设备iPhone 14 Pro"])
        {
            yuan =  [[cls_yuanyuan alloc]initWithFrame:CGRectMake(RPX(60), RPY(270), RPX(280), RPX(280)) withcircleImageView:@"img_1" withAvatarImageName:@"img_zj" withpro_jinbishuliang:3];
        }else if ([[cls_Tool fun_iphoneType] isEqualToString: @"设备iPhone 14 Plus"])
        {
            
        }else if ([[cls_Tool fun_iphoneType] isEqualToString: @"设备是iPhone 6/6s/7/8/SE (1st 和 2nd generation)"])
        {
            yuan =  [[cls_yuanyuan alloc]initWithFrame:CGRectMake(RPX(455), RPY(100), RPX(240), RPX(240)) withcircleImageView:@"img_1" withAvatarImageName:@"img_zj" withpro_jinbishuliang:3];
        }
        
        
        yuan.pro_startAngle = 90;
        yuan.pro_arrives = @[arrvie];
        yuan.pro_duration  = 4;
        yuan.pro_delegate = self;
        yuan.tag = 100;
        [yuan fun_yuanyuanstartAvatarMovement];
        [self.view addSubview:yuan];
        [self.pro_list fun_insertNodeWithData:yuan];
    }

    {
        cls_Arrive *arrvie =  [[cls_Arrive alloc]init];
        arrvie.pro_nextarrive = NO;
        arrvie.pro_arriveAngle = 150;
        cls_Arrive *arrvie1 =  [[cls_Arrive alloc]init];
        arrvie1.pro_nextarrive = YES;
        arrvie1.pro_arriveAngle = 340;
        
        cls_Arrive *arrvie2 =  [[cls_Arrive alloc]init];
        arrvie2.pro_nextarrive = YES;
        arrvie2.pro_arriveAngle = 30;
        
        cls_yuanyuan *yuan1 = [[cls_yuanyuan alloc]initWithFrame:CGRectMake(RPX(690), RPY(150), RPX(210), RPX(210)) withcircleImageView:@"img_2" withAvatarImageName:@"img_zj" withpro_jinbishuliang:3];
        if ([[cls_Tool fun_iphoneType] isEqualToString: @"设备是iPad (1st 和 2nd generation), iPad Mini (1st generation)"]){
            
            yuan1 =  [[cls_yuanyuan alloc]initWithFrame:CGRectMake(RPX(690), RPY(177), RPX(220), RPX(220)) withcircleImageView:@"img_2" withAvatarImageName:@"img_zj" withpro_jinbishuliang:3];
        }
        else if ([UIDevice currentDevice].userInterfaceIdiom ==  UIUserInterfaceIdiomPad)
        {
            yuan1 =  [[cls_yuanyuan alloc]initWithFrame:CGRectMake(RPX(690), RPY(180), RPX(220), RPX(220)) withcircleImageView:@"img_2" withAvatarImageName:@"img_zj" withpro_jinbishuliang:3];
        }else if ([[cls_Tool fun_iphoneType] isEqualToString:@"设备iPhone 14 Pro"])
        {
            yuan1 =  [[cls_yuanyuan alloc]initWithFrame:CGRectMake(RPX(255), RPY(78), RPX(220), RPX(220)) withcircleImageView:@"img_2" withAvatarImageName:@"img_zj" withpro_jinbishuliang:3];
        }else if ([[cls_Tool fun_iphoneType] isEqualToString: @"设备iPhone 14 Plus"]){
            yuan1 =  [[cls_yuanyuan alloc]initWithFrame:CGRectMake(RPX(255), RPY(78), RPX(220), RPX(220)) withcircleImageView:@"img_2" withAvatarImageName:@"img_zj" withpro_jinbishuliang:3];
        }
        else if ([[cls_Tool fun_iphoneType] isEqualToString: @"设备是iPhone 6/6s/7/8/SE (1st 和 2nd generation)"])
        {
            yuan1 = [[cls_yuanyuan alloc]initWithFrame:CGRectMake(RPX(690), RPY(150), RPX(210), RPX(210)) withcircleImageView:@"img_2" withAvatarImageName:@"img_zj" withpro_jinbishuliang:3];
        }
        yuan1.pro_duration = 4;
        yuan1.pro_arrives = @[arrvie,arrvie1,arrvie2];
        yuan1.pro_startAngle = 90;
        yuan1.pro_delegate =self;
        yuan1.tag = 101;
        [self.view addSubview:yuan1];
        [self.pro_list fun_insertNodeWithData:yuan1];
    }



    {
        cls_Arrive *arrvie =  [[cls_Arrive alloc]init];
        arrvie.pro_nextarrive = NO;
        arrvie.pro_arriveAngle = 180;

        cls_Arrive *arrvie1 =  [[cls_Arrive alloc]init];
        arrvie1.pro_nextarrive = YES;
        arrvie1.pro_arriveAngle = 110;
        cls_yuanyuan *yuan2 = [[cls_yuanyuan alloc]initWithFrame:CGRectMake(RPX(890), RPY(200), RPX(250), RPX(250)) withcircleImageView:@"img_3" withAvatarImageName:@"img_zj" withpro_jinbishuliang:2];
        if ([[cls_Tool fun_iphoneType] isEqualToString: @"设备是iPad (1st 和 2nd generation), iPad Mini (1st generation)"]){
            
            yuan2 =   [[cls_yuanyuan alloc]initWithFrame:CGRectMake(RPX(900), RPY(213), RPX(250), RPX(250)) withcircleImageView:@"img_3" withAvatarImageName:@"img_zj" withpro_jinbishuliang:2];
        }
        else if ([UIDevice currentDevice].userInterfaceIdiom ==  UIUserInterfaceIdiomPad)
        {
            yuan2 =  [[cls_yuanyuan alloc]initWithFrame:CGRectMake(RPX(895), RPY(225), RPX(250), RPX(250)) withcircleImageView:@"img_3" withAvatarImageName:@"img_zj" withpro_jinbishuliang:2];
        }else if ([[cls_Tool fun_iphoneType] isEqualToString:@"设备iPhone 14 Pro"])
        {
            yuan2 = [[cls_yuanyuan alloc]initWithFrame:CGRectMake(RPX(470), RPY(30), RPX(280), RPX(290)) withcircleImageView:@"img_3" withAvatarImageName:@"img_zj" withpro_jinbishuliang:2];
        }else if ([[cls_Tool fun_iphoneType] isEqualToString: @"设备iPhone 14 Plus"]){
            yuan2 = [[cls_yuanyuan alloc]initWithFrame:CGRectMake(RPX(470), RPY(20), RPX(280), RPX(290)) withcircleImageView:@"img_3" withAvatarImageName:@"img_zj" withpro_jinbishuliang:2];
        }
        else if ([[cls_Tool fun_iphoneType] isEqualToString: @"设备是iPhone 6/6s/7/8/SE (1st 和 2nd generation)"])
        {
            yuan2 = [[cls_yuanyuan alloc]initWithFrame:CGRectMake(RPX(890), RPY(200), RPX(250), RPX(250)) withcircleImageView:@"img_3" withAvatarImageName:@"img_zj" withpro_jinbishuliang:2];
        }
        yuan2.pro_duration = 4;
        yuan2.pro_startAngle = 90;
        yuan2.pro_delegate =self;
        yuan2.pro_arrives = @[arrvie,arrvie1];
        yuan2.tag = 102;
        [self.view addSubview:yuan2];
        [self.pro_list fun_insertNodeWithData:yuan2];

    }

    {
        cls_Arrive *arrvie =  [[cls_Arrive alloc]init];
        arrvie.pro_nextarrive = NO;
        arrvie.pro_arriveAngle = 280;
        cls_Arrive *arrvie1 =  [[cls_Arrive alloc]init];
        arrvie1.pro_nextarrive = YES;
        arrvie1.pro_arriveAngle =140;
        cls_Arrive *arrvie2 =  [[cls_Arrive alloc]init];
        arrvie2.pro_nextarrive = YES;
        arrvie2.pro_arriveAngle = 210;
        cls_yuanyuan *yuan3 = [[cls_yuanyuan alloc]initWithFrame:CGRectMake(RPX(810), RPY(380), RPX(100), RPX(100)) withcircleImageView:@"img_4" withAvatarImageName:@"img_zj" withpro_jinbishuliang:3];
        if ([[cls_Tool fun_iphoneType] isEqualToString: @"设备是iPad (1st 和 2nd generation), iPad Mini (1st generation)"]){
            
            yuan3 =   [[cls_yuanyuan alloc]initWithFrame:CGRectMake(RPX(805), RPY(330), RPX(125), RPX(125)) withcircleImageView:@"img_4" withAvatarImageName:@"img_zj" withpro_jinbishuliang:3];
        }
        else if ([UIDevice currentDevice].userInterfaceIdiom ==  UIUserInterfaceIdiomPad)
        {
            yuan3 =   [[cls_yuanyuan alloc]initWithFrame:CGRectMake(RPX(790), RPY(350), RPX(130), RPX(130)) withcircleImageView:@"img_4" withAvatarImageName:@"img_zj" withpro_jinbishuliang:3];
        }else if ([[cls_Tool fun_iphoneType] isEqualToString:@"设备iPhone 14 Pro"])
        {
            yuan3 = [[cls_yuanyuan alloc]initWithFrame:CGRectMake(RPX(735), RPY(150), RPX(250), RPX(250)) withcircleImageView:@"img_4" withAvatarImageName:@"img_zj" withpro_jinbishuliang:3];
        }else if ([[cls_Tool fun_iphoneType] isEqualToString: @"设备iPhone 14 Plus"]){
            yuan3 = [[cls_yuanyuan alloc]initWithFrame:CGRectMake(RPX(740), RPY(130), RPX(250), RPX(250)) withcircleImageView:@"img_4" withAvatarImageName:@"img_zj" withpro_jinbishuliang:3];
        }  else if ([[cls_Tool fun_iphoneType] isEqualToString: @"设备是iPhone 6/6s/7/8/SE (1st 和 2nd generation)"])
        {
            yuan3 = [[cls_yuanyuan alloc]initWithFrame:CGRectMake(RPX(800), RPY(340), RPX(110), RPX(110)) withcircleImageView:@"img_4" withAvatarImageName:@"img_zj" withpro_jinbishuliang:3];
        }
        yuan3.pro_duration = 4;
        yuan3.pro_startAngle = 90;
        yuan3.pro_delegate =self;
        yuan3.pro_arrives =@[arrvie,arrvie1,arrvie2];
        yuan3.tag = 103;
        [self.view addSubview:yuan3];
        [self.pro_list fun_insertNodeWithData:yuan3];
        
    }


    {
        cls_Arrive *arrvie =  [[cls_Arrive alloc]init];
        arrvie.pro_nextarrive = NO;
        arrvie.pro_arriveAngle = 300;
        cls_Arrive *arrvie1 =  [[cls_Arrive alloc]init];
        arrvie1.pro_nextarrive = YES;
        arrvie1.pro_arriveAngle = 150;

        cls_yuanyuan *yuan4 = [[cls_yuanyuan alloc]initWithFrame:CGRectMake(RPX(620), RPY(385), RPX(200), RPX(200)) withcircleImageView:@"img_5" withAvatarImageName:@"img_zj" withpro_jinbishuliang:2];
        if ([[cls_Tool fun_iphoneType] isEqualToString: @"设备是iPad (1st 和 2nd generation), iPad Mini (1st generation)"]){
            
            yuan4 =   [[cls_yuanyuan alloc]initWithFrame:CGRectMake(RPX(614), RPY(345), RPX(200), RPX(200)) withcircleImageView:@"img_5" withAvatarImageName:@"img_zj" withpro_jinbishuliang:3];
        }
        else if ([UIDevice currentDevice].userInterfaceIdiom ==  UIUserInterfaceIdiomPad)
        {
            yuan4 =  [[cls_yuanyuan alloc]initWithFrame:CGRectMake(RPX(620), RPY(370), RPX(180), RPX(180)) withcircleImageView:@"img_5" withAvatarImageName:@"img_zj" withpro_jinbishuliang:2];
        }else if ([[cls_Tool fun_iphoneType] isEqualToString:@"设备iPhone 14 Pro"])
        {
            yuan4 = [[cls_yuanyuan alloc]initWithFrame:CGRectMake(RPX(900), RPY(405), RPX(150), RPX(150)) withcircleImageView:@"img_5" withAvatarImageName:@"img_zj" withpro_jinbishuliang:2];
        }else if ([[cls_Tool fun_iphoneType] isEqualToString: @"设备iPhone 14 Plus"]){
            yuan4 = [[cls_yuanyuan alloc]initWithFrame:CGRectMake(RPX(900), RPY(390), RPX(150), RPX(150)) withcircleImageView:@"img_5" withAvatarImageName:@"img_zj" withpro_jinbishuliang:2];
        }
        else if ([[cls_Tool fun_iphoneType] isEqualToString: @"设备是iPhone 6/6s/7/8/SE (1st 和 2nd generation)"])
        {
            yuan4 = [[cls_yuanyuan alloc]initWithFrame:CGRectMake(RPX(615), RPY(360), RPX(200), RPX(200)) withcircleImageView:@"img_5" withAvatarImageName:@"img_zj" withpro_jinbishuliang:2];
        }
        yuan4.pro_duration = 4;
        yuan4.pro_startAngle = 90;
        yuan4.pro_delegate =self;
        yuan4.pro_arrives = @[arrvie,arrvie1];
        yuan4.tag = 104;
        [self.view addSubview:yuan4];
        [self.pro_list fun_insertNodeWithData:yuan4];

    }


    {

        cls_Arrive *arrvie =  [[cls_Arrive alloc]init];
        arrvie.pro_nextarrive = NO;
        arrvie.pro_arriveAngle = 300;
       
        cls_yuanyuan *yuan5 = [[cls_yuanyuan alloc]initWithFrame:CGRectMake(RPX(470), RPY(430), RPX(150), RPX(150)) withcircleImageView:@"img_6" withAvatarImageName:@"img_zj" withpro_jinbishuliang:1];
        if ([[cls_Tool fun_iphoneType] isEqualToString: @"设备是iPad (1st 和 2nd generation), iPad Mini (1st generation)"]){
            
            yuan5 =   [[cls_yuanyuan alloc]initWithFrame:CGRectMake(RPX(435), RPY(365), RPX(180), RPX(180)) withcircleImageView:@"img_6" withAvatarImageName:@"img_zj" withpro_jinbishuliang:1];
        }
        else
        if ([UIDevice currentDevice].userInterfaceIdiom ==  UIUserInterfaceIdiomPad)
        {
            yuan5 =  [[cls_yuanyuan alloc]initWithFrame:CGRectMake(RPX(440), RPY(380), RPX(180), RPX(180)) withcircleImageView:@"img_6" withAvatarImageName:@"img_zj" withpro_jinbishuliang:1];
        }else if ([[cls_Tool fun_iphoneType] isEqualToString:@"设备iPhone 14 Pro"])
        {
            yuan5 = [[cls_yuanyuan alloc]initWithFrame:CGRectMake(RPX(980), RPY(145), RPX(280), RPX(280)) withcircleImageView:@"img_6" withAvatarImageName:@"img_zj" withpro_jinbishuliang:1];
        }else if ([[cls_Tool fun_iphoneType] isEqualToString: @"设备iPhone 14 Plus"]){
            yuan5 = [[cls_yuanyuan alloc]initWithFrame:CGRectMake(RPX(985), RPY(130), RPX(280), RPX(280)) withcircleImageView:@"img_6" withAvatarImageName:@"img_zj" withpro_jinbishuliang:1];
        } else if ([[cls_Tool fun_iphoneType] isEqualToString: @"设备是iPhone 6/6s/7/8/SE (1st 和 2nd generation)"])
        {
            yuan5 = [[cls_yuanyuan alloc]initWithFrame:CGRectMake(RPX(468), RPY(418), RPX(150), RPX(150)) withcircleImageView:@"img_5" withAvatarImageName:@"img_zj" withpro_jinbishuliang:2];
        }
            yuan5.pro_duration = 4;
            yuan5.pro_startAngle = 90;
            yuan5.pro_delegate =self;
            yuan5.pro_arrives = @[arrvie];
            yuan5.tag = 105;
            [self.view addSubview:yuan5];
        [self.pro_list fun_insertNodeWithData:yuan5];

    }


//
    {
        UIImageView *var_imageview = [[UIImageView alloc]init];
        var_imageview.contentMode = UIViewContentModeScaleToFill;
        var_imageview.userInteractionEnabled = YES;
        var_imageview.image = [cls_Tool fun_imageName:@"img_jc"];
        var_imageview.frame = [cls_Tool fun_frameWithProportionalValuesForRPX:0 RPY:0 withImage:var_imageview.image];
        [self.view addSubview:var_imageview];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fun_jiiJPWWjpj)];
        [var_imageview addGestureRecognizer:tap];
        self.pro_tipImageView = var_imageview;
    }
    
    

    
    

}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.pro_yuan fun_yuanyuanstartAvatarMovement];
    
}

- (void)fun_jiiJPWWjpj
{
    [self.pro_tipImageView removeFromSuperview];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    for (int i =0; i<self.pro_list.pro_count; i++) {
        cls_yuanyuanNode * node = [self.pro_list fun_getNodeAtIndex:i];
        [node.pro_data fun_hideAvatar];
    }
   
}


- (void)fun_yuanyuanDelegate:(cls_yuanyuan *)yuan withArrive:(NSInteger)point with:(cls_Arrive *)arrvie;
{
    

}
- (void)fun_currentyuanyuan:(cls_yuanyuan *)yuan
{
    self.pro_yuan = yuan;

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    cls_yuanyuanNode *node =   [self.pro_list fun_getNodeWithData:self.pro_yuan];
    cls_yuanyuanNode *new_Node = nil;
    if (node.pro_data.pro_arrive == true && node.pro_next !=nil && node.pro_data.tag == 100&& node.pro_data.pro_arrives.firstObject.pro_nextarrive == true){ //第一个节点
        new_Node= node.pro_next;
       
    } else if (node.pro_data.tag == 101 && node.pro_data.pro_arrives.firstObject.pro_nextarrive == false &&node.pro_data.pro_arrives.firstObject.pro_daoda == true && node.pro_data.pro_arrive == true){ //第二个节点
        new_Node= node.pro_previous;
        
    }else if (node.pro_data.tag == 101 && node.pro_data.pro_arrives[1].pro_nextarrive == true && node.pro_data.pro_arrives[1].pro_daoda == true && node.pro_data.pro_arrive == true){  //第二个节点
        new_Node= node.pro_next;

    }else if (node.pro_data.tag == 101 && node.pro_data.pro_arrives[2].pro_nextarrive == true && node.pro_data.pro_arrives[2].pro_daoda == true && node.pro_data.pro_arrive == true){  //第二个节点
        new_Node= node.pro_next.pro_next;

    }
    else if (node.pro_data.tag == 102 && node.pro_data.pro_arrives[0].pro_nextarrive == false && node.pro_data.pro_arrives[0].pro_daoda == true && node.pro_data.pro_arrive == true){  //第三个节点
        new_Node= node.pro_previous;
        
    }else if (node.pro_data.tag == 102 && node.pro_data.pro_arrives[1].pro_nextarrive == true && node.pro_data.pro_arrives[1].pro_daoda == true && node.pro_data.pro_arrive == true){//第三个节点
        new_Node= node.pro_next;

    }else if (node.pro_data.tag == 103 && node.pro_data.pro_arrives[0].pro_nextarrive == false && node.pro_data.pro_arrives[0].pro_daoda == true && node.pro_data.pro_arrive == true){//第四个节点
        new_Node= node.pro_previous;

    }else if (node.pro_data.tag == 103 && node.pro_data.pro_arrives[1].pro_nextarrive == true && node.pro_data.pro_arrives[1].pro_daoda == true && node.pro_data.pro_arrive == true){//第四个节点
        //      arrvie.pro_arriveAngle = 280;
//        cls_Arrive *arrvie1 =  [[cls_Arrive alloc]init];
//        arrvie1.pro_nextarrive = YES;
//        arrvie1.pro_arriveAngle =140;
//        cls_Arrive *arrvie2 =  [[cls_Arrive alloc]init];
//        arrvie2.pro_nextarrive = YES;
//        arrvie2.pro_arriveAngle = 280;
        new_Node= node.pro_next;


    }else if (node.pro_data.tag == 103 && node.pro_data.pro_arrives[2].pro_nextarrive == true && node.pro_data.pro_arrives[2].pro_daoda == true && node.pro_data.pro_arrive == true){//第四个节点
        
        new_Node= node.pro_previous.pro_previous;


    }else if (node.pro_data.tag == 104 && node.pro_data.pro_arrives[0].pro_nextarrive == false && node.pro_data.pro_arrives[0].pro_daoda == true && node.pro_data.pro_arrive == true){//第5个节点
        new_Node= node.pro_previous;

    }else if (node.pro_data.tag == 104 && node.pro_data.pro_arrives[1].pro_nextarrive == true && node.pro_data.pro_arrives[1].pro_daoda == true && node.pro_data.pro_arrive == true){//第5个节点
        new_Node= node.pro_next;

    }else if (node.pro_data.tag == 105 && node.pro_data.pro_arrives[0].pro_nextarrive == false && node.pro_data.pro_arrives[0].pro_daoda == true && node.pro_data.pro_arrive == true){//第6个节点
        new_Node= node.pro_previous;
    }
    
    
    
    
    
    if (new_Node !=nil)
    {
        [node.pro_data fun_hideAvatar];
        [new_Node.pro_data fun_yuanyuanstartAvatarMovement];
    }

    
    
}



@end
