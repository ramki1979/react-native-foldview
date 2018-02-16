#import "React/RCTViewManager.h"


#ifndef FoldViewManagerBridge_h
#define FoldViewManagerBridge_h

#define EXPORT_FOLD_VIEW_BASE_PROPERTIES \
RCT_EXPORT_VIEW_PROPERTY(dataSource, NSDictionary) \
RCT_EXPORT_VIEW_PROPERTY(flipOrientation, BOOL)
#endif /* FoldViewManagerBridge_h */

@interface RCT_EXTERN_MODULE(FoldViewManager, RCTViewManager)

EXPORT_FOLD_VIEW_BASE_PROPERTIES

@end
