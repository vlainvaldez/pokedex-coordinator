//
//  BaseSectionController.swift
//  FFuFArchitecture
//
//  Created by Julio Alorro on 9/28/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import IGListKit

public typealias CellDefiningBaseItem = BaseItem & FFuFCellDefining

/**
 BaseSectionController implements the typical boilerplate code associated with setting up a UICollectionView to work with
 IGlistKit
*/
open class BaseSectionController: ListSectionController {

    // MARK: Initializer
    public override init() {
        super.init()
        self.inset = UIEdgeInsets.zero
        self.minimumLineSpacing = 2.0
        self.minimumInteritemSpacing = 2.0
    }

    // MARK: Stored Properties
    /**
     The view model that is configuring the cell displayed on the UICollectionView
    */
    private var _object: CellDefiningBaseItem!
    private var definedSize: CGSize = CGSize.zero

    // MARK: Computed Properties
    open var object: CellDefiningBaseItem? {
        if let object = self._object {
            return object
        } else {
            return nil
        }
    }

    // MARK: Overidden ListSectionController Methods
    open override func sizeForItem(at index: Int) -> CGSize {
        if let cell = self.collectionContext?.cellForItem(at: index, sectionController: self) as? BaseCell {

            self.definedSize = cell.item.sizeForCell

            return CGSize(
                width: self.collectionContext!.containerSize(for: self).width,
                height: self.definedSize.height
            )

        } else {
            switch definedSize.height == 0.0 {
                case true:
                    return CGSize(
                        width: self.collectionContext!.containerSize(for: self).width,
                        height: 55.0
                    )

                case false:
                    return CGSize(
                        width: self.collectionContext!.containerSize(for: self).width,
                        height: self.definedSize.height
                    )
            }
        }
    }

    open override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = self.collectionContext?.dequeueReusableCell(
            of: self._object.cellType.self,
            for: self,
            at: index
        ) as? BaseCell
        else { fatalError("Typecast of BaseCell type failed") }

        cell.index = index
        cell.configure(with: self._object)
        return cell
    }

    open override func didUpdate(to object: Any) {
        guard let object = object as? CellDefiningBaseItem else { return }
        self._object = object
    }
}
