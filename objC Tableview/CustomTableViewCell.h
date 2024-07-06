//
//  TableViewCell.h
//  objC Tableview
//
//  Created by Aryan Sharma on 06/07/24.
//

#import <UIKit/UIKit.h>

@class Photo;

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *picsumImage;
@property (weak, nonatomic) IBOutlet UILabel *author;

- (void)configureWithPhoto:(Photo *)photo;
@end
