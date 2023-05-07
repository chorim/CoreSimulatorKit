//
//  CoreSimulatorController.h
//  
//
//  Created by Insu Byeon on 2023/05/07.
//

#ifndef CoreSimulatorController_h
#define CoreSimulatorController_h

#import <Foundation/Foundation.h>

@class SimDevice, CoreSimulatorDevice;

@interface CoreSimulatorController : NSObject
/// Get a list with all booted devices from simulators.
+ (NSArray <CoreSimulatorDevice *>*)availableDevices;
@end

#endif /* CoreSimulatorController_h */
