//
//  ScutoDevice.swift
//  Scuto
//
//  Created by Navine Manivannan on 2018-06-12.
//  Copyright © 2018 Scuto. All rights reserved.
//

//import Foundation
import UIKit
import DeviceKit

struct ScutoDevice {
    
    let device = Device()
    
    func isiPhoneX() -> Bool {
        return device.isOneOf([.iPhoneX, .simulator(.iPhoneX)])
    }
}
