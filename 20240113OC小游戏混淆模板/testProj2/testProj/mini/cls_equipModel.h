#import <Foundation/Foundation.h>
#import "StandUserinfo.h"
NS_ASSUME_NONNULL_BEGIN

@interface Vital : NSObject <NSCoding, NSSecureCoding>
@property (nonatomic,assign) int16_t minimumWDModelLV;
@property (nonatomic,assign) int16_t minimumWDModelATK;
@property (nonatomic,assign) int16_t sessioncalculating;
@property (nonatomic,assign) int16_t minimumWDModelConsumegold;
@property (nonatomic,assign) int16_t minimumWDModelConsumeshuijing;

@property (nonatomic, strong) UILabel *isystemSpawnedOnDying;
@end



@interface cls_equipModel : StandUserinfo <NSCoding, NSSecureCoding>
@property (nonatomic,copy) NSString * showsBackgroundLocationIndicatorLL;
@property (nonatomic,assign) int16_t mapItem;
@property (nonatomic,assign) int16_t underjitteringEnabled;
@property (nonatomic,assign) int16_t reflectfailureResponse;
@property (nonatomic,copy) NSString *cconnectedPath;
@property (nonatomic,assign) int16_t handimageSubtitle;
@property (nonatomic,assign) BOOL localizedFailureReasonHD;
@property (nonatomic,assign) int16_t displacement;
@property (nonatomic,assign) int16_t includesPropertyValuesCE;
@property (nonatomic,assign) int16_t SchemeSetcolor;
@property (nonatomic,assign) int16_t oceanEI;
@property (nonatomic,strong) Vital *minimumWD;
@property (nonatomic,strong) Vital *NecessarilyNsurlsessiontask;

@end

NS_ASSUME_NONNULL_END
