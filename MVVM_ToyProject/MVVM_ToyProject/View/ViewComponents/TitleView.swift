//
//  TitleView.swift
//  MVVM_ToyProject
//
//  Created by 한택환 on 2023/04/12.
//

import UIKit

final class TitleView: UIView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "News"
        label.font = .systemFont(ofSize: 26, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    lazy var sortImage: UIImageView = {
        let image = UIImage(systemName: "arrow.up.arrow.down")
        let imageView = UIImageView()
        imageView.tintColor = .black
        imageView.image = image
        return imageView
    }()

    lazy var sortButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension TitleView {
    func setUpLayout() {
        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10)
        ])
        
        self.addSubview(sortImage)
        sortImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sortImage.topAnchor.constraint(equalTo: self.topAnchor),
            sortImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
        sortImage.isUserInteractionEnabled = false
        
        self.addSubview(sortButton)
        sortButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sortButton.centerXAnchor.constraint(equalTo: sortImage.centerXAnchor),
            sortButton.centerYAnchor.constraint(equalTo: sortImage.centerYAnchor)
        ])

    }
}
