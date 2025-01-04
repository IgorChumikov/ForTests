//
//  CalendarViewController.swift
//  ForTests
//
//  Created by Игорь Чумиков on 04.01.2025.
//

import UIKit

final class CalendarViewController: UIViewController {
    
    let calendarViewModel = CalendarViewModel()
    
    var scrollView: UIScrollView!
    var containerView: UIView!
    var alisaCollectionView: UICollectionView!
    var bobCollectionView: UICollectionView!
    var matchesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Настройка интерфейса
        makeUI()
        
        // Настройка модели данных
        calendarViewModel.configureMembersCalendar()
    }
}
    
// MARK: - UICollectionViewDelegateFlowLayout, UICollectionViewDataSource
extension CalendarViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        11
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AssistantCollectionViewCell.cellID, for: indexPath) as? AssistantCollectionViewCell else { return UICollectionViewCell() }

        if collectionView == alisaCollectionView {
            configureCellForAlice(cell: cell, at: indexPath)
        } else if collectionView == bobCollectionView {
            configureCellForBob(cell: cell, at: indexPath)
        } else if collectionView == matchesCollectionView {
            configureCellForMatches(cell: cell, at: indexPath)
        }

        return cell
    }

    private func configureCellForAlice(cell: AssistantCollectionViewCell, at indexPath: IndexPath) {
        cell.makeBackgorundColor(color: .systemBlue)
        if !calendarViewModel.alicesSortedArray.contains(calendarViewModel.hours[indexPath.row]) {
            cell.makeBackgorundColor(color: .systemGray)
        }
    }

    private func configureCellForBob(cell: AssistantCollectionViewCell, at indexPath: IndexPath) {
        cell.makeBackgorundColor(color: .systemOrange)
        if !calendarViewModel.bobsSortedArray.contains(calendarViewModel.hours[indexPath.row]) {
            cell.makeBackgorundColor(color: .systemGray)
        }
    }

    private func configureCellForMatches(cell: AssistantCollectionViewCell, at indexPath: IndexPath) {
        cell.makeBackgorundColor(color: .systemRed)
        if !calendarViewModel.alicesSortedArray.contains(calendarViewModel.hours[indexPath.row]) &&
            !calendarViewModel.bobsSortedArray.contains(calendarViewModel.hours[indexPath.row]) {
            cell.makeBackgorundColor(color: .systemGreen)
        }
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90, height: 50)
    }
    
    func makeUI() {
        
    }
}
