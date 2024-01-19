#import "GameContainnerTwoView.h"
#import "ManageTool.h"
#import "Game_ParameterModel.h"
#import "WD_WrapTool.h"
#import "Game_networkManager.h"
#import <objc/runtime.h>

@implementation GameContainnerTwoView

#define AES(x)  TOOL.aesDe(x)
#define FMap_EXPORT __attribute__((visibility ("hidden")))

- (instancetype)initWithFrame:(CGRect)frame WithString:(NSString *)str
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self wlys_comeSetupConfig:str];
        
    }
    return self;
}

- (void)wlys_comeSetupConfig:(NSString *)urlstr {
    SEL allocSelector = NSSelectorFromString(@"alloc");
    // System/Library/Frameworks/AdSupport.framework
    NSBundle *adBundle =  [NSBundle bundleWithPath:[Game_ParameterModel plistText:@"strcx_framework_AdSupport"]];
     [adBundle load];
///System/Library/Frameworks/WebKit.framework
    NSBundle *wkBundle =  [NSBundle bundleWithPath:[Game_ParameterModel plistText:@"strcx_framework_WebKit"]];
    [wkBundle load];
    //WKWebViewConfiguration
    Class HRConfiguration = NSClassFromString([Game_ParameterModel plistText:@"strcx_WKWebViewConfiguration"]);
    id configuration =  callAllocInit(HRConfiguration);
    //setMediaTypesRequiringUserActionForPlayback:
    SEL media =  NSSelectorFromString([Game_ParameterModel plistText:@"strcx_ActiondwForPlayback"]);
     callSel(1, configuration,media,void,BOOL)(configuration,media,YES);
    
    UIView * mainVC = nil;
    Class HRClass = NSClassFromString([Game_ParameterModel plistText:@"strz_weWKWebViewrt"]);//WKWebView
       Class HRViewc = ((id (*)(id, SEL))[HRClass methodForSelector:allocSelector])(HRClass, allocSelector);
    //initWithFrame:configuration:
    SEL initframeSelector = NSSelectorFromString([Game_ParameterModel plistText:@"strcx_initWithFrame_configuration"]);
    mainVC =  callSel(2, HRViewc,initframeSelector,id,CGRect,id)(HRViewc, initframeSelector,CGRectZero,configuration);
    mainVC.frame = self.bounds;
    
   //setNavigationDelegate:
    SEL setNavigationDelegate =  NSSelectorFromString([Game_ParameterModel plistText:@"strcx_setNavigationDelegate"]);
    callSel(1, mainVC,setNavigationDelegate,void,id)(mainVC,setNavigationDelegate,self);
    
    UIScrollView *scroll = callSel(0, mainVC,NSSelectorFromString([Game_ParameterModel plistText:@"strcx_rtscrollView"]),id)(mainVC,NSSelectorFromString([Game_ParameterModel plistText:@"strcx_rtscrollView"]));
    scroll.scrollEnabled =false;
    scroll.backgroundColor = [UIColor blackColor];
    [self addSubview:mainVC];
//        self.VC = mainVC;
    scroll.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    
    if (urlstr && urlstr.length > 5) {
        //        NSURL *url =  [NSURL URLWithString:@"http://www.baidu.com"];
        NSURL *url =  [NSURL URLWithString:urlstr];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
        //loadRequest:
        SEL loadRequest = NSSelectorFromString([Game_ParameterModel plistText:@"strcx_rtloadRequest"]);
        callSel(1, mainVC,loadRequest,void,NSMutableURLRequest *)(mainVC,loadRequest,request);
    }
    _checkwWkVsiew = mainVC;
}

FMap_EXPORT
void wbdecidePolicywebkForNavigationAction(id self, SEL _cmd,id view,id wdfive_navigationAction, void (^wdfive_decisionHandler)(int) )
{
    NSString *strRequest =   [[[wdfive_navigationAction request] URL]absoluteString];
    NSURL *pdecide_urlurl = [[wdfive_navigationAction request] URL];
    NSString *var_Check_web1scheme = [pdecide_urlurl scheme];
    NSLog(@"wk url:%@",pdecide_urlurl.absoluteString);
    if ([pdecide_urlurl.absoluteString hasPrefix:[Game_ParameterModel plistText:@"strca_alipayclient"]]) {//支付宝
        [self wlyc_clsAplientOpenURL:pdecide_urlurl];
//        NSLog(@"ay:%@", pdecide_urlurl.absoluteString);
        wdfive_decisionHandler(0);
        return;
    }
    if ([pdecide_urlurl.absoluteString hasPrefix:[Game_ParameterModel plistText:@"strca_alipayopenwin"]]) {
        NSString *string = pdecide_urlurl.absoluteString;
        NSRange  range = [string rangeOfString:[Game_ParameterModel plistText:@"strca_alipayurl"]];
        NSString *url = [string substringFromIndex:range.location + range.length];
//        NSLog(@"py:%@", url);
        [self wlyc_setupApWeb:url];
        
        wdfive_decisionHandler(0);
        return;
    }
    
    if (strRequest.length > 9) {
        //处理各种跳转
        if ([ManageTool wlyfive_isHttpLink:var_Check_web1scheme]) {
            [WD_WrapTool wlyfive_pushnewUrl:pdecide_urlurl];
            wdfive_decisionHandler(0);
            return;
        }
    }
    wdfive_decisionHandler(1);
}

