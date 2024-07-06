//
//  Photo.h
//  objC Tableview
//
//  Created by Aryan Sharma on 06/07/24.
//

#import <Foundation/Foundation.h>


@interface Photo : NSObject

@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *download_url;

- (instancetype)initWithDictionary:(NSDictionary *)dictionar;

@end

