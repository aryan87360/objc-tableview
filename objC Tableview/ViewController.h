//
//  ViewController.h
//  objC Tableview
//
//  Created by Aryan Sharma on 06/07/24.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITabBarDelegate>
@property (weak, nonatomic) IBOutlet UITableView *picsumTableView;
@property (strong, nonatomic) NSMutableArray *photos;


@end

