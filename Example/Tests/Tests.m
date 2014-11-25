//
//  JunctureTests.m
//  JunctureTests
//
//  Created by Nestor Lafon-Gracia on 11/19/2014.
//  Copyright (c) 2014 Nestor Lafon-Gracia. All rights reserved.
//

SPEC_BEGIN(InitialTests)

describe(@"My initial tests", ^{

//  context(@"will fail", ^{
//
//      it(@"can do maths", ^{
//          [[@1 should] equal:@2];
//      });
//
//      it(@"can read", ^{
//          [[@"number" should] equal:@"string"];
//      });
//    
//      it(@"will wait and fail", ^{
//          NSObject *object = [[NSObject alloc] init];
//          [[expectFutureValue(object) shouldEventually] receive:@selector(autoContentAccessingProxy)];
//      });
//  });

  context(@"will pass", ^{
    
      it(@"can do maths", ^{
        [[@1 should] beLessThan:@23];
      });
    
      it(@"can read", ^{
          [[@"team" shouldNot] containString:@"I"];
      });  
  });
  
});

SPEC_END
