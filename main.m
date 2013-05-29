#import <Cocoa/Cocoa.h>

@interface WindowControllerd : NSWindowController
- (void)buttonClicked: (id)sender;

@end
@interface WindowControllerd ()
- (void)buttonClicked: (id)sender;
@end

@implementation WindowControllerd
- (void)buttonClicked: (id) sender {

  NSAlert *alert = [[[NSAlert alloc] init] autorelease];
  [alert addButtonWithTitle:@"Yes"];
  [alert addButtonWithTitle:@"Maybe"];
  [alert addButtonWithTitle:@"Nope"];
  [alert addButtonWithTitle:@"Not in a million years"];
  [alert setMessageText:@"Did you like it?"];
  [alert setInformativeText:@"This will make me really happy"];
  [alert setAlertStyle:NSWarningAlertStyle];
  [alert runModal];
  NSLog(@"Clicked!\n");
}
@end



int main(int argc, const char **argv) {
    [NSAutoreleasePool new];

    [NSApplication sharedApplication];
    [NSApp setActivationPolicy:NSApplicationActivationPolicyRegular];
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];

    WindowControllerd *ctrl = [[WindowControllerd alloc] init];
    id menubar = [[NSMenu new] autorelease];
    id appMenuItem = [[NSMenuItem new] autorelease];

    [menubar addItem:appMenuItem];

    [NSApp setMainMenu:menubar];

    id appMenu = [[NSMenu new] autorelease];
    id appName = [info valueForKey: @"CFBundleName"];
    id quitTitle = [@"Quit " stringByAppendingString:appName];
    id quitMenuItem = [[[NSMenuItem alloc] initWithTitle:quitTitle
        action:@selector(terminate:) keyEquivalent:@"q"] autorelease];

    [appMenu addItem:quitMenuItem];
    [appMenuItem setSubmenu:appMenu];

    id window = [[[NSWindow alloc]
                   initWithContentRect:NSMakeRect(0, 0, 400, 300)
                             styleMask:NSTitledWindowMask
                               backing:NSBackingStoreBuffered
                                 defer:NO]
                  autorelease];

    [window setTitle:appName];
    [window makeKeyAndOrderFront:nil];

    id button = [[NSButton alloc]
                   initWithFrame:NSMakeRect(0, 30, 150, 40)];
    [button setTitle: @"Click me baby"];
    [button setBezelStyle:NSRoundedBezelStyle];
    [button setTarget:ctrl];
    [button setAction:@selector(buttonClicked:)];

    [[[window contentView] superview] addSubview:button];
    [NSApp activateIgnoringOtherApps:YES];
    [NSApp run];
    return 0;
}
