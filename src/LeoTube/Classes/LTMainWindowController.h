#import <Cocoa/Cocoa.h>

@interface LTMainWindowController : NSWindowController
{
}

- (id)initWithExistingWindow:(NSWindow *)existingWindow;
- (void)buildInitialInterface;

@end
