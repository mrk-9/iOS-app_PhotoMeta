//
//  Apimanager.h
//  PhotoMeta
//
//  Created by star-perfect on 9/24/16.
//  Copyright © 2016 florian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Apimanager : NSObject
{
}
-(void)callAPI:(NSString*)api_name withParams:(NSDictionary*)params success:(void (^)(NSData *data))successBlock error:(void(^)(NSError *error))errorBlock;
@end
