//
//  NSFileManagerViewController.m
//  FileSystem
//
//  Created by tigerfly on 2020/5/22.
//  Copyright © 2020 tigerfly. All rights reserved.
//

#import "NSFileManagerViewController.h"

@interface NSFileManagerViewController ()

@end

@implementation NSFileManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    //thread safely (Threading Considerations)
    
    [NSFileManager filemanager]
    
    
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
