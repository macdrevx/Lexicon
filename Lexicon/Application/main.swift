//
//  main.swift
//  Lexicon
//
//  Created by Andrew Hershberger on 9/28/17.
//  Copyright © 2017 Andrew Hershberger. All rights reserved.
//

import UIKit

// Skip the usual app delegate when running unit tests

let delegateClassName: String
if ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] == nil {
    delegateClassName = NSStringFromClass(AppDelegate.self)
} else {
    delegateClassName = NSStringFromClass(MockAppDelegate.self)
}

// Workaround for UIApplicationMain/CommandLine.unsafeArgv type mismatch

let argv = UnsafeMutableRawPointer(CommandLine.unsafeArgv)
    .bindMemory(to: UnsafeMutablePointer<Int8>.self, capacity: Int(CommandLine.argc))

UIApplicationMain(CommandLine.argc, argv, nil, delegateClassName)
