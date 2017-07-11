//
//  ELGenerator.m
//  MageDataCSVGenerator
//
//  Created by Eddie Luke Atmey on 06/08/17.
//  Copyright © 2017 EL. All rights reserved.
//

#import "ELGenerator.h"
#import <Objective-Zip.h>

@implementation ELGenerator

static OZZipFile *zipFile;

+ (void)run
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        zipFile = [[OZZipFile alloc] initWithFileName:@"ProductM2.zip"
                                                 mode:OZZipFileModeCreate];
    });

    [self generateProduct2];
    [zipFile close];
}

+ (NSString *)generateFileForName:(NSString *)fileName
{
    // Generate empty file
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:fileName];
    [fileManager createFileAtPath:filePath contents:nil attributes:nil];

    NSLog(@"file path: %@", filePath);

    return filePath;
}

+ (void)compressFilePath:(NSString *)filePath fileName:(NSString *)fileName
{
    OZZipWriteStream *stream = [zipFile writeFileInZipWithName:fileName
                                             compressionLevel:OZZipCompressionLevelBest];

    [stream writeData:[NSData dataWithContentsOfFile:filePath]];
    [stream finishedWriting];

    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager removeItemAtPath:filePath error:nil];

    NSLog(@"Compress %@ into: %@", fileName, filePath);
}

+ (NSString *)randomStringForLength:(NSInteger)len
{
//    static NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ";
    static char const possibleChars[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ";
//    int letterCount = (int)letters.length;
    unichar characters[len];

//    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];

    for (int i = 0; i < len; i++) {
//        [randomString appendFormat: @"%C", [letters characterAtIndex:arc4random_uniform(letterCount)]];
        characters[ i ] = possibleChars[arc4random_uniform(sizeof(possibleChars) - 1)];
    }
    
    return [NSString stringWithCharacters:characters length:len]; // randomString;
}

@end
