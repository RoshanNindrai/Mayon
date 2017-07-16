//
//  IOSFinder.swift
//  Mayon
//
//  Created by Roshan Nindrai on 5/26/17.
//
//

import Foundation

final class IOSFinder {
    var devices: [Device] = []
    let notificationPointer = UnsafeMutablePointer<UnsafeMutablePointer<am_device_notification>?>
        .allocate(capacity: MemoryLayout<am_device_notification>.stride)
}

extension IOSFinder: FinderProtocol {
    /// Runs platform specific code to find devices connected to the machine till timeout period
    func find(_ timeout: Double) {
        AMDeviceNotificationSubscribe({ (amdevice, msg) in
            print(Device(amdevice: amdevice) ?? "Failed during Device Creation")
        }, 0, 0, 0, notificationPointer)
        CommandBus.main.asyncAfter(deadline: DispatchTime.init(uptimeNanoseconds: 0) + timeout) {
            exit(0)
        }
    }
}
