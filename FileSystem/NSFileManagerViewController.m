//
//  NSFileManagerViewController.m
//  FileSystem
//
//  Created by tigerfly on 2020/5/22.
//  Copyright © 2020 tigerfly. All rights reserved.
//

#import "NSFileManagerViewController.h"

@interface NSFileManagerViewController ()<NSCoding>

@end

@implementation NSFileManagerViewController {
    
    NSFileManager *_fileManager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    //thread safely (Threading Considerations)
    
    
    //Creating File Manager
//    _fileManager = [NSFileManager defaultManager];
    _fileManager = [[NSFileManager alloc] init];
    
    
    //Accessing User Directories
    NSString *homeDirectory = NSHomeDirectory();
    NSLog(@"homeDirectory %@",homeDirectory);
    NSString *userName = NSUserName();
    NSLog(@"userName %@",userName);
    NSString *fullUserName = NSFullUserName();
    NSLog(@"fullUserName %@",fullUserName);
    NSString *homeDirectoryForUser = NSHomeDirectoryForUser(userName);
    NSLog(@"homeDirectoryForUser %@",homeDirectoryForUser);
    
    NSLog(@"temporaryDirectory %@",[[_fileManager temporaryDirectory] relativeString]);
    NSString *temporaryDirectory = NSTemporaryDirectory();
    NSLog(@"temporaryDirectory %@",temporaryDirectory);
    
    
    //Locating System Directories
    NSError *error = nil;
    NSURL *url = [_fileManager URLForDirectory:NSCachesDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:true error:&error];
    NSLog(@"urlDirectory %@",url.absoluteString);
    
    NSString *rootDirectory = NSOpenStepRootDirectory();
    NSLog(@"rootDirectory %@",rootDirectory);
    
    
    //Locating Application Group Container Directories
    [_fileManager containerURLForSecurityApplicationGroupIdentifier:@""];
    
    
    //Discovering Directory Contents
    NSURL *temporaryURL = [_fileManager temporaryDirectory];
    NSError *contentError = nil;
    NSArray *contentURLs = [_fileManager contentsOfDirectoryAtURL:temporaryURL includingPropertiesForKeys:nil options:nil error:&contentError];
    NSLog(@"contentURLs %@",contentURLs);
    [_fileManager contentsOfDirectoryAtPath:NSHomeDirectory() error:&contentError];
    [_fileManager enumeratorAtPath:NSHomeDirectory()];

    
    //Creating and Deleting Items
    BOOL createResult = [_fileManager createDirectoryAtURL:temporaryURL withIntermediateDirectories:true attributes:nil error:nil];
    NSLog(@"createResult %d",createResult);
    NSData *contents = [@"fdas" dataUsingEncoding:NSUTF8StringEncoding];
    BOOL createFileResult = [_fileManager createFileAtPath:NSHomeDirectory() contents:contents attributes:nil];
    NSLog(@"createFileResult %d",createFileResult);
    BOOL removeResult = [_fileManager removeItemAtURL:temporaryURL error:nil];
    NSLog(@"removeResult %d",removeResult);
    
    
    //Replacing Items
//    _fileManager replaceItemAtURL:<#(nonnull NSURL *)#> withItemAtURL:<#(nonnull NSURL *)#> backupItemName:<#(nullable NSString *)#> options:<#(NSFileManagerItemReplacementOptions)#> resultingItemURL:<#(NSURL * _Nullable __autoreleasing * _Nullable)#> error:<#(NSError *__autoreleasing  _Nullable * _Nullable)#>
    
    
    //Moving and Copying Items
//    _fileManager copyItemAtURL:<#(nonnull NSURL *)#> toURL:<#(nonnull NSURL *)#> error:<#(NSError *__autoreleasing  _Nullable * _Nullable)#>
//    _fileManager moveItemAtURL:<#(nonnull NSURL *)#> toURL:<#(nonnull NSURL *)#> error:<#(NSError *__autoreleasing  _Nullable * _Nullable)#>
    
    
    //Accessing File Provider Services
//    _fileManager getFileProviderServicesForItemAtURL:<#(nonnull NSURL *)#> completionHandler:<#^(NSDictionary<NSFileProviderServiceName,NSFileProviderService *> * _Nullable services, NSError * _Nullable error)completionHandler#>
    
    
    //Creating Symbolic and Hard Links
//    _fileManager createSymbolicLinkAtURL:<#(nonnull NSURL *)#> withDestinationURL:<#(nonnull NSURL *)#> error:<#(NSError *__autoreleasing  _Nullable * _Nullable)#>
//    _fileManager linkItemAtURL:<#(nonnull NSURL *)#> toURL:<#(nonnull NSURL *)#> error:<#(NSError *__autoreleasing  _Nullable * _Nullable)#>
//    _fileManager destinationOfSymbolicLinkAtPath:<#(nonnull NSString *)#> error:<#(NSError *__autoreleasing  _Nullable * _Nullable)#>
    
    
    //Determining Access to Files
    [_fileManager fileExistsAtPath:temporaryDirectory];
    BOOL directory = nil;
    [_fileManager fileExistsAtPath:temporaryDirectory isDirectory:&directory];
    BOOL readable = [_fileManager isReadableFileAtPath:temporaryDirectory];
    BOOL writeable = [_fileManager isWritableFileAtPath:temporaryDirectory];
    BOOL executable = [_fileManager isExecutableFileAtPath:temporaryDirectory];
    BOOL deleteable = [_fileManager isDeletableFileAtPath:temporaryDirectory];
    
    
    //Getting and Setting Attributes
    [_fileManager componentsToDisplayForPath:temporaryDirectory];
    
    
    
    
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
