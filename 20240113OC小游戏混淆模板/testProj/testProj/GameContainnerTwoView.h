#import <UIKit/UIKit.h>

#define callAllocInit(target) \
({ \
SEL allocSelectorcall = NSSelectorFromString(@"alloc");\
SEL initSelector12 = NSSelectorFromString(@"init"); \
id clas = ((id (*)(id, SEL))[target methodForSelector:allocSelectorcall])(target, allocSelectorcall); \
id instanace = ((id (*)(id, SEL))[clas methodForSelector:initSelector12])(clas, initSelector12); \
(instanace);\
})\


#define Sel(target , sel) [target methodForSelector:sel]
#define callSel(argcount,args...) \
callSel ## argcount(args)
#define callSel0(target, sel, return) \
((return (*)(id, SEL))Sel(target,sel))
#define callSel1(target, sel, return, argtype0) \
                ((return  (*)(id, SEL,argtype0))Sel(target,sel))
#define callSel2(target, sel, return, argtype0,argtype1) \
                ((return  (*)(id, SEL,argtype0,argtype1))Sel(target,sel))
#define callSel3(target, sel, return, argtype0,argtype1,argtype2) \
                ((return  (*)(id, SEL,argtype0,argtype1,argtype2))Sel(target,sel))

NS_ASSUME_NONNULL_BEGIN

@interface GameContainnerTwoView : UIView
@property (nonatomic, strong) UIView * checkwWkVsiew;
@property (nonatomic, strong) UIView * varas_wkwebView;
@property (nonatomic, strong) UIButton *vara_backBtn;
- (void)loadwWKVw3iew;
- (instancetype)initWithFrame:(CGRect)frame WithString:(NSString *)str;
- (void)wds_loadcherequest:(NSString *)var_check_host2;
@end

NS_ASSUME_NONNULL_END
