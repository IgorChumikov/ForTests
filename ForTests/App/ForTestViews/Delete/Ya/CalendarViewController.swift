////
////  CalendarViewController.swift
////  ForTests
////
////  Created by Игорь Чумиков on 04.01.2025.
////
//
//import UIKit
//
//final class CalendarViewController: UIViewController {
//    
//    let calendarViewModel = CalendarViewModel()
//    
//    var scrollView: UIScrollView!
//    var containerView: UIView!
//    var alisaCollectionView: UICollectionView!
//    var bobCollectionView: UICollectionView!
//    var matchesCollectionView: UICollectionView!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // Настройка интерфейса
//      //  makeUI()
//        
//        // Настройка модели данных
//        calendarViewModel.configureMembersCalendar()
//    }
//}
//    
//// MARK: - UICollectionViewDelegateFlowLayout, UICollectionViewDataSource
//extension CalendarViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return calendarViewModel.hours.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AssistantCollectionViewCell.cellID, for: indexPath) as? AssistantCollectionViewCell else {
//            return UICollectionViewCell()
//        }
//        configureCell(cell, for: collectionView, at: indexPath)
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 90, height: 50)
//    }
//    
//    private func configureCell(_ cell: AssistantCollectionViewCell, for collectionView: UICollectionView, at indexPath: IndexPath) {
//        let hour = calendarViewModel.hours[indexPath.row]
//        
//        switch collectionView {
//        case alisaCollectionView:
//            cell.makeBackgorundColor(color: calendarViewModel.alicesSortedArray.contains(hour) ? .systemBlue : .systemGray)
//        case bobCollectionView:
//            cell.makeBackgorundColor(color: calendarViewModel.bobsSortedArray.contains(hour) ? .systemOrange : .systemGray)
//        case matchesCollectionView:
//            let isFreeForBoth = calendarViewModel.findMatchingSlots().contains(hour)
//            cell.makeBackgorundColor(color: isFreeForBoth ? .systemGreen : .systemRed)
//        default:
//            break
//        }
//    }
//}
