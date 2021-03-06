//
//  FinderFactory.swift
//  Mayon
//
//  Created by Roshan Nindrai on 5/26/17.
//
//

import Foundation

public struct FinderFactory {
    public static func finderFor(platform: Platform) -> FinderProtocol {
        switch platform {
        case .iOS:
            return IOSFinder()
        }
    }
}

public struct InstallerFactory {
    public static func installerFor(platform: Platform) -> InstallerProtocol {
        switch platform {
        case .iOS:
            return IOSInstaller()
        }
    }
}
