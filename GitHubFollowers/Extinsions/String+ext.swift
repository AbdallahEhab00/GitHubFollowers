//
//  String+ext.swift
//  GitHubFollowers
//
//  Created by Abdallah Ehab on 01/06/2022.
//

import Foundation

extension String {
    
    func convertToDate()->Date?{
        let dateFormatter          = DateFormatter()
        dateFormatter.dateFormat   = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale       = Locale(identifier: "en_US_POSFIX")
        dateFormatter.timeZone     = .current
        return dateFormatter.date(from: self)
    }
    
    func ConvertToDisplayFormate()->String{
        guard let date = convertToDate() else {return "N/A" }
        return  date.convertToMonthYearFormate()
    }
}
