//
//  Strings.m
//  DataStructures
//
//  Created by Mithlesh Kumar Jha on 2/9/19.
//  Copyright © 2019 Mithlesh Kumar Jha. All rights reserved.
//

#import "Strings.h"

char* licenseKeyFormatting(char* S, int K) {

    unsigned long length = strlen(S);
    unsigned long allocatedLength = length + 1 + length/K;
    char *r = (char*)malloc(sizeof(char) * allocatedLength);
    r[allocatedLength] = 0;
    int count = 0;
    long j = allocatedLength - 1;

    for (long i= length - 1; i >= 0 && j >=0; --i) {
        char n = S[i];

        if (!isalnum(n)) {
            continue;
        }

        if (islower(n)) {
            n = toupper(n);
        }

        if (count == K) {
            r[j--] = '-';
            count = 0;
        }

        r[j--] = n;
        count++;
    }

    if (j < 0) {
        return r;
    }

    long k = j + 1;
    for (int i = k; ; ++i) {
        r[i - k] = r[i];
        if (r[i] == 0)
            break;
    }

    return r;
}

@implementation Strings

+ (NSString*) formattedLicenseKey:(NSString*)license
         subsequentFragmentLength:(NSInteger)k
               insertingCharacter:(unichar)character {

    char * str = licenseKeyFormatting(license.UTF8String, (int)k);
    // Scan the String
    NSMutableString *result = [NSMutableString new];
    NSUInteger length = license.length;
    NSInteger count = 0;
    NSString *charString = [[NSString alloc] initWithCharacters:&character length:1];

    for (NSUInteger i = length - 1; i >= 0; --i) {
        unichar nextChar = [license characterAtIndex:i];
        if (!isalnum(nextChar)) {
            if (i == 0) {
                break;
            }
            continue;
        }

        if (count == k) {
            [result insertString:charString atIndex:0];
            count = 0;
        }

        if (islower(nextChar)) {
            nextChar = toupper(nextChar);
        }

        [result insertString:[NSString stringWithCharacters:&nextChar length:1] atIndex:0];
        count++;

        if (i == 0) {
            break;
        }
    }
    return result;
}

@end
