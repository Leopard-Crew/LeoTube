#import <Cocoa/Cocoa.h>

@class LTMainWindowController;

@interface LTAppDelegate : NSObject
{
    IBOutlet NSWindow *window;
    LTMainWindowController *mainWindowController;
}

@end
