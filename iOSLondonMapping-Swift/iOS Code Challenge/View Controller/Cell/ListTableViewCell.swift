//
//  ListTableViewCell.swift
//  iOS Code Challenge
//
//  Copyright © 2025 Geektastic. All rights reserved.
//

import UIKit
import SnapKit

class ListTableViewCell: UITableViewCell {
    static let identifier = "ListTableViewCell"

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textAlignment = .center
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func refresh(with viewModel: Monument) {
        titleLabel.text = viewModel.name
    }
}

private extension ListTableViewCell {
    func setup() {
        addSubiews()
        setConstraints()
    }
    
    func addSubiews() {
        contentView.addSubview(titleLabel)
    }
    
    func setConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview().inset(10)
        }
    }
}
