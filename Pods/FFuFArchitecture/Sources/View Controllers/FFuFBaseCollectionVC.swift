//
//  FFuFArchitecture
//  Created by Julio Miguel Alorro on 9/28/17.
//  Licensed under the MIT license. See LICENSE file
//

import UIKit
import IGListKit
import SnapKit

/**
 FFuFCollectionView is a UIView subclass that defines the properties of the UICollectionView.
*/
open class FFuFBaseCollectionView: UIView {
    /**
     The UICollectionView instance. Uses UICollectionViewFlowLayout.
    */
    open var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 200.0, height: 200.0)
        let collectionView: UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        return collectionView
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.collectionView)
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.collectionView.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.edges.equalToSuperview()
        }
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

/**
 A UICollectionViewController designed to work with IGListKit. Mostly used for displaying static text.
 Is a ListAdapterDataSource
*/
open class FFuFBaseCollectionVC: UIViewController {

    // MARK: Initializer
    public init(items: [BaseItem]) {
        self.items = items
        super.init(nibName: nil, bundle: nil)
        self.adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self)
        self.adapter.collectionView = self.rootView.collectionView
        self.adapter.dataSource = self
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View Controller Lifecycle Methods
    open override func loadView() {
        self.view = FFuFBaseCollectionView()
    }

    // MARK: Stored Properties
    /**
     ListAdapter associated with the UICollectionView instance
    */
    open var adapter: ListAdapter!

    /**
     Items to be displayed on the UICollectionView instance
    */
    open var items: [BaseItem]

}

// MARK: - Subviews
public extension FFuFBaseCollectionVC {
    /**
     The UIView instance containing FFuFBaseCollectionVC's subviews
    */
    unowned var rootView: FFuFBaseCollectionView { return self.view as! FFuFBaseCollectionView }
    // swiftlint:disable:previous force_cast
}

// MARK: - ListAdapterDataSource Methods
extension FFuFBaseCollectionVC: ListAdapterDataSource {
    open func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return self.items
    }

    open func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if object is ExpandableItem {
            return BaseExpandableSectionController()
        } else {
            return BaseSectionController()
        }
    }

    open func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }

}
