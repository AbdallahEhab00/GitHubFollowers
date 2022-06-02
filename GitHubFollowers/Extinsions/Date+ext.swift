//
//  Date+ext.swift
//  GitHubFollowers
//
//  Created by Abdallah Ehab on 01/06/2022.
//

import Foundation


extension Date {
    
    func convertToMonthYearFormate()->String{
        let dateFormatter         = DateFormatter()
        dateFormatter.dateFormat  = "MMM yyy"
        return  dateFormatter.string(from: self)
    }
}
