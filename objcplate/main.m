#import <Foundation/Foundation.h>

NSString *getTemplateFile(int argc, const char *argv[]) {
    if (argc < 2) {
        @throw @"Invalid args";
    }

    const char *target = argv[1];
    NSString *starget = [NSString stringWithUTF8String:target];

    if (starget.length < 3) {
        @throw @"Invalid target";
    }

    return [starget substringFromIndex:2];
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSString *templateFile = getTemplateFile(argc, argv);
    }
    return 0;
}
