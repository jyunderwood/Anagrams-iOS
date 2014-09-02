//
//  WordTree.h
//  Anagrams
//
//  Created by Jonathan on 9/2/14.
//  Copyright (c) 2014 Jonathan Underwood. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LetterNode.h"

@interface WordTree : NSObject

@property (strong, nonatomic) NSArray *roots;

- (LetterNode *)rootLetter:(NSString *)letter;

@end
