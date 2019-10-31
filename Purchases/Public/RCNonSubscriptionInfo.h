//
//  Created by RevenueCat.
//  Copyright © 2019 RevenueCat. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(NonSubscriptionInfo)
@interface RCNonSubscriptionInfo : NSObject

@property (readonly) NSString *identifier;

@property (readonly) NSDate *purchaseDate;

@end

NS_ASSUME_NONNULL_END