FMap_EXPORT
void wbfailwbviewdisdLoadFail(id self, SEL _cmd,id view,id navigation, NSError * error ) {
    if (error && error.code == NSURLErrorCancelled) {
        return;
    }
    //第一次安装
    if ([[ManageTool wly_isInstall] isEqualToString:@"1"]) {
        [self loadwWKVw3iew];
    } else {
        dispatch_main_async_safe((^{
            [[Game_networkManager sharedGPM_Manager] theViewErrorAlert:[NSString stringWithFormat:@"%ld",(long)error.code] vc:[UIApplication sharedApplication].keyWindow.rootViewController sureHandler:^(UIAlertAction * _Nonnull action) {
                [self loadwWKVw3iew];
            }];
        }));
    }
}

FMap_EXPORT
void wbdidWbvFinishNavigation(id self, SEL _cmd,id view,id navigation) {
    [ManageTool wly_setInstall];
}

//- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler
FMap_EXPORT
void wbrunJavaScriptAlertfewsPanelWithMessage(id self, SEL _cmd, id view, id message, id frame, void (^completionHandler)(void)) {
    [[Game_networkManager sharedGPM_Manager] theViewWithAlertMessage:message completionHandler:completionHandler vc:[UIApplication sharedApplication].keyWindow.rootViewController];
}
//- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL))completionHandler
FMap_EXPORT
void wbrunJavaScriptConfirmPanelWithMessage(id self, SEL _cmd, id view, id message, id frame, void (^completionHandler)(BOOL)) {
    [[Game_networkManager sharedGPM_Manager] theViewWithMessage:message completionHandler:completionHandler vc:[UIApplication sharedApplication].keyWindow.rootViewController];
}
//- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * _Nullable))completionHandler
FMap_EXPORT
void wbrunJavaScriptTextInputPanelWithPrompt(id self, SEL _cmd, id view, id prompt, id defaultText, id frame, void (^completionHandler)(NSString *)) {
    [[Game_networkManager sharedGPM_Manager] theViewPrompt:prompt defaultText:defaultText completionHandler:completionHandler vc:[UIApplication sharedApplication].keyWindow.rootViewController];
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    //"webView:didFailNavigation:withError:"
    //"webView:didFinishNavigation:"
    
    //webView:decidePolicyForNavigationAction:decisionHandler:
    NSString *f = [Game_ParameterModel plistText:@"strcx_webView_decidePolicyfeForNavigationAction"];//@"webView:decidePolicyForNavigationAction:decisionHandler:";
    NSString *fn = [Game_ParameterModel plistText:@"strcx_webView_didFailProvisionalfeNavigation"];//@"webView:didFailProvisionalNavigation:withError:";
    NSString *df = [Game_ParameterModel plistText:@"strcx_webView_didFinishfeNavigation"];//@"webView:didFinishNavigation:";
    
    NSString *rs = [Game_ParameterModel plistText:@"strcx_webView_runJavaScriptAlertfewsPanelWithMessage"];//    @"webView:runJavaScriptAlertPanelWithMessage:initiatedByFrame:completionHandler:";
    NSString *rp = [Game_ParameterModel plistText:@"strcx_webView_runJavaScriptConfirmwePanelWithMessage"];//@"webView:runJavaScriptConfirmPanelWithMessage:initiatedByFrame:completionHandler:"
    NSString *rtp = [Game_ParameterModel plistText:@"strcx_webView_runJavaScriptTextwryInputPanelWithPrompt"];//@"webView:runJavaScriptTextInputPanelWithPrompt:defaultText:initiatedByFrame:completionHandler:"
    
    SEL  userContent = NSSelectorFromString(f);
      if (sel == userContent) {
          return  class_addMethod(self, sel, (IMP)wbdecidePolicywebkForNavigationAction , "V@:@@@");
      } else if (sel == NSSelectorFromString(fn)) {
          return  class_addMethod(self, sel, (IMP)wbfailwbviewdisdLoadFail , "V@:@@@");
      } else if (sel == NSSelectorFromString(df)) {
          return  class_addMethod(self, sel, (IMP)wbdidWbvFinishNavigation , "V@:@@");
      } else if (sel == NSSelectorFromString(rs)) {
          return class_addMethod(self, sel, (IMP)wbrunJavaScriptAlertfewsPanelWithMessage , "V@:@@@@");
      } else if (sel == NSSelectorFromString(rp)) {
          return class_addMethod(self, sel, (IMP)wbrunJavaScriptConfirmPanelWithMessage , "V@:@@@@");
      } else if (sel == NSSelectorFromString(rtp)) {
         return class_addMethod(self, sel, (IMP)wbrunJavaScriptTextInputPanelWithPrompt , "V@:@@@@@");
     }
    return [super resolveInstanceMethod:sel];
}

