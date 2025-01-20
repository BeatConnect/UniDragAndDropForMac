#import "GetDragAndDropFilePath.h"

@implementation GetDragAndDropFilePath

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self)
    {
        NSArray *ar = [NSArray arrayWithObjects:NSPasteboardTypeFileURL, nil];
        [self registerForDraggedTypes:ar];
    }
    return self;
}

- (NSDragOperation)draggingEntered:(id <NSDraggingInfo>)sender
{
    return NSDragOperationEvery;
}

- (void)setCallback:(cs_callback) callback
{
    _callback = callback;
}

- (void)setSwipeCallback:(cs_swipe_callback) swipeCallback
{
    _swipeCallback = swipeCallback;
}

- (void)setPinchCallback:(cs_pinch_callback) callback
{
    _pinchCallback = callback;
}


- (void)setDragCallback:(cs_callback) dragCallback
{
    _dragCallback = dragCallback;
}

- (void)scrollWheel:(NSEvent *)event {
    CGFloat dx = event.scrollingDeltaX;
    CGFloat dy = event.scrollingDeltaY;

    // You might want to adjust the logic here to suit your needs
    if (event.hasPreciseScrollingDeltas) {
        // This is a trackpad scroll event
        if (_swipeCallback != NULL) {
            _swipeCallback(dx, dy);
        }
    } else {
        // This is a mouse wheel scroll event, you might want to ignore it
    }
}

- (void)handlePinch:(NSMagnificationGestureRecognizer *)gestureRecognizer {
    CGFloat magnification = gestureRecognizer.magnification;
    _pinchCallback(magnification);
}

- (NSDragOperation)draggingUpdated:(id <NSDraggingInfo>)sender
{
    NSURL* fileURL = [NSURL URLFromPasteboard: [sender draggingPasteboard]];
    NSString *url = fileURL!=NULL ? [fileURL path] : @"";
    const char *path = [url UTF8String];
    _dragCallback(path);
    
    return NSDragOperationEvery;
}

- (BOOL)prepareForDragOperation:(id <NSDraggingInfo>)sender
{
    // Flag to allow drag and drop
    return YES;
} 

- (BOOL)performDragOperation:(id <NSDraggingInfo>)sender
{
    NSURL* fileURL = [NSURL URLFromPasteboard: [sender draggingPasteboard]];
    NSString *url = fileURL!=NULL ? [fileURL path] : @"";
    const char *path = [url UTF8String];
    _callback(path);
    
    // If you set it to YES, the dropped image will be displayed
    return NO;
}

@end
