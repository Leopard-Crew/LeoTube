#import "LTMainWindowController.h"

static NSTextField *LTMakeLabel(NSString *text, NSRect frame, NSFont *font)
{
    NSTextField *field = [[NSTextField alloc] initWithFrame:frame];

    [field setStringValue:text];
    [field setFont:font];
    [field setBordered:NO];
    [field setDrawsBackground:NO];
    [field setEditable:NO];
    [field setSelectable:NO];

    return field;
}

@implementation LTMainWindowController

- (id)initWithExistingWindow:(NSWindow *)existingWindow
{
    NSWindow *targetWindow = existingWindow;

    if (targetWindow == nil) {
        targetWindow = [[NSWindow alloc]
            initWithContentRect:NSMakeRect(100, 100, 900, 560)
                      styleMask:(NSTitledWindowMask |
                                 NSClosableWindowMask |
                                 NSMiniaturizableWindowMask |
                                 NSResizableWindowMask)
                        backing:NSBackingStoreBuffered
                          defer:NO];

        self = [super initWithWindow:targetWindow];
        [targetWindow release];
    } else {
        self = [super initWithWindow:targetWindow];
    }

    if (self != nil) {
        [self buildInitialInterface];
    }

    return self;
}

- (void)buildInitialInterface
{
    NSWindow *targetWindow = [self window];

    [targetWindow setTitle:@"LeoTube"];
    [targetWindow setMinSize:NSMakeSize(760, 480)];
    [targetWindow setContentSize:NSMakeSize(900, 560)];
    [targetWindow center];

    NSView *contentView = [targetWindow contentView];

    NSArray *oldSubviews = [[contentView subviews] copy];
    NSEnumerator *enumerator = [oldSubviews objectEnumerator];
    NSView *oldView = nil;

    while ((oldView = [enumerator nextObject]) != nil) {
        [oldView removeFromSuperview];
    }

    [oldSubviews release];

    NSRect bounds = [contentView bounds];

    NSSplitView *rootSplit = [[NSSplitView alloc] initWithFrame:bounds];
    [rootSplit setVertical:YES];
    [rootSplit setDividerStyle:NSSplitViewDividerStyleThin];
    [rootSplit setAutoresizingMask:(NSViewWidthSizable | NSViewHeightSizable)];

    NSView *sidebarView = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 190, bounds.size.height)];
    [sidebarView setAutoresizingMask:NSViewHeightSizable];

    NSView *mainView = [[NSView alloc] initWithFrame:NSMakeRect(190, 0, bounds.size.width - 190, bounds.size.height)];
    [mainView setAutoresizingMask:(NSViewWidthSizable | NSViewHeightSizable)];

    NSTextField *title = LTMakeLabel(@"LeoTube", NSMakeRect(14, bounds.size.height - 42, 160, 24), [NSFont boldSystemFontOfSize:18.0]);
    [title setAutoresizingMask:NSViewMinYMargin];
    [sidebarView addSubview:title];
    [title release];

    NSTextField *navigation = LTMakeLabel(
        @"Search\nSubscriptions\nHistory\nFavorites\nSettings",
        NSMakeRect(14, bounds.size.height - 170, 160, 110),
        [NSFont systemFontOfSize:13.0]
    );
    [navigation setAutoresizingMask:NSViewMinYMargin];
    [sidebarView addSubview:navigation];
    [navigation release];

    NSRect mainBounds = [mainView bounds];

    NSTextField *searchLabel = LTMakeLabel(
        @"Search via Invidious",
        NSMakeRect(16, mainBounds.size.height - 32, 160, 18),
        [NSFont systemFontOfSize:12.0]
    );
    [searchLabel setAutoresizingMask:(NSViewMinYMargin | NSViewMaxXMargin)];
    [mainView addSubview:searchLabel];
    [searchLabel release];

    NSSearchField *searchField = [[NSSearchField alloc] initWithFrame:NSMakeRect(150, mainBounds.size.height - 36, mainBounds.size.width - 166, 22)];
    [searchField setAutoresizingMask:(NSViewWidthSizable | NSViewMinYMargin)];
    [mainView addSubview:searchField];
    [searchField release];

    CGFloat availableHeight = mainBounds.size.height - 58.0;
    CGFloat halfWidth = (mainBounds.size.width - 42.0) / 2.0;

    NSBox *resultsBox = [[NSBox alloc] initWithFrame:NSMakeRect(14, 14, halfWidth, availableHeight)];
    [resultsBox setTitle:@"Results"];
    [resultsBox setAutoresizingMask:(NSViewWidthSizable | NSViewHeightSizable | NSViewMaxXMargin)];
    [mainView addSubview:resultsBox];

    NSTextField *resultsText = LTMakeLabel(
        @"Search results will appear here.\n\nV0.1 target:\n- video title\n- channel\n- duration\n- published date",
        NSMakeRect(16, availableHeight - 130, halfWidth - 32, 100),
        [NSFont systemFontOfSize:12.0]
    );
    [[resultsBox contentView] addSubview:resultsText];
    [resultsText release];
    [resultsBox release];

    NSBox *detailsBox = [[NSBox alloc] initWithFrame:NSMakeRect(28 + halfWidth, 14, halfWidth, availableHeight)];
    [detailsBox setTitle:@"Details"];
    [detailsBox setAutoresizingMask:(NSViewWidthSizable | NSViewHeightSizable | NSViewMinXMargin)];
    [mainView addSubview:detailsBox];

    NSTextField *detailsText = LTMakeLabel(
        @"Video details will appear here.\n\nNo playback yet.\nNo WebKit yet.\nNo network code yet.",
        NSMakeRect(16, availableHeight - 110, halfWidth - 32, 80),
        [NSFont systemFontOfSize:12.0]
    );
    [[detailsBox contentView] addSubview:detailsText];
    [detailsText release];
    [detailsBox release];

    [rootSplit addSubview:sidebarView];
    [rootSplit addSubview:mainView];

    [contentView addSubview:rootSplit];

    [rootSplit setPosition:190.0 ofDividerAtIndex:0];

    [sidebarView release];
    [mainView release];
    [rootSplit release];
}

@end
