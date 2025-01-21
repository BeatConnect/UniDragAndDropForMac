#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

typedef void (*cs_callback)(const char*);
typedef void (*cs_swipe_callback)(float x, float y);
typedef void (*cs_pinch_callback)(float value);
typedef void (*cs_mouse_wheel_callback)(float deltaX, float deltaY);

@interface GetDragAndDropFilePath : NSImageView
{
    cs_callback _callback;
    cs_callback _dragCallback;
    cs_swipe_callback _swipeCallback;
    cs_pinch_callback _pinchCallback;
    cs_mouse_wheel_callback _mouseWheelCallback;
}

- (void)setCallback:(cs_callback) callback;
- (void)setDragCallback:(cs_callback) dragCallback;
- (void)setSwipeCallback:(cs_swipe_callback) swipeCallback;
- (void)setPinchCallback:(cs_pinch_callback) pinchCallback;
- (void)setMouseWheelCallback:(cs_mouse_wheel_callback) mouseWheelCallback;
- (void)handlePinch:(NSMagnificationGestureRecognizer *)gestureRecognizer;

@end
