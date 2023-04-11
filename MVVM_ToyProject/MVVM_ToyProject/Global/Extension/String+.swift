//
//  Date+.swift
//  MVVM_ToyProject
//
//  Created by 한택환 on 2023/04/11.
//

import Foundation

extension String {
    func formatStringToFullDate() -> Date? {
        let strDate = self.components(separatedBy: ["T", "Z"]).joined()
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        dateFormatter.dateFormat = "yyyy-MM-ddHH:mm:ss"
        return dateFormatter.date(from: strDate)
    }
}
