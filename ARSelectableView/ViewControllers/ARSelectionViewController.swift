//
//  ARSelectionViewController.swift
//  ARSelectableView
//
//  Created by Rohit Makwana on 03/10/20.
//  Copyright © 2020 Rohit Makwana. All rights reserved.
//

import UIKit

class ARSelectionViewController: UIViewController {

    private let width = UIScreen.main.bounds.size.width
    private let height = UIScreen.main.bounds.size.height

    //MARK: - Declared Variables
    var selectionType = ARSelectionType.radio
    var alignment = ARSelectionAlignment.left
    var scrollDirection = UICollectionView.ScrollDirection.vertical
    fileprivate var selectionView: ARSelectionView?

    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.addSelectionView()
    }

    fileprivate func addSelectionView() {

        self.selectionView = ARSelectionView(frame: CGRect.zero)
        self.view.addSubview(self.selectionView!)

        selectionView?.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([selectionView!.topAnchor.constraint(equalTo: view.topAnchor),
                                     selectionView!.leftAnchor.constraint(equalTo: view.leftAnchor),
                                     selectionView!.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                     selectionView!.rightAnchor.constraint(equalTo: view.rightAnchor)])

        if self.selectionType == ARSelectionType.tags {
            self.selectionView?.rowHeight = 40
            self.selectionView?.selectedTitleColor = .white
            self.selectionView?.defaultTitleColor = .black
            self.selectionView?.selectedCellBGColor = .black
            self.selectionView?.defaultCellBGColor = UIColor.lightGray.withAlphaComponent(0.3)
        }
        else {
            self.selectionView?.options = ARSelectionView.Options(sectionInset: UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0), scrollDirection: self.scrollDirection)
        }

        self.selectionView?.alignment = self.alignment
        self.selectionView?.selectionType = self.selectionType
        self.view.layoutIfNeeded()

        let items = self.getItems()
        let chunkeditems = items.chunked(into: Int(height/self.selectionView!.rowHeight))
        for insa in chunkeditems {
            let maxHeight = (insa.map { $0.width }.max() ?? width/2) + ARSelectableCell.extraSpace
            insa.forEach {$0.width = maxHeight }
        }
        self.selectionView?.items = items
    }

    func getItems() -> [ARSelectModel] {

        return [ARSelectModel(title: "Contact Details"),
                ARSelectModel(title: "Shipping Information"),
                ARSelectModel(title: "Billing Address"),
                ARSelectModel(title: "Payment Review"),
                ARSelectModel(title: "Ordered"),
                ARSelectModel(title: "Packed"),
                ARSelectModel(title: "Shipped"),
                ARSelectModel(title: "Delivered"),
                ARSelectModel(title: "Contact Details"),
                ARSelectModel(title: "Shipping Information"),
                ARSelectModel(title: "Billing Address"),
                ARSelectModel(title: "Payment Review"),
                ARSelectModel(title: "Ordered"),
                ARSelectModel(title: "Packed"),
                ARSelectModel(title: "Shipped"),
                ARSelectModel(title: "Delivered"),
                ARSelectModel(title: "Contact Details"),
                ARSelectModel(title: "Shipping Information"),
                ARSelectModel(title: "Billing Address"),
                ARSelectModel(title: "Payment Review"),
                ARSelectModel(title: "Ordered"),
                ARSelectModel(title: "Packed"),
                ARSelectModel(title: "Shipped"),
                ARSelectModel(title: "Delivered")]
    }
}

