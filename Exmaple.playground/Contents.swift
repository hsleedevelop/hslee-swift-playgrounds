//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd" //Your date format
dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00") //Current time zone
let date = dateFormatter.date(from: "2018-1-31")! //according to date format your date string
print(date) //Convert String to Date

let gre = Calendar.init(identifier: .gregorian)
var comp = DateComponents()
comp.month = 1

var nextMonth = gre.date(byAdding: comp, to: date)!
print(nextMonth)

nextMonth = gre.date(byAdding: comp, to: nextMonth)!
print(nextMonth)

nextMonth = gre.date(byAdding: comp, to: nextMonth)!
print(nextMonth)

let string = "aaaaaabbbaaaa"
let range = string.range(of: "b")
print(">>> \(range!.lowerBound)")
print(">>> \(range!.upperBound)")

//let date = Date()
//
//NSDate *today = [NSDate date];
//
//NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
//
//NSDateComponents *components = [[NSDateComponents alloc] init];
//components.month = 1;
//NSDate *nextMonth = [gregorian dateByAddingComponents:components toDate:today options:0];
//[components release];
//
//NSDateComponents *nextMonthComponents = [gregorian components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:nextMonth];
//
//NSDateComponents *todayDayComponents = [gregorian components:NSDayCalendarUnit fromDate:today];
//
//nextMonthComponents.day = todayDayComponents.day;
//NSDate *nextMonthDay = [gregorian dateFromComponents:nextMonthComponents];
//
//[gregorian release];

