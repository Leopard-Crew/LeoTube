#import <Cocoa/Cocoa.h>
#import "Classes/LTAppDelegate.h"

int main(int argc, char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    [NSApplication sharedApplication];

    LTAppDelegate *delegate = [[LTAppDelegate alloc] init];
    [NSApp setDelegate:delegate];

    int result = NSApplicationMain(argc, (const char **)argv);

    [delegate release];
    [pool release];

    return result;
}
