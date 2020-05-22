//
//  ViewController.m
//  FileSystem
//
//  Created by tigerfly on 2020/5/22.
//  Copyright © 2020 tigerfly. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
//    Clones Reduce the Cost of Copying
    NSURL *origin = [NSURL fileURLWithPath:@"/path/to/origin"];
    NSURL *destination = [NSURL fileURLWithPath:@"/path/to/destination"];
    @try {
        [[NSFileManager defaultManager] copyItemAtURL:origin toURL:destination error:nil];
    } @catch (NSException *exception) {
        //handle the error
        NSLog(@"reason %@",exception.reason);
        NSLog(@"userInfo %@",exception.userInfo);

    } @finally {
    }
    
//    Free Space Is Shared Between Volumes
    NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:@"/" error:nil];
    NSString *availableFreeSpace = attributes[NSFileSystemFreeSize];
    NSLog(@"%@",availableFreeSpace);
    
    
    
    // Do any additional setup after loading the view.
}


@end
