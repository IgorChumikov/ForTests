//
//  AssistantCollectionViewCell.swift
//  ForTests
//
//  Created by Игорь Чумиков on 04.01.2025.
//

import UIKit

final class AssistantCollectionViewCell: UICollectionViewCell {
    
    static let cellID = "AssistantCollectionViewCell"
    
    private let backgroundViewLayer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        contentView.addSubview(backgroundViewLayer)
        NSLayoutConstraint.activate([
            backgroundViewLayer.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundViewLayer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backgroundViewLayer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backgroundViewLayer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func makeBackgorundColor(color: UIColor) {
        backgroundViewLayer.backgroundColor = color
    }
}
