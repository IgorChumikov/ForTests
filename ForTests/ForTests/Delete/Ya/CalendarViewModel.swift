////
////  CalendarViewModel.swift
////  ForTests
////
////  Created by Игорь Чумиков on 04.01.2025.
////
//
//import Foundation
//
//protocol CalendarViewModelProtocol: AnyObject {
//    func configureMembersCalendar()
//}
//
//struct BookedTime {
//    let start: Int
//    let end: Int
//}
//
//
//final class CalendarViewModel: CalendarViewModelProtocol {
//    
//    var alicesSortedArray = [Int]()
//    var bobsSortedArray = [Int]()
//    let hours = Array(9...19)
//    
//    let aliceCalendar = [
//        BookedTime(start: 9, end: 12),
//        BookedTime(start: 12, end: 13),
//        BookedTime(start: 16, end: 19)
//    ]
//    let bobCalendar = [
//        BookedTime(start: 10, end: 11),
//        BookedTime(start: 12, end: 14),
//        BookedTime(start: 14, end: 15),
//        BookedTime(start: 16, end: 17)
//    ]
//    
//    func configureMembersCalendar() {
//        alicesSortedArray = generateSortedArray(for: aliceCalendar)
//        bobsSortedArray = generateSortedArray(for: bobCalendar)
//    }
//
//    private func generateSortedArray(for calendar: [BookedTime]) -> [Int] {
//        return calendar.flatMap { $0.start ..< $0.end }
//    }
//
//}
