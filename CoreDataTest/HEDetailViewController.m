//
//  HEDetailViewController.m
//  CoreDataTest
//
//  Created by Виктор on 06.07.16.
//  Copyright © 2016 Hegefix. All rights reserved.
//

#import "HEDetailViewController.h"

@interface HEDetailViewController ()

@end

@implementation HEDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.device) {
        [self.nameField setText:[self.device valueForKey:@"name"]];
        [self.modelField setText:[self.device valueForKey:@"model"]];
        [self.companyField setText:[self.device valueForKey:@"company"]];
    }
}

#pragma mark - Actions -

- (IBAction)saveButtonClick:(id)sender {
    
    NSManagedObjectContext *context = [self _managedObjectContext];
    if (self.device) {
        [self.device setValue:self.nameField.text forKey:@"name"];
        [self.device setValue:self.modelField.text forKey:@"model"];
        [self.device setValue:self.companyField.text forKey:@"company"];
    } else {
        NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Device" inManagedObjectContext:context];
        [newDevice setValue:self.nameField.text forKey:@"name"];
        [newDevice setValue:self.modelField.text forKey:@"model"];
        [newDevice setValue:self.companyField.text forKey:@"company"];
    }
    
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Can't save! %@ %@",error, [error localizedDescription]);
    } else {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Добавлено" message:@"Новое устройство успешно добавлено!" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:okAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

#pragma mark - Private -

- (NSManagedObjectContext *)_managedObjectContext {
    
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

@end
