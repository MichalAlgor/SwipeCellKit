// 
// CustomViewAction.swift
//
// Created by Michal Czupryna on 14/07/2021.
// 

import UIKit

final class CustomViewAction: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        self.layer.cornerRadius = 16
        self.layer.masksToBounds = true
        self.backgroundColor = UIColor(white: 1.0, alpha: 0.4)
        self.addSubview(stackView)
        self.addConstraints(
            [
                stackView.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: 4),
                trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 4),
                stackView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: 4),
                stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
                stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
            ]
        )
    }

    private lazy var button: UIButton = {
        let button = UIButton.init(type: .system)
        button.setTitle("Delete", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.allowsDefaultTighteningForTruncation = true
        button.titleLabel?.minimumScaleFactor = 0.5
        button.backgroundColor = UIColor(red: 230.0 / 255.0, green: 33.0 / 255.0, blue: 105.0 / 255.0, alpha: 1.0)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addConstraint(button.heightAnchor.constraint(equalToConstant: 24))
        button.setContentCompressionResistancePriority(.required, for: .vertical)
        return button
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [button])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
}
