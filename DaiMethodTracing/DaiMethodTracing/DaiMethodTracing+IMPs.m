//
//  DaiMethodTracing+IMPs.m
//  DaiMethodTracing
//
//  Created by 啟倫 陳 on 2014/5/27.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import "DaiMethodTracing+IMPs.h"

#import <objc/runtime.h>

#import "DaiMethodTracing+TypeEncoding.h"
#import "NSObject+MethodDeep.h"

#define createInvocation \
[self incDeep]; \
NSLog(@"(%lu)> start %@ at %@", (unsigned long)[self deep], self, NSStringFromSelector(_cmd)); \
NSTimeInterval startTime = [[NSDate date] timeIntervalSince1970]; \
NSString *methodName = NSStringFromSelector(_cmd); \
NSMethodSignature *signature = [self methodSignatureForSelector:NSSelectorFromString([NSString stringWithFormat:@"%@%@", swizzlingPrefix, methodName])]; \
NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature]; \
[invocation setTarget:self]; \
[invocation setSelector:NSSelectorFromString([NSString stringWithFormat:@"%@%@", swizzlingPrefix, methodName])];

#define setupInvocation \
va_list list; \
va_start(list, _cmd); \
addArguments(invocation, list); \
va_end(list);

#define invocationInvoke \
[invocation invoke]; \
NSLog(@"(%lu)> finish %@ at %@, use %fs", (unsigned long)[self deep], self, NSStringFromSelector(_cmd), [[NSDate date] timeIntervalSince1970] - startTime);

@implementation DaiMethodTracing (IMPs)

char charMethodIMP(id self, SEL _cmd, ...)
{
	createInvocation
	setupInvocation
	invocationInvoke
    
	char returnValue;
	[invocation getReturnValue:&returnValue];
	NSLog(@"(%lu)> return %c", (unsigned long)[self deep], returnValue);
	[self decDeep];
	return returnValue;
}

int intMethodIMP(id self, SEL _cmd, ...)
{
	createInvocation
	setupInvocation
	invocationInvoke
    
	int returnValue;
	[invocation getReturnValue:&returnValue];
	NSLog(@"(%lu)> return %i", (unsigned long)[self deep], returnValue);
	[self decDeep];
	return returnValue;
}

short shortMethodIMP(id self, SEL _cmd, ...)
{
	createInvocation
	setupInvocation
	invocationInvoke
    
	short returnValue;
	[invocation getReturnValue:&returnValue];
	NSLog(@"(%lu)> return %i", (unsigned long)[self deep], returnValue);
	[self decDeep];
	return returnValue;
}

long longMethodIMP(id self, SEL _cmd, ...)
{
	createInvocation
	setupInvocation
	invocationInvoke
    
	long returnValue;
	[invocation getReturnValue:&returnValue];
	NSLog(@"(%lu)> return %ld", (unsigned long)[self deep], returnValue);
	[self decDeep];
	return returnValue;
}

long long longlongMethodIMP(id self, SEL _cmd, ...)
{
	createInvocation
	setupInvocation
	invocationInvoke
    
	long long returnValue;
	[invocation getReturnValue:&returnValue];
	NSLog(@"(%lu)> return %lld", (unsigned long)[self deep], returnValue);
	[self decDeep];
	return returnValue;
}

unsigned char unsignedCharMethodIMP(id self, SEL _cmd, ...)
{
	createInvocation
	setupInvocation
	invocationInvoke
    
	unsigned char returnValue;
	[invocation getReturnValue:&returnValue];
	NSLog(@"(%lu)> return %c", (unsigned long)[self deep], returnValue);
	[self decDeep];
	return returnValue;
}

unsigned int unsignedIntMethodIMP(id self, SEL _cmd, ...)
{
	createInvocation
	setupInvocation
	invocationInvoke
    
	unsigned int returnValue;
	[invocation getReturnValue:&returnValue];
	NSLog(@"(%lu)> return %i", (unsigned long)[self deep], returnValue);
	[self decDeep];
	return returnValue;
}

unsigned short unsignedShortMethodIMP(id self, SEL _cmd, ...)
{
	createInvocation
	setupInvocation
	invocationInvoke
    
	unsigned short returnValue;
	[invocation getReturnValue:&returnValue];
	NSLog(@"(%lu)> return %i", (unsigned long)[self deep], returnValue);
	[self decDeep];
	return returnValue;
}

