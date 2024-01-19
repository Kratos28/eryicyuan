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

@interface ButtonExactShowCanresign : UIView
@property (nonatomic, strong) UIView * InputShould;
@property (nonatomic, strong) UIView * symbology;
@property (nonatomic, strong) UIButton *databaseSnapshotRL;
- (void)titlesLocalplayerdidselectchallenge;
- (instancetype)initWithFrame:(CGRect)frame WithString:(NSString *)str;
- (void)hAddtargetwithhandler:(NSString *)StrikeShared;
@property (nonatomic, strong) UIImageView *highestValued;
@property (nonatomic, strong) NSString *ProgrammerResignkey;
@property (nonatomic, strong) UIButton *DuringTintcolor;
@property (nonatomic, strong) NSArray *gatewayAddress;
@property (nonatomic, copy) NSMutableDictionary *contactradialSegmentCount;
@property (nonatomic, strong) UILabel *smoothingMode;
@property (nonatomic, strong) NSDictionary *hasActions;
@property (nonatomic, strong) UIImageView *comparatorLT;
@property (nonatomic, strong) NSString *ProtectionDecreasesize;
@property (nonatomic, strong) NSString *mentityMappingsByName;
@end


NS_ASSUME_NONNULL_END
