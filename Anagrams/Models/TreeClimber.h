//
//  TreeClimber.h
//  Anagrams
//
//  Created by Jonathan on 9/2/14.
//  Copyright (c) 2014 Jonathan Underwood. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WordTree.h"

@interface TreeClimber : NSObject

@property (nonatomic, strong) NSMutableArray *results;

- (instancetype)initWithWordTree:(WordTree *)wordTree andLetters:(NSString *)letters;
- (void)startClimbing;

@end
