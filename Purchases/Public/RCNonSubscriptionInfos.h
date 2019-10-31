//
//  Created by RevenueCat.
//  Copyright © 2019 RevenueCat. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RCNonSubscriptionInfo;

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(NonSubscriptionInfos)
@interface RCNonSubscriptionInfos : NSObject

@property (readonly) NSDictionary<NSString *, NSArray<RCNonSubscriptionInfo *> *> *all;

@end

NS_ASSUME_NONNULL_END
