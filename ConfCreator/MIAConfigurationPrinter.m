//
//  MIAConfigurationPrinter.m
//  ConfCreator
//
//  Created by Jacopo Pappalettera on 30/10/16.
//  Copyright © 2016 private. All rights reserved.
//

#import "MIAConfigurationPrinter.h"
#import "MIAComponent.h"
#import "MIAJunction.h"

@implementation MIAConfigurationPrinter
+(NSDictionary *)printConfiguration:(MIAConfiguration *)configuration adds:(NSDictionary *)adds{
    NSMutableArray *comps = [[NSMutableArray alloc]init];
    for (MIAComponent *component in [configuration components]) {
        [comps addObject:[component dataDict]];
    }
    NSMutableArray *juncs = [[NSMutableArray alloc]init];
    for (MIAJunction *junction in [configuration junctions]) {
        [juncs addObject:[junction dataDict]];
    }
    
    
    NSMutableDictionary *json = [[NSMutableDictionary alloc]init];
    [json setObject:comps forKey:@"components"];
    [json setObject:juncs forKey:@"junctions"];
    if (adds) {
        [json addEntriesFromDictionary:adds];
    }
    return (NSDictionary *)json;
}
@end
