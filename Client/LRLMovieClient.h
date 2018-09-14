//
//  LRLMovieClient.h
//  MovieDataBaseC
//
//  Created by Levi Linchenko on 14/09/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LRLMovie.h"
#import <UIKit/UIKit.h>


@interface LRLMovieClient : NSObject

+(void)searchMovieByTitle: (NSString*) title withBlock: (void(^)(NSArray<LRLMovie*>* _Nullable movie))block;
+(void)fetchImage:(LRLMovie*)movie withBlock:(void(^)(UIImage* _Nullable image))block;

@end