unsigned long unsignedLongMethodIMP(id self, SEL _cmd, ...)
{
	createInvocation
	setupInvocation
	invocationInvoke
    
	unsigned long returnValue;
	[invocation getReturnValue:&returnValue];
	NSLog(@"(%lu)> return %lu", (unsigned long)[self deep], returnValue);
	[self decDeep];
	return returnValue;
}

unsigned long long unsignedLongLongMethodIMP(id self, SEL _cmd, ...)
{
	createInvocation
	setupInvocation
	invocationInvoke
    
	unsigned long long returnValue;
	[invocation getReturnValue:&returnValue];
	NSLog(@"(%lu)> return %llu", (unsigned long)[self deep], returnValue);
	[self decDeep];
	return returnValue;
}

float floatMethodIMP(id self, SEL _cmd, ...)
{
	createInvocation
	setupInvocation
	invocationInvoke
    
	float returnValue;
	[invocation getReturnValue:&returnValue];
	NSLog(@"(%lu)> return %f", (unsigned long)[self deep], returnValue);
	[self decDeep];
	return returnValue;
}

double doubleMethodIMP(id self, SEL _cmd, ...)
{
	createInvocation
	setupInvocation
	invocationInvoke
    
	double returnValue;
	[invocation getReturnValue:&returnValue];
	NSLog(@"(%lu)> return %f", (unsigned long)[self deep], returnValue);
	[self decDeep];
	return returnValue;
}

BOOL boolMethodIMP(id self, SEL _cmd, ...)
{
	createInvocation
	setupInvocation
	invocationInvoke
    
	BOOL returnValue;
	[invocation getReturnValue:&returnValue];
	NSLog(@"(%lu)> return %@", (unsigned long)[self deep], returnValue ? @"YES" : @"NO");
	[self decDeep];
	return returnValue;
}

void voidMethodIMP(id self, SEL _cmd, ...)
{
	createInvocation
	setupInvocation
    invocationInvoke
	[self decDeep];
}

char *charPointerMethodIMP(id self, SEL _cmd, ...)
{
	createInvocation
	setupInvocation
	invocationInvoke
    
	char *returnValue;
	[invocation getReturnValue:&returnValue];
	NSLog(@"(%lu)> return %s", (unsigned long)[self deep], returnValue);
	[self decDeep];
	return returnValue;
}

id idMethodIMP(id self, SEL _cmd, ...)
{
	createInvocation
	setupInvocation
	invocationInvoke
    
	__unsafe_unretained id returnValue;
	[invocation getReturnValue:&returnValue];
	NSLog(@"(%lu)> return %@", (unsigned long)[self deep], returnValue);
	[self decDeep];
	return returnValue;
}

Class classMethodIMP(id self, SEL _cmd, ...)
{
	createInvocation
	setupInvocation
	invocationInvoke
    
	Class returnValue;
	[invocation getReturnValue:&returnValue];
	NSLog(@"(%lu)> return %@", (unsigned long)[self deep], returnValue);
	[self decDeep];
	return returnValue;
}

SEL selMethodIMP(id self, SEL _cmd, ...)
{
	createInvocation
	setupInvocation
	invocationInvoke
    
	SEL returnValue;
	[invocation getReturnValue:&returnValue];
	NSLog(@"(%lu)> return %@", (unsigned long)[self deep], NSStringFromSelector(returnValue));
	[self decDeep];
	return returnValue;
}

CGRect cgRectMethodIMP(id self, SEL _cmd, ...)
{
	createInvocation
	setupInvocation
	invocationInvoke
    
	CGRect returnValue;
	[invocation getReturnValue:&returnValue];
	NSLog(@"(%lu)> return %@", (unsigned long)[self deep], NSStringFromCGRect(returnValue));
	[self decDeep];
	return returnValue;
}

CGPoint cgPointMethodIMP(id self, SEL _cmd, ...)
{
	createInvocation
	setupInvocation
	invocationInvoke
    
	CGPoint returnValue;
	[invocation getReturnValue:&returnValue];
	NSLog(@"(%lu)> return %@", (unsigned long)[self deep], NSStringFromCGPoint(returnValue));
	[self decDeep];
	return returnValue;
}

