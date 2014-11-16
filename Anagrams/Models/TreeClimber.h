//
//  TreeClimber.h
//  Anagrams
//
//  Created by Jonathan on 9/2/14.
//  Copyright (c) 2014 Jonathan Underwood. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LetterNode;

@interface TreeClimber : NSObject

@property (nonatomic, strong) NSMutableArray *results;

- (instancetype)initWithTree:(LetterNode *)rootNode andLetters:(NSString *)letters;
- (void)startClimbing;

@end
