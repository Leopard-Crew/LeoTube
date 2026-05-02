#import "LTAppDelegate.h"
#import "LTMainWindowController.h"

@implementation LTAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)notification
{
    NSWindow *initialWindow = window;

    if (initialWindow == nil && [[NSApp windows] count] > 0) {
        initialWindow = [[NSApp windows] objectAtIndex:0];
    }

    mainWindowController = [[LTMainWindowController alloc] initWithExistingWindow:initialWindow];
    [mainWindowController showWindow:self];
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
    return YES;
}

- (void)dealloc
{
    [mainWindowController release];
    [super dealloc];
}

@end
