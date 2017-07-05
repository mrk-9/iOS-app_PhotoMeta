//
//  BaseourAPI.h
//  PhotoMeta
//
//  Created by star-perfect on 9/24/16.
//  Copyright © 2016 florian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseroutAPI : NSObject
{
}

+ (BaseroutAPI*) sharedInstance;

- (void) setVar:(NSString *)key theValue:(NSString*)value;
- (NSString *) getVar:(NSString *)key;

- (void) setObj:(NSString *)key theObject:(id)value;
- (id) getObj:(NSString *)key;
- (void) MessageBox : (NSString*) title Message:(NSString*) message;

@end
