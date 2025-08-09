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
        NSString *content =
            [NSString stringWithContentsOfFile:templateFile
                                      encoding:NSUTF8StringEncoding
                                         error:nil];
        NSFileManager *fileManager = [NSFileManager defaultManager];

        NSArray *lines = [content componentsSeparatedByString:@"\n"];
        int spaces = 0;
        NSString *parent = @"";

        for (NSString *line in lines) {
            if (line.length < 3) {
                @throw @"Invalid template file";
            }

            bool isDirectory = [line characterAtIndex:spaces] == '/';
            if (isDirectory) {
                NSString *directoryName = [line substringFromIndex:spaces + 1];
                NSString *path = [parent stringByAppendingString:directoryName];
                [fileManager createDirectoryAtPath:path
                       withIntermediateDirectories:true
                                        attributes:nil
                                             error:nil];
                parent = [parent
                    stringByAppendingString:[directoryName
                                                stringByAppendingString:@"/"]];
                spaces += 2;
            } else {
                NSString *fileName = [line substringFromIndex:spaces];
                NSString *path = [parent stringByAppendingString:fileName];
                [fileManager createFileAtPath:path contents:nil attributes:nil];
            }
        }
    }
    return 0;
}
