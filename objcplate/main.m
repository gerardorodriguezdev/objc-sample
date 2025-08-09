#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
         if (argc < 2) {
             @throw @"Invalid args";
         }
    }
    return 0;
}
