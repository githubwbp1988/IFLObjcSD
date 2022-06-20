//
//  IFLPerson.m
//  IFLDebug
//
//  Created by erlich wang on 2022/6/19.
//

#import "IFLPerson.h"

@implementation IFLPerson

+ (id)person {
    return [[IFLPerson alloc] init];
}

+ (id)person1:(IFLPerson *)p {
    return p;
}

+ (id)test1 {
    return @"test1..";
}

@end