CGSize cgSizeMethodIMP(id self, SEL _cmd, ...)
{
	createInvocation
	setupInvocation
	invocationInvoke
    
	CGSize returnValue;
	[invocation getReturnValue:&returnValue];
	NSLog(@"(%lu)> return %@", (unsigned long)[self deep], NSStringFromCGSize(returnValue));
	[self decDeep];
	return returnValue;
}

CGAffineTransform cgAffineTransformMethodIMP(id self, SEL _cmd, ...)
{
	createInvocation
	setupInvocation
	invocationInvoke
    
	CGAffineTransform returnValue;
	[invocation getReturnValue:&returnValue];
	NSLog(@"(%lu)> return %@", (unsigned long)[self deep], NSStringFromCGAffineTransform(returnValue));
	[self decDeep];
	return returnValue;
}

UIEdgeInsets uiEdgeInsetsMethodIMP(id self, SEL _cmd, ...)
{
	createInvocation
	setupInvocation
	invocationInvoke
    
	UIEdgeInsets returnValue;
	[invocation getReturnValue:&returnValue];
	NSLog(@"(%lu)> return %@", (unsigned long)[self deep], NSStringFromUIEdgeInsets(returnValue));
	[self decDeep];
	return returnValue;
}

UIOffset uiOffsetMethodIMP(id self, SEL _cmd, ...)
{
	createInvocation
	setupInvocation
	invocationInvoke
    
	UIOffset returnValue;
	[invocation getReturnValue:&returnValue];
	NSLog(@"(%lu)> return %@", (unsigned long)[self deep], NSStringFromUIOffset(returnValue));
	[self decDeep];
	return returnValue;
}

#pragma mark - private

