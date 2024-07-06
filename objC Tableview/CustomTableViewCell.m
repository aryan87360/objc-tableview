//
//  TableViewCell.m
//  objC Tableview
//
//  Created by Aryan Sharma on 06/07/24.
//

#import "CustomTableViewCell.h"
#import "Photo.h"
#import <SDWebImage/SDWebImage.h>
#import <SDWebImage/UIImageView+WebCache.h>


@implementation CustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)prepareForReuse {
    [super prepareForReuse];
    self.picsumImage.image = nil;
    self.author.text = nil;
}

- (void)configureWithPhoto:(Photo *)photo {
    self.author.text = photo.author;
    NSURL *photoURL = [NSURL URLWithString:photo.download_url];
    [self.picsumImage sd_setImageWithURL:photoURL
                        placeholderImage:[UIImage imageNamed:@"empty"]
                                 options:SDWebImageRefreshCached
                                 progress:nil
                                completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (image && cacheType == SDImageCacheTypeNone) {
            [UIView transitionWithView:self.picsumImage
                              duration:0.3
                               options:UIViewAnimationOptionTransitionCrossDissolve
                            animations:nil
                            completion:nil];
        }
    }];



}

@end
