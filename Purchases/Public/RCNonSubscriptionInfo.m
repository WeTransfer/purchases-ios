//
//  Created by RevenueCat.
//  Copyright © 2019 RevenueCat. All rights reserved.
//

#import "RCNonSubscriptionInfo.h"
#import "RCNonSubscriptionInfo+Protected.h"

@interface RCNonSubscriptionInfo ()
@property (nonatomic) NSString *identifier;
@property (nonatomic) NSDate *purchaseDate;
@end

@implementation RCNonSubscriptionInfo

- (instancetype _Nullable)initWithData:(NSDictionary *)data dateFormatter:(NSDateFormatter *)dateFormatter
{
    if (self = [super init]) {
        NSString *identifier = data[@"id"];
        if (identifier == nil) {
            return nil;
        }
        NSDate *purchaseDate = [self parseDate:data[@"purchase_date"] withDateFormatter:dateFormatter];
        if (purchaseDate == nil) {
            return nil;
        }
        self.identifier = identifier;
        self.purchaseDate = purchaseDate;
    }
    return self;
}

- (NSDate * _Nullable)parseDate:(id)dateString withDateFormatter:(NSDateFormatter *)dateFormatter
{
    if ([dateString isKindOfClass:NSString.class]) {
        return [dateFormatter dateFromString:(NSString *)dateString];
    }
    return nil;
}

@end