void addArguments(NSInvocation *invocation, va_list list)
{
	for (NSUInteger i = 2; i < [[invocation methodSignature] numberOfArguments]; i++) {
		NSMutableString *argumentLogString = [NSMutableString string];
        
		[argumentLogString appendFormat:@"(%lu)> ", (unsigned long)[invocation.target deep]];
        
		switch (typeEncoding([NSString stringWithCString:[[invocation methodSignature] getArgumentTypeAtIndex:i]
		                                        encoding:NSUTF8StringEncoding])) {
			case DaiMethodTracingTypeChar:
			{
				char argument = va_arg(list, int);
				[invocation setArgument:&argument atIndex:i];
				[argumentLogString appendFormat:@"(char) %c", argument];
				break;
			}
                
			case DaiMethodTracingTypeInt:
			{
				int argument = va_arg(list, int);
				[invocation setArgument:&argument atIndex:i];
				[argumentLogString appendFormat:@"(int) %i", argument];
				break;
			}
                
			case DaiMethodTracingTypeShort:
			{
				short argument = va_arg(list, int);
				[invocation setArgument:&argument atIndex:i];
				[argumentLogString appendFormat:@"(shot) %i", argument];
				break;
			}
                
			case DaiMethodTracingTypeLong:
			{
				long argument = va_arg(list, long);
				[invocation setArgument:&argument atIndex:i];
				[argumentLogString appendFormat:@"(long) %li", argument];
				break;
			}
                
			case DaiMethodTracingTypeLongLong:
			{
				long long argument = va_arg(list, long long);
				[invocation setArgument:&argument atIndex:i];
				[argumentLogString appendFormat:@"(long long) %lld", argument];
				break;
			}
                
			case DaiMethodTracingTypeUnsignedChar:
			{
				unsigned char argument = va_arg(list, int);
				[invocation setArgument:&argument atIndex:i];
				[argumentLogString appendFormat:@"(unsigened char) %c", argument];
				break;
			}
                
			case DaiMethodTracingTypeUnsignedInt:
			{
				unsigned int argument = va_arg(list, unsigned int);
				[invocation setArgument:&argument atIndex:i];
				[argumentLogString appendFormat:@"(unsigned int) %i", argument];
				break;
			}
                
			case DaiMethodTracingTypeUnsignedShort:
			{
				unsigned short argument = va_arg(list, int);
				[invocation setArgument:&argument atIndex:i];
				[argumentLogString appendFormat:@"(unsigned short) %i", argument];
				break;
			}
                
			case DaiMethodTracingTypeUnsignedLong:
			{
				unsigned long argument = va_arg(list, unsigned long);
				[invocation setArgument:&argument atIndex:i];
				[argumentLogString appendFormat:@"(unsigned long) %lu", argument];
				break;
			}
                
			case DaiMethodTracingTypeUnsignedLongLong:
			{
				unsigned long long argument = va_arg(list, unsigned long long);
				[invocation setArgument:&argument atIndex:i];
				[argumentLogString appendFormat:@"(unsigned long long) %llu", argument];
				break;
			}
                
			case DaiMethodTracingTypeFloat:
			{
				float argument = va_arg(list, double);
				[invocation setArgument:&argument atIndex:i];
				[argumentLogString appendFormat:@"(float) %f", argument];
				break;
			}
                
			case DaiMethodTracingTypeDouble:
			{
				double argument = va_arg(list, double);
				[invocation setArgument:&argument atIndex:i];
				[argumentLogString appendFormat:@"(double) %f", argument];
				break;
			}
                
			case DaiMethodTracingTypeBool:
			{
				BOOL argument = va_arg(list, int);
				[invocation setArgument:&argument atIndex:i];
				[argumentLogString appendFormat:@"(BOOL) %@", argument ? @"YES":@"NO"];
				break;
			}
                
            case DaiMethodTracingTypeVoidPointer:
            {
                char *argument = va_arg(list, void *);
                [invocation setArgument:&argument atIndex:i];
                [argumentLogString appendFormat:@"(void*) %s", argument];
                break;
            }
                
			case DaiMethodTracingTypeCharPointer:
            {
                char *argument = va_arg(list, char *);
                [invocation setArgument:&argument atIndex:i];
                [argumentLogString appendFormat:@"(char*) %s", argument];
                break;
            }
                
			case DaiMethodTracingTypeObject:
			{
				id argument = va_arg(list, id);
				[invocation setArgument:&argument atIndex:i];
				[argumentLogString appendFormat:@"(id) %@", argument];
				break;
			}
                
			case DaiMethodTracingTypeClass:
			{
				Class argument = va_arg(list, Class);
				[invocation setArgument:&argument atIndex:i];
				[argumentLogString appendFormat:@"(Class) %@", argument];
				break;
			}
                
			case DaiMethodTracingTypeSelector:
			{
				SEL argument = va_arg(list, SEL);
				[invocation setArgument:&argument atIndex:i];
				[argumentLogString appendFormat:@"(SEL) %@", NSStringFromSelector(argument)];
				break;
			}
                
			case DaiMethodTracingTypeCGRect:
			{
				CGRect argument = va_arg(list, CGRect);
				[invocation setArgument:&argument atIndex:i];
				[argumentLogString appendFormat:@"(CGRect) %@", NSStringFromCGRect(argument)];
				break;
			}
                
			case DaiMethodTracingTypeCGPoint:
			{
				CGPoint argument = va_arg(list, CGPoint);
				[invocation setArgument:&argument atIndex:i];
				[argumentLogString appendFormat:@"(CGPoint) %@", NSStringFromCGPoint(argument)];
				break;
			}
                
			case DaiMethodTracingTypeCGSize:
			{
				CGSize argument = va_arg(list, CGSize);
				[invocation setArgument:&argument atIndex:i];
				[argumentLogString appendFormat:@"(CGSize) %@", NSStringFromCGSize(argument)];
				break;
			}
                
			case DaiMethodTracingTypeCGAffineTransform:
			{
				CGAffineTransform argument = va_arg(list, CGAffineTransform);
				[invocation setArgument:&argument atIndex:i];
				[argumentLogString appendFormat:@"(CGAffineTransform) %@", NSStringFromCGAffineTransform(argument)];
				break;
			}
                
			case DaiMethodTracingTypeUIEdgeInsets:
			{
				UIEdgeInsets argument = va_arg(list, UIEdgeInsets);
				[invocation setArgument:&argument atIndex:i];
				[argumentLogString appendFormat:@"(UIEdgeInsets) %@", NSStringFromUIEdgeInsets(argument)];
				break;
			}
                
			case DaiMethodTracingTypeUIOffset:
			{
				UIOffset argument = va_arg(list, UIOffset);
				[invocation setArgument:&argument atIndex:i];
				[argumentLogString appendFormat:@"(UIOffset) %@", NSStringFromUIOffset(argument)];
				break;
			}
                
			default:
				NSLog(@"%@, %@", NSStringFromSelector([invocation selector]), [NSString stringWithCString:[[invocation methodSignature] getArgumentTypeAtIndex:i]
				                                                                                 encoding:NSUTF8StringEncoding]);
				break;
		}
        
		NSLog(@"%@", argumentLogString);
	}
}

@end
