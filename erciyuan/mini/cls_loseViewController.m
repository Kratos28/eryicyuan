//
//  cls_loseViewController.m
//  chongshouduijue
//
//  Created by 9130Game on 2024/1/10.
//

#import "cls_loseViewController.h"

@interface cls_loseViewController ()

@end

@implementation cls_loseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pro_jinbobtn.hidden =YES;
    UIImageView *var_imageview = [[UIImageView alloc]init];
    var_imageview.image = [cls_Tool fun_imageName:@"img_jiesuan_bg_lose"];
    viewFrameBlock(var_imageview,^(UIView *b){
        b.frame = CGRectMake(0, 0,self.view.frame.size.width, self.view.frame.size.height);
        
    });
    var_imageview.userInteractionEnabled = YES;
    [self.view addSubview:var_imageview];
    
  
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}



@end
