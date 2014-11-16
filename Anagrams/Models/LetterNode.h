//
//  LetterNode.h
//  Anagrams
//
//  Created by Jonathan on 9/2/14.
//  Copyright (c) 2014 Jonathan Underwood. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LetterNode : NSObject

@property (nonatomic) char letter;
@property (nonatomic) BOOL endOfWord;

- (instancetype)initWithLetter:(char)letter;

- (LetterNode *)addChildLetter:(char)letter;
- (NSString *)letterValue;
- (NSArray *)childNodes;

@end
