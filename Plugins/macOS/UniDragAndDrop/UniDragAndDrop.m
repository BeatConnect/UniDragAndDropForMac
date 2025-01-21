#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import "GetDragAndDropFilePath.h"

void Initialize(cs_callback callback,
                cs_callback dragCallback,
                cs_swipe_callback swipeCallback,
                cs_pinch_callback pinchCallback,
                cs_mouse_wheel_callback mouseWheelCallback)
{
    NSArray *ar = [NSApp orderedWindows];
    NSWindow *window = [ar objectAtIndex:0];
    NSView *view = [window contentView];
    
    // Enable DragAndDrop for all screens
    GetDragAndDropFilePath *dview = [[GetDragAndDropFilePath alloc] initWithFrame:view.frame];

    [view addSubview:dview];
    
    NSMagnificationGestureRecognizer *pinchRecognizer = [[NSMagnificationGestureRecognizer alloc] initWithTarget:dview action:@selector(handlePinch:)];
    [view addGestureRecognizer:pinchRecognizer];
    
    // set cs callback Pointer
    [dview setCallback:callback];
    [dview setDragCallback:dragCallback];
    [dview setSwipeCallback:swipeCallback];
    [dview setPinchCallback:pinchCallback];
    [dview setMouseWheelCallback:mouseWheelCallback];
}
