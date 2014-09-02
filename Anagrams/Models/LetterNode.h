//
//  LetterNode.h
//  Anagrams
//
//  Created by Jonathan on 9/2/14.
//  Copyright (c) 2014 Jonathan Underwood. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LetterNode : NSObject

@property (nonatomic, strong) NSString *letterValue;
@property (nonatomic, strong) NSMutableArray *childNodes;
@property (nonatomic) BOOL endOfWord;

- (instancetype)initWithLetterValue:(NSString *)letter;

- (LetterNode *)addChildLetter:(NSString *)letter;

@end
