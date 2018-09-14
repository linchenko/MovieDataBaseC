//
//  LRLMovie.h
//  MovieDataBaseC
//
//  Created by Levi Linchenko on 14/09/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LRLMovie : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *releaseDate;
@property (nonatomic, copy) NSString *movieDescription;
@property (nonatomic, copy) NSString *imagePath;
@property (nonatomic) NSNumber* identification;

-(instancetype)initWithDictionary: (NSDictionary*)movieDictionary;

@end
