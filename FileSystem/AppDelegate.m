//
//  AppDelegate.m
//  FileSystem
//
//  Created by tigerfly on 2020/5/22.
//  Copyright © 2020 tigerfly. All rights reserved.
//

#import "AppDelegate.h"
#import "FileSystemOperations.h"
#import "ManagedFileAccess.h"
#import "SharedFiles.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    ViewController *vc = [ViewController new];
    FileSystemOperations *vc = [FileSystemOperations new];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    
    return YES;
}




@end
