#import <Foundation/Foundation.h>

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        if (argc < 2) {
            @throw @"Invalid args";
        }

        const char *target = argv[1];
        NSString *starget = [NSString stringWithUTF8String:target];

        if (starget.length < 3) {
            @throw @"Invalid target";
        }

        NSString *templateFile = [starget substringFromIndex:2];
    }
    return 0;
}
