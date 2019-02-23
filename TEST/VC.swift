//
//  VC.swift
//  TEST
//
//  Created by Егоров Андрей on 22/02/2019.
//  Copyright © 2019 Andrey Egorov. All rights reserved.
//

import UIKit

let myDate = Date()

var weekInSecond = TimeInterval(7 * 24 * 60 * 60)
var twoWeekInSecond = TimeInterval(weekInSecond * 2)
var dayInSecond = TimeInterval(24 * 60 * 60)
let calendarComponents = Calendar.current.dateComponents([.year, .month, .day, .hour] , from: myDate)
let dayToday = calendarComponents.day
let monthToday = calendarComponents.month
let hourNow = calendarComponents.hour
let format = DateFormatter()
var jobArray = [Date]()


class VC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var firstJobDayInYear = Calendar.current.date(byAdding: .day, value: -dayToday!, to: myDate)
        firstJobDayInYear = Calendar.current.date(byAdding: .month, value: -monthToday! + 1, to: firstJobDayInYear!)
        
        for _ in 1...26 {
            for _ in 1...7 {
//                format.dateFormat = "dd.MM"
//                print(format.string(from: firstJobDayInYear!) )
                jobArray.append(firstJobDayInYear!)
                firstJobDayInYear = Calendar.current.date(byAdding: .day, value: 1, to: firstJobDayInYear!)
            }
            
            firstJobDayInYear! += weekInSecond
//            print("...................")
        }
        
        var i = 7 // если 0 то дневные смены а если 7 то ночные
        for _ in 1...13 {
            
            for _ in 1...7 {
                print(jobArray[i])
                i += 1
            }
            i += 7
            print("...................")
        }
        
    }
    

}
