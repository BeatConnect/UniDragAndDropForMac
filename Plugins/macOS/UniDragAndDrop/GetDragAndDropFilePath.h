#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

typedef void (*cs_callback)(const char*);
typedef void (*cs_swipe_callback)(float x, float y);
typedef void (*cs_pinch_callback)(float value);

@interface GetDragAndDropFilePath : NSImageView
{
    cs_callback _callback;
    cs_callback _dragCallback;
    cs_swipe_callback _swipeCallback;
    cs_pinch_callback _pinchCallback;
}

- (void)setCallback:(cs_callback) callback;
- (void)setDragCallback:(cs_callback) dragCallback;
- (void)setSwipeCallback:(cs_swipe_callback) swipeCallback;
- (void)setPinchCallback:(cs_pinch_callback) pinchCallback;
- (void)handlePinch:(NSMagnificationGestureRecognizer *)gestureRecognizer;

@end
