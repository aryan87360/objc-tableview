//
//  ViewController.m
//  objC Tableview
//
//  Created by Aryan Sharma on 06/07/24.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"
#import "Photo.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        self.photos = [NSMutableArray array];
        self.picsumTableView.delegate = self;
        self.picsumTableView.dataSource = self;
        [self fetchPhotos];
}


-(void)fetchPhotos {
    NSURL *url = [NSURL URLWithString:@"https://picsum.photos/v2/list?page=2&limit=30"];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error Fetching data: %@", error);
            return;;
        }
        NSError *jsonError = nil;
        NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError){
            NSLog(@"Error decodind JSON %@",jsonError);
            return;;
        }
        for (NSDictionary *dict in jsonArray){
            Photo *photo = [[Photo alloc] initWithDictionary:dict];
            [self.photos addObject:photo];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.picsumTableView reloadData];
        });
    }];
    [task resume];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.photos.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomTableViewCell" forIndexPath:indexPath];
    Photo *photo = self.photos[indexPath.row];
    [cell configureWithPhoto: photo];
    return cell;
    
}


@end
