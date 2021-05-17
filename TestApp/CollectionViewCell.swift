//
//  CollectionViewCell.swift
//  TestApp
//
//  Created by Timur Isaev on 17.05.2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static var identifier: String = "PageCell"
    
    var firstLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont(name: "Futura", size: 24)
        label.textColor = .white
        label.textAlignment = .center
       return label
    }()
    
    var secondLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont(name: "Futura", size: 16)
        label.textColor = .white
        label.textAlignment = .center
       return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configurate(item: PageModel) {

        firstLabel.text = item.fistString
        addSubview(firstLabel)
        firstLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(16)
            make.top.equalTo(60)
        }

        secondLabel.text = item.secondString
        addSubview(secondLabel)
        secondLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(16)
            make.top.equalTo(firstLabel.snp.bottom).offset(16)
        }
        
        let image = UIImageView(image: UIImage(systemName: item.image))
        image.tintColor = .white
        addSubview(image)
        image.snp.makeConstraints { make in
            make.height.width.equalTo(60)
            make.centerX.centerY.equalToSuperview()
        }
    }
}
