//
//  PrivacyManifestsWarningEmailFormatterTests.swift
//  PrivacyManifestsWarningEmailFormatterTests
//
//  Created by 中山龍 on 2024/03/16.
//

import XCTest
@testable import PrivacyManifestsWarningEmailFormatter

final class PrivacyManifestsWarningEmailFormatterTests: XCTestCase {

    let rawData = """
    Hello,

    We noticed one or more issues with a recent submission for App Store review for the following app:

    SampelApp - Sample App
    Version 1.0.0
    Build 1
    Although submission for App Store review was successful, you may want to correct the following issues in your next submission for App Store review. Once you've corrected the issues, upload a new binary to App Store Connect.

    ITMS-91053: Missing API declaration - Your app’s code in the “PlugIns/SampleApp.appex/Sample Broadcast Upload Extension” file references one or more APIs that require reasons, including the following API categories: NSPrivacyAccessedAPICategoryDiskSpace. While no action is required at this time, starting May 1, 2024, when you upload a new app or app update, you must include a NSPrivacyAccessedAPITypes array in your app’s privacy manifest to provide approved reasons for these APIs used by your app’s code. For more details about this policy, including a list of required reason APIs and approved reasons for usage, visit: https://developer.apple.com/documentation/bundleresources/privacy_manifest_files/describing_use_of_required_reason_api.

    ITMS-91053: Missing API declaration - Your app’s code in the “PlugIns/SampleApp Broadcast Upload Extension.appex/SampleApp Broadcast Upload Extension” file references one or more APIs that require reasons, including the following API categories: NSPrivacyAccessedAPICategoryFileTimestamp. While no action is required at this time, starting May 1, 2024, when you upload a new app or app update, you must include a NSPrivacyAccessedAPITypes array in your app’s privacy manifest to provide approved reasons for these APIs used by your app’s code. For more details about this policy, including a list of required reason APIs and approved reasons for usage, visit: https://developer.apple.com/documentation/bundleresources/privacy_manifest_files/describing_use_of_required_reason_api.

    ITMS-91053: Missing API declaration - Your app’s code in the “PlugIns/SampleApp Broadcast Upload Extension.appex/SampleApp Broadcast Upload Extension” file references one or more APIs that require reasons, including the following API categories: NSPrivacyAccessedAPICategoryUserDefaults. While no action is required at this time, starting May 1, 2024, when you upload a new app or app update, you must include a NSPrivacyAccessedAPITypes array in your app’s privacy manifest to provide approved reasons for these APIs used by your app’s code. For more details about this policy, including a list of required reason APIs and approved reasons for usage, visit: https://developer.apple.com/documentation/bundleresources/privacy_manifest_files/describing_use_of_required_reason_api.

    Apple Developer Relations
    """

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
}
