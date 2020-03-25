//
//  Strings.h
//  DataStructures
//
//  Created by Mithlesh Kumar Jha on 2/9/19.
//  Copyright © 2019 Mithlesh Kumar Jha. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Strings : NSObject

//// Scans the input string and divides the string into subsequences seperated by the character K.
+ (NSString*) formattedLicenseKey:(NSString*)license
         subsequentFragmentLength:(NSInteger)k
               insertingCharacter:(unichar)character;

@end

NS_ASSUME_NONNULL_END
