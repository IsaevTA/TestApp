//
//  ViewController.swift
//  TestApp
//
//  Created by Timur Isaev on 17.05.2021.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let arrayPage = [PageModel(fistString: "Real number", secondString: "String 1", image: "pencil.circle.fill"),
                     PageModel(fistString: "Free number", secondString: "String 2", image: "pencil.circle.fill"),
                     PageModel(fistString: "Fack number", secondString: "String 3", image: "pencil.circle.fill"),
                     PageModel(fistString: "Number", secondString: "String 4", image: "pencil.circle.fill")]
    
    var scrolView: UIScrollView = {
        let scrol = UIScrollView(frame: .zero)
        scrol.alwaysBounceVertical = true
        
        return scrol
    }()
    
    var contentView: UIView = {
        let view = UIView(frame: .zero)
        return view
    }()
    
    var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .blue
        collectionView.alwaysBounceHorizontal = true
        
        return collectionView
    }()

    var buttonView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .lightGray
        return view
    }()

    var button1: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("1", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.blue.cgColor
        button.addTarget(self, action: #selector(pressButton1), for: .touchUpInside)
        return button
    }()
    
    var button2: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("2", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.blue.cgColor
        button.addTarget(self, action: #selector(pressButton2), for: .touchUpInside)
        return button
    }()
    
    var button3: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("3", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.blue.cgColor
        button.addTarget(self, action: #selector(pressButton3), for: .touchUpInside)
        return button
    }()
    
    var buttonActivate: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("ACTIVATE", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 32
        button.layer.backgroundColor = UIColor.blue.cgColor
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        configureteUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        contentView.layoutIfNeeded()
        let height = contentView.frame.size.height * 60 / 100
        let widht = contentView.frame.size.width
        
        collectionView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(height)
        }
        
        let cellSize = CGSize(width: widht, height: height)

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = cellSize
        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        layout.minimumLineSpacing = 1.0
        layout.minimumInteritemSpacing = 1.0
        collectionView.setCollectionViewLayout(layout, animated: true)
    }

    private func configureteUI() {
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        
        view.addSubview(scrolView)
        scrolView.snp.makeConstraints { make in
            make.left.right.bottom.top.equalToSuperview()
        }
        
        view.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.left.right.bottom.top.equalToSuperview()
        }
        
        contentView.addSubview(collectionView)

        contentView.addSubview(buttonView)
        buttonView.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(1)
            make.left.right.equalToSuperview()
            make.height.equalTo(150)
        }
        
        let widhtSingleView: CGFloat = (UIScreen.main.bounds.size.width / 3.0) - 2
        
        buttonView.addSubview(button1)
        button1.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview().inset(2)
            make.width.equalTo(widhtSingleView)
        }

        buttonView.addSubview(button2)
        button2.layer.borderWidth = 6
        button2.snp.makeConstraints { make in
            make.left.equalTo(button1.snp.right).offset(2)
            make.top.bottom.equalToSuperview().inset(2)
            make.width.equalTo(widhtSingleView)
        }
        
        buttonView.addSubview(button3)
        button3.snp.makeConstraints { make in
            make.left.equalTo(button2.snp.right).offset(2)
            make.top.bottom.equalToSuperview().inset(2)
            make.width.equalTo(widhtSingleView)
        }
        
        contentView.addSubview(buttonActivate)
        buttonActivate.snp.makeConstraints { make in
            make.top.equalTo(buttonView.snp.bottom).offset(26)
            make.left.right.equalToSuperview().inset(34)
            make.height.equalTo(64)
            
        }
    }
    
    @objc func pressButton1() {
        button1.layer.borderWidth = 6
        button2.layer.borderWidth = 0
        button3.layer.borderWidth = 0
    }
    
    @objc func pressButton2() {
        button1.layer.borderWidth = 0
        button2.layer.borderWidth = 6
        button3.layer.borderWidth = 0
    }
    
    @objc func pressButton3() {
        button1.layer.borderWidth = 0
        button2.layer.borderWidth = 0
        button3.layer.borderWidth = 6
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayPage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        let item = arrayPage[indexPath.row]
        cell.configurate(item: item)
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {

}
