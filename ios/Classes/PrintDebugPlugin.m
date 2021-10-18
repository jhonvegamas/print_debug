#import "PrintDebugPlugin.h"
#if __has_include(<print_debug/print_debug-Swift.h>)
#import <print_debug/print_debug-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "print_debug-Swift.h"
#endif

@implementation PrintDebugPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPrintDebugPlugin registerWithRegistrar:registrar];
}
@end
