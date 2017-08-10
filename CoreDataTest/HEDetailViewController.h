//
//  HEDetailViewController.h
//  CoreDataTest
//
//  Created by Виктор on 06.07.16.
//  Copyright © 2016 Hegefix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface HEDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *modelField;
@property (weak, nonatomic) IBOutlet UITextField *companyField;
@property (strong, nonatomic) NSManagedObject *device;

- (IBAction)saveButtonClick:(id)sender;

@end
