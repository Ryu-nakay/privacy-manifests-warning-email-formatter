//
//  EmailFormatter.swift
//  PrivacyManifestsWarningEmailFormatter
//
//  Created by 中山龍 on 2024/03/16.
//

import Foundation
import RegexBuilder

struct EmailFormatter {
    func format(from input: String) -> String {
        let divided = blancLineDivider(input: input)
        let warningDataList = formatToWarningDataList(from: divided)
        let grouped = groupByFile(from: warningDataList)
        return grouped.reduce("") { partialResult, groupedWarningDataList in
            var groupText = partialResult + "\n"
            groupText += "\(groupedWarningDataList.first!.file)\n"
            _ = groupedWarningDataList.map { warningData in
                groupText += "- \(warningData.category)\n"
            }
            return groupText
        }
    }

    private func groupByFile(from warningDataList: [WarningData]) -> [[WarningData]] {
        let sorted = warningDataList.sorted { $0.file < $1.file }
        let grouped: [[WarningData]] = sorted.reduce([]) { partialResult, warningData in
            let isContainedFile = !partialResult
                .filter { warningDataList in
                    guard let file = warningDataList.first?.file else {
                        return false
                    }
                    return file == warningData.file
                }
                .isEmpty
            if isContainedFile {
                return partialResult.map { warningDataList in
                    if warningDataList.first?.file == warningData.file {
                        return warningDataList + [warningData]
                    } else {
                        return warningDataList
                    }
                }
            } else {
                return partialResult + [[warningData]]
            }
        }
        return grouped
    }

    private func blancLineDivider(input: String) -> [String] {
        input.components(separatedBy: "\n\n")
    }

    private func formatToWarningDataList(from: [String]) -> [WarningData] {
        let fileRegex = Regex {
            "“"
            /.+/
            "”"
        }
        let categoryRegex = Regex {
            "NSPrivacyAccessedAPICategory"
            ChoiceOf {
                "SystemBootTime"
                "DiskSpace"
                "FileTimestamp"
                "UserDefaults"
            }
        }
        return from.compactMap { lineText in
            let fileMatch = lineText.firstMatch(of: fileRegex)
            let categoryMatch = lineText.firstMatch(of: categoryRegex)
            guard let fileMatch, let categoryMatch else {
                return nil
            }
            return WarningData(
                file: String(fileMatch.0),
                category: String(categoryMatch.0)
            )
        }
    }
}
