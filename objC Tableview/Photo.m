//
//  Photo.m
//  objC Tableview
//
//  Created by Aryan Sharma on 06/07/24.
//

#import "Photo.h"

@implementation Photo

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self){
        _id = dictionary[@"id"];
        _author = dictionary[@"author"];
        _download_url = dictionary[@"download_url"];
        
    }
    return self;
}


@end
