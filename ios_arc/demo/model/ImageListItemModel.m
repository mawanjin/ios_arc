//
//  ImageListItemModel.m
//  ios_arc
//
//  Created by lala on 2019/2/25.
//  Copyright © 2019 mawj. All rights reserved.
//

#import "ImageListItemModel.h"

@implementation ImageListItemModel

-(id)initWithNameUrl:(NSString*)name Url:(NSString*)url{
    self = [super init];
    if(self){
        self.name = name;
        self.url = url;
    }
    return self;
}

@end
