//
//  main.m
//  IFLDebug
//
//  Created by erlich wang on 2022/6/19.
//

#import <Foundation/Foundation.h>
#import "IFLPerson.h"

extern _objc_autoreleasePoolPrint(void);

int main(int argc, const char * argv[]) {
    // 自动释放池
    @autoreleasepool {
//        for (int i = 0; i < 2; i++) {
//            // IFLDebug - Build Settings - (Apple Clang - Language - Objective C) - Automic Reference Counting     NO -- 使用 autorelease
//            IFLPerson *p1 = [[[IFLPerson alloc] init] autorelease];
//            NSLog(@"p1 = %@", p1);
//        }
        
        IFLPerson *p2 = [[IFLPerson alloc] init];
        NSLog(@"p2 = %@", p2);
        
        IFLPerson *p3 = [IFLPerson person];
        NSLog(@"p3 = %@", p3);
        
        IFLPerson *p4 = [IFLPerson person1:p2];
        NSLog(@"p4 = %@", p4);
        
        id test1 = [IFLPerson test1];
        NSLog(@"test1 = %@", test1);

        
//        @autoreleasepool {
//            for (int i = 0; i < 2; i++) {
//                IFLPerson *p1 = [[[IFLPerson alloc] init] autorelease];
//            }
//
//            @autoreleasepool {
//                IFLPerson *p1 = [[[IFLPerson alloc] init] autorelease];
//
//                _objc_autoreleasePoolPrint();
//            }
//
//            _objc_autoreleasePoolPrint();
//        }
        
        _objc_autoreleasePoolPrint();
        
    }
    return 0;
}
