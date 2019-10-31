//
//  Created by RevenueCat.
//  Copyright © 2019 RevenueCat. All rights reserved.
//

#import "RCNonSubscriptionInfos.h"
#import "RCNonSubscriptionInfos+Protected.h"
#import "RCNonSubscriptionInfo.h"
#import "RCNonSubscriptionInfo+Protected.h"

@interface RCNonSubscriptionInfos ()
@property (nonatomic) NSDictionary<NSString *, NSArray<RCNonSubscriptionInfo *> *> *all;
@end

@implementation RCNonSubscriptionInfos

- (instancetype)initWithData:(NSDictionary *)data dateFormatter:(NSDateFormatter *)dateFormatter
{
    if (self = [super init]) {
        NSMutableDictionary<NSString *, NSArray<RCNonSubscriptionInfo *> *> *all = [[NSMutableDictionary alloc] init];
        for (NSString *productIdentifier in data) {
            id nonSubscriptionsData = data[productIdentifier];
            if ([nonSubscriptionsData isKindOfClass:NSArray.class]) {
                NSMutableArray<RCNonSubscriptionInfo *> *nonSubscriptions = [[NSMutableArray alloc] init];
                for (id nonSubscriptionData in nonSubscriptionsData) {
                    if ([nonSubscriptionData isKindOfClass:NSDictionary.class]) {
                        RCNonSubscriptionInfo *nonSubscription = [[RCNonSubscriptionInfo alloc] initWithData:nonSubscriptionData dateFormatter:dateFormatter];
                        if (nonSubscription != nil) {
                            [nonSubscriptions addObject:nonSubscription];
                        }
                    }
                }
                if (nonSubscriptions.count > 0) {
                    all[productIdentifier] = nonSubscriptions;
                }
            }
        }
        self.all = [NSDictionary dictionaryWithDictionary:all];
    }
    return self;
}

@end
