//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"

#if __has_include(<flutter_money_formatter/FlutterMoneyFormatterPlugin.h>)
#import <flutter_money_formatter/FlutterMoneyFormatterPlugin.h>
#else
@import flutter_money_formatter;
#endif

#if __has_include(<shared_preferences/FLTSharedPreferencesPlugin.h>)
#import <shared_preferences/FLTSharedPreferencesPlugin.h>
#else
@import shared_preferences;
#endif

#if __has_include(<toggle_button/ToggleButtonPlugin.h>)
#import <toggle_button/ToggleButtonPlugin.h>
#else
@import toggle_button;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FlutterMoneyFormatterPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterMoneyFormatterPlugin"]];
  [FLTSharedPreferencesPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTSharedPreferencesPlugin"]];
  [ToggleButtonPlugin registerWithRegistrar:[registry registrarForPlugin:@"ToggleButtonPlugin"]];
}

@end
