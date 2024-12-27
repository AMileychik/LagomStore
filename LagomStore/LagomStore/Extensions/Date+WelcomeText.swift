//
//  Date+WelcomeText.swift
//  LagomStore
//
//  Created by Александр Милейчик on 10/3/24.
//

import Foundation

//extension Date {
//    var welcomeText: String  {
//        let date = Date()
//        let calendar = Calendar.current
//        let hour = calendar.component(.hour, from: date)
//        var currentHour = "\(hour)"
//        
//        switch currentHour {
//            
//        case "5","6","7","8","9","10","11":
//            currentHour = "Good Morning"
//            
//        case "12","13","14","15","16","17":
//            currentHour = "Good Afternoon"
//            
//        case "18","19","20","21","22","23":
//            currentHour = "Good Evening"
//            
//        default:
//            currentHour = "Good Night"
//        }
//        
//        let textForLabel = "\(currentHour), \("Alexander")"
//        return textForLabel
//    }
//}

extension Date {
    var welcomeText: String {
        let hour = Calendar.current.component(.hour, from: self)
        let greeting: String
        
        switch hour {
        case 5...11:
            greeting = "Good Morning"
        case 12...17:
            greeting = "Good Afternoon"
        case 18...23:
            greeting = "Good Evening"
        default:
            greeting = "Good Night"
        }
        
        return "\(greeting), Alexander"
    }
}
