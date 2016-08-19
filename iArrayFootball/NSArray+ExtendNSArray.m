//
//  NSArray+ExtendNSArray.m
//  iArrayFootball
//
//  Created by Bui Duc Khanh on 8/19/16.
//  Copyright © 2016 Bui Duc Khanh. All rights reserved.
//

#import "NSArray+ExtendNSArray.h"

@implementation NSArray (ExtendNSArray)


// Hàm xử lý lấy ra các phần tử duy nhất của mảng
+ (NSArray *) distinct: (NSArray*)source
{
    if (source == nil || source.count == 0)
        return source;
    
    NSMutableArray * tmp = [NSMutableArray new];
    
    for (int i = 0; i < source.count; i++)
    {
        bool isDistinct = true;
        
        for (int j = 0; j < tmp.count; j++)
            if ([tmp[j] isEqual:source[i]])
            {
                isDistinct = false;
                break;
            }
        
        if (isDistinct)
            [tmp addObject:source[i]];
    }
    
    return [NSArray arrayWithArray:tmp];
}
@end