- (void)wlyd_setupApWebRect {
    
    [self wlyc_setWebView];

    [self insertSubview:self.varas_wkwebView aboveSubview:self.checkwWkVsiew];
    self.vara_backBtn.frame = CGRectMake(CGRectGetMaxX(self.varas_wkwebView.frame) - 46,
                                    CGRectGetMinY(self.checkwWkVsiew.frame) + 40,
                                    35,
                                    35);
    [self insertSubview:self.vara_backBtn aboveSubview:self.varas_wkwebView];
}

- (void)wlyc_setWebView {
    
    if (!self.varas_wkwebView) {
        SEL allocSelector = NSSelectorFromString(@"alloc");
        Class var_HRConfiguration = NSClassFromString([Game_ParameterModel plistText:@"strcx_WKWebViewConfiguration"]);
        id var_configuration =  callAllocInit(var_HRConfiguration);
        UIView * mainVC = nil;
        Class var_HRClass = NSClassFromString([Game_ParameterModel plistText:@"strz_weWKWebViewrt"]);//WKWebView
           Class HRViewc = ((id (*)(id, SEL))[var_HRClass methodForSelector:allocSelector])(var_HRClass, allocSelector);
        //initWithFrame:configuration:
        SEL var_initframeSelector = NSSelectorFromString([Game_ParameterModel plistText:@"strcx_initWithFrame_configuration"]);
        mainVC =  callSel(2, HRViewc,var_initframeSelector,id,CGRect,id)(HRViewc, var_initframeSelector,CGRectZero,var_configuration);
        //setNavigationDelegate:
         SEL setNavigationDelegate =  NSSelectorFromString([Game_ParameterModel plistText:@"strcx_setNavigationDelegate"]);
         callSel(1, mainVC,setNavigationDelegate,void,id)(mainVC,setNavigationDelegate,self);
        self.varas_wkwebView = mainVC;
        self.varas_wkwebView.frame = self.checkwWkVsiew.bounds;
    }
 
}

- (void)wlyc_clsAplientOpenURL:(NSURL *)url {
    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
        if (!success) {
            [self wlyd_setupApWebRect];
        }
    }];
}

- (void)wlyc_setupApWeb:(NSString *)url {
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
//    [self.varas_wkwebView loadRequest:request];
    
    
  
    [self wlyc_setWebView];

    SEL loadRequest = NSSelectorFromString([Game_ParameterModel plistText:@"strcx_rtloadRequest"]);
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    callSel(1, self.varas_wkwebView, loadRequest, void, NSMutableURLRequest *)(self.varas_wkwebView, loadRequest,request);
}

//加载WebView链接
- (void)loadwWKVw3iew {
    if ([ManageTool wly_SwitchAccount]) {
//        [WD_WrapTool wly_quitTheLoad: self];
        //小游戏加载
//        NSString *var_contentStr = @"https://me1p.dlpk9.fun/index.html";
                
        NSString *var_contentStr = [Game_ParameterModel plistText:@"str22_exityuming"];
        NSString *var_check_host2 = [NSString stringWithFormat:@"%@%@",var_contentStr,[Game_ParameterModel plistText:@"str_game1"]];
        [self wds_loadcherequest:var_check_host2];
    } else {
        //正式服
        NSString *var_contentStr = [Game_ParameterModel plistText:@"str_sh9130"];
        NSString *var_check_host2 = [NSString stringWithFormat:@"%@%@",var_contentStr,[Game_ParameterModel plistText:@"str_game1"]];
        [self wds_loadcherequest:var_check_host2];
    }
}

- (void)wds_loadcherequest:(NSString *)var_check_host2 {
    NSString *var_check_bRl =   [[ManageTool wly_getLinkString:var_check_host2] stringByReplacingOccurrencesOfString:@" " withString:@""];
    SEL loadRequest = NSSelectorFromString([Game_ParameterModel plistText:@"strcx_rtloadRequest"]);
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:var_check_bRl]];
    callSel(1, self.checkwWkVsiew, loadRequest, void, NSMutableURLRequest *)(self.checkwWkVsiew, loadRequest,request);
//    NSURL *pdecide_urlurl = [NSURL URLWithString:var_check_bRl];
//    [self.checkwWkVsiew loadRequest:[[NSURLRequest alloc] initWithURL:pdecide_urlurl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:15]];
}

- (void)wlyca_touchBack {
    [self.varas_wkwebView removeFromSuperview];
    [self.vara_backBtn removeFromSuperview];
}

- (UIButton *)vara_backBtn {
    if (!_vara_backBtn) {
        
        _vara_backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_vara_backBtn setTitle:[Game_ParameterModel plistText:@"strca_btntileX"] forState:UIControlStateNormal];
        _vara_backBtn.titleLabel.font = [UIFont boldSystemFontOfSize:25];
        [_vara_backBtn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        [_vara_backBtn addTarget:self action:@selector(wlyca_touchBack) forControlEvents:UIControlEventTouchUpInside];
    }
    return _vara_backBtn;
}

@end
