//
//  ELGenerator.h
//  MageDataCSVGenerator
//
//  Created by Eddie Luke Atmey on 06/08/17.
//  Copyright © 2017 EL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CHCSVParser.h>

@interface ELGenerator : NSObject

+ (void)run;

/** Generate file and return file path */
+ (NSString *)generateFileForName:(NSString *)fileName;

/** Generate random string for a specific length. */
+  (NSString *)randomStringForLength:(NSInteger)len;

@end

#import "ELGenerator+Product.h"
#import "ELGenerator+Customer.h"
