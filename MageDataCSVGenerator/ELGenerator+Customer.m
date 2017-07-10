//
//  ELGenerator+Customer.m
//  MageDataCSVGenerator
//
//  Created by Eddie Luke Atmey on 06/14/17.
//  Copyright © 2017 EL. All rights reserved.
//

#import "ELGenerator+Customer.h"

@implementation ELGenerator (Customer)

/*
 email: unique (R)
 _website:
 _store:
 dob:
 middlename:
 prefix:
 reward_update_notification:
 reward_warning_notification:
 rp_token:
 rp_token_created_at:
 suffix:
 password:
 _address_city: (R)
 _address_company:
 _address_country_id:
 _address_fax:
 _address_firstname: (R)
 _address_lastname: (R)
 _address_middlename:
 _address_postcode: (R)
 _address_prefix:
 _address_region: (R)
 _address_street: (R)
 _address_suffix:
 _address_telephone: (R)
 _address_vat_id:
 _address_default_billing_: (R)
 _address_default_shipping_: (R)
 */
+ (void)generateCustomer
{
    for (NSInteger i = 0; i < 8; i++) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            [self generateCustomer:5000 forPage:i];
        });
    }
}

+ (void)generateCustomer:(NSInteger)total forPage:(NSInteger)page
{
    NSString *fileName = [NSString stringWithFormat:@"customer%02ld.csv", page];
    NSString *filePath = [self generateFileForName:fileName];

    CHCSVWriter *writer = [[CHCSVWriter alloc] initForWritingToCSVFile:filePath];
    [writer writeLineOfFields:@[@"email",
                                @"_website",
                                @"_store",
                                @"confirmation",
                                @"created_at",
                                @"created_in",
                                @"disable_auto_group_change",
                                @"dob",
                                @"firstname",
                                @"gender",
                                @"group_id",
                                @"lastname",
                                @"middlename",
                                @"password_hash",
                                @"prefix",
                                @"retail_telephone",
                                @"reward_update_notification",
                                @"reward_warning_notification",
                                @"rp_token",
                                @"rp_token_created_at",
                                @"store_id",
                                @"suffix",
                                @"taxvat",
                                @"website_id",
                                @"password",
                                @"_address_city",
                                @"_address_company",
                                @"_address_country_id",
                                @"_address_fax",
                                @"_address_firstname",
                                @"_address_lastname",
                                @"_address_postcode",
                                @"_address_prefix",
                                @"_address_region",
                                @"_address_street",
                                @"_address_suffix",
                                @"_address_telephone",
                                @"_address_vat_id",
                                @"_address_default_billing_",
                                @"_address_default_shipping_"]];

    NSInteger i = 0;
    while (i < 5000) {
        i++;
        NSString *email = [NSString stringWithFormat:@"email%ld@company.com", (long)i];
        NSString *storeName = (i % 2) ? @"english" : @"admin";
        NSString *storeId = @(arc4random_uniform(1)).stringValue;

        NSString *countryId = @"AL";
        NSString *addressCity = [NSString stringWithFormat:@"city %ld", (long)i];
        NSString *fName = [NSString stringWithFormat:@"fName%ld", (long)i];
        NSString *lName = [NSString stringWithFormat:@"lName%ld", (long)i];
        NSString *groupId = [NSString stringWithFormat:@"%ld", (long)arc4random_uniform(3) + 1];

        NSString *postCode = [NSString stringWithFormat:@"%05ld", (long)arc4random_uniform(99999)];
        NSString *region = [NSString stringWithFormat:@"region%ld", (long)i];
        NSString *street = [NSString stringWithFormat:@"street%ld", (long)i];

        NSString *telephone = [NSString stringWithFormat:@"%03ld-%05ld-%04ld", (long)arc4random_uniform(999), (long)arc4random_uniform(99999), (long)arc4random_uniform(9999)];

        NSArray *content = @[email,
                             @"base", // @"_website",
                             storeName,
                             @"", // @"confirmation",
                             @"", // @"created_at",
                             @"admin", // @"created_in",
                             @"0", //@"disable_auto_group_change",
                             @"", // @"dob",
                             fName,
                             @"", // @"gender",
                             groupId,
                             lName,
                             @"", // @"middlename",
                             @"", // @"password_hash",
                             @"", // @"prefix",
                             @"", // @"retail_telephone",
                             @"1", //@"reward_update_notification",
                             @"1", //@"reward_warning_notification",
                             @"", // @"rp_token",
                             @"", // @"rp_token_created_at",
                             storeId,
                             @"", // @"suffix",
                             @"", // @"taxvat",
                             @"1", //@"website_id",
                             @"", // @"password",
                             addressCity,
                             @"", // @"_address_company",
                             countryId,
                             @"", // @"_address_fax",
                             fName,
                             lName,
                             postCode,
                             @"", // @"_address_prefix",
                             region,
                             street,
                             @"", // @"_address_suffix",
                             telephone,
                             @"", // @"_address_vat_id",
                             @"1", //@"_address_default_billing_",
                             @"1"]; // @"_address_default_shipping_"


        [writer writeLineOfFields:content];
    }
    
    [writer closeStream];
}

#pragma mark - Mage2
+ (void)generateCustomer2
{
//    [self generateCustomer2:5 forPage:0];
    for (NSInteger i = 0; i < 8; i++) {
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            [self generateCustomer2:5000 forPage:i];
//        });
    }
}

