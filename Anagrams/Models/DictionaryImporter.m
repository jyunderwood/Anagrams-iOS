//
//  DictionaryImporter.m
//  Anagrams
//
//  Created by Jonathan on 9/2/14.
//  Copyright (c) 2014 Jonathan Underwood. All rights reserved.
//

#import "DictionaryImporter.h"
#import "LetterNode.h"

@interface DictionaryImporter()
@property (nonatomic, strong) NSArray *words;
@end

@implementation DictionaryImporter

- (instancetype)initWithDictionaryName:(NSString *)dictionaryName {
    self = [super init];

    if (self) {
        NSString *dictionaryPath = [[NSBundle mainBundle] pathForResource:dictionaryName ofType:@"txt"];
        NSString *fileContents = [NSString stringWithContentsOfFile:dictionaryPath encoding:NSUTF8StringEncoding error:nil];

        _words = [fileContents componentsSeparatedByCharactersInSet: [NSCharacterSet newlineCharacterSet]];
    }

    return self;
}

- (LetterNode *)buildTreeWithProgress:(void (^)(long, long))progressBlock {
    NSDate *importStart = [NSDate date];

    LetterNode *rootNode = [[LetterNode alloc] init];

    long wordsToImport = [self.words count];
    long numberImported = 0;

    for (NSString *word in self.words) {
        LetterNode *previousLetter = rootNode;

        for (int i=0; i < [word length]; i++) {
            char letter = [word characterAtIndex:i];
            previousLetter = [previousLetter addChildLetter:letter];
        }

        previousLetter.endOfWord = YES;

        numberImported++;
        progressBlock(wordsToImport, numberImported);
    }

    NSDate *importFinish = [NSDate date];
    NSTimeInterval importTime = [importFinish timeIntervalSinceDate:importStart];
    NSLog(@"Dictionary Import time: %f", importTime);

    return rootNode;
}

@end