+ (void)generateCustomer2:(NSInteger)total forPage:(NSInteger)page
{
    NSString *fileName = [NSString stringWithFormat:@"customerM2%02ld.csv", page];
    NSString *filePath = [self generateFileForName:fileName];

    CHCSVWriter *writer = [[CHCSVWriter alloc] initForWritingToCSVFile:filePath];
    [writer writeLineOfFields:@[@"email",
                                @"_website",
                                @"_store",
                                @"confirmation",
                                @"created_at",
                                @"created_in",
                                @"disable_auto_group_change",
                                @"dob",
                                @"firstname",
                                @"gender",
                                @"group_id",
                                @"lastname",
                                @"middlename",
                                @"password_hash",
                                @"prefix",
                                @"rp_token",
                                @"rp_token_created_at",
                                @"store_id",
                                @"suffix",
                                @"taxvat",
                                @"website_id",
                                @"password",
                                @"_address_city",
                                @"_address_company",
                                @"_address_country_id",
                                @"_address_fax",
                                @"_address_firstname",
                                @"_address_lastname",
                                @"_address_middlename",
                                @"_address_postcode",
                                @"_address_prefix",
                                @"_address_region",
                                @"_address_street",
                                @"_address_suffix",
                                @"_address_telephone",
                                @"_address_vat_id",
                                @"_address_default_billing_",
                                @"_address_default_shipping_"]];

    // Pre-Define
    NSArray *countries = @[@"AF", @"BR", @"AL", @"KR", @"LA", @"SE", @"JP", @"VN"];

    // Website id +
    NSDictionary *webSites = @{@"1" : @[@"1"],
                               @"2" : @[@"4", @"5"],
                               @"4" : @[@"9", @"8"],
                               @"6" : @[@"11", @"12"]};

    NSDictionary *webSiteCodes = @{@"1" : @"base",
                                   @"6" : @"asia",
                                   @"2" : @"usa",
                                   @"4" : @"eu"};

//    NSDictionary *stores = @{@"1" : @"Default store view",
//
//                             @"11" : @"Japan",
//                             @"12" : @"Korean",
//
//                             @"4" : @"California",
//                             @"5" : @"Washington",
//
//                             @"9" : @"Germany",
//                             @"8" : @"Spain"};

    NSInteger i = page * total;
    NSInteger upperBound = i + total;

    while (i < upperBound) {
        i++;
        NSString *email = [NSString stringWithFormat:@"email%ld@company.com", (long)i];
        NSString *webSiteId = webSites.allKeys[i % webSites.count];
        NSString *webSiteCode = webSiteCodes[webSiteId];

        NSArray *storeIds = webSites[webSiteId];
        NSString *storeId = storeIds[i % storeIds.count];
//        NSString *storeName = stores[storeId];

        NSString *countryId = countries[i % countries.count];
        NSString *fName = [NSString stringWithFormat:@"cu_fName%ld", (long)i];
        NSString *lName = [NSString stringWithFormat:@"cu_lName%ld", (long)i];
        NSString *groupId = @(i % 6).stringValue;

//        NSString *addressFName = [[[NSProcessInfo processInfo] globallyUniqueString] substringToIndex:30];
//        NSString *addressLName = [[[NSProcessInfo processInfo] globallyUniqueString] substringToIndex:30];
        NSString *addressCity = [[[NSProcessInfo processInfo] globallyUniqueString] substringToIndex:25];
        NSString *street = [[NSProcessInfo processInfo] globallyUniqueString];

        NSString *postCode = [NSString stringWithFormat:@"%05ld", (long)arc4random_uniform(99999)];
        NSString *telephone = [NSString stringWithFormat:@"%03ld-%05ld-%04ld", (long)arc4random_uniform(999), (long)arc4random_uniform(99999), (long)arc4random_uniform(9999)];

        NSArray *content = @[email,
                             webSiteCode,  // @"_website",
                             @"admin",     // @"_store",
                             @"",          // @"confirmation",
                             @"",          // @"created_at",
                             @"",          // @"created_in",
                             @"",          // @"disable_auto_group_change",
                             @"",          // @"dob",
                             fName,        // @"firstname",
                             @"",          // @"gender",
                             groupId,      // @"group_id",
                             lName,        // @"lastname",
                             @"",          // @"middlename",
                             @"",          // @"password_hash",
                             @"",          // @"prefix",
                             @"",          // @"rp_token",
                             @"",          // @"rp_token_created_at",
                             storeId,      // @"store_id",
                             @"",          // @"suffix",
                             @"",          // @"taxvat",
                             webSiteId,    // @"website_id",
                             @"",          // @"password",
                             addressCity,  // @"_address_city",
                             @"",          // @"_address_company",
                             countryId,    // @"_address_country_id",
                             @"",          // @"_address_fax",
                             fName,        // @"_address_firstname",
                             lName,        // @"_address_lastname",
                             @"",          // @"_address_middlename",
                             postCode,     // @"_address_postcode",
                             @"",          // @"_address_prefix",
                             @"",          // @"_address_region",
                             street,       // @"_address_street",
                             @"",          // @"_address_suffix",
                             telephone,    // @"_address_telephone",
                             @"",          // @"_address_vat_id",
                             @"1",         // @"_address_default_billing_",
                             @"1"];        // @"_address_default_shipping_"
        

        [writer writeLineOfFields:content];
    }
    
    [writer closeStream];
}

@end
