//
//  BaseExpandableSectionController.swift
//  FFuFArchitecture
//
//  Created by Julio Alorro on 9/28/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import IGListKit

/**
 BaseExpandableSectionController implements the basic implementation of an expandable functionality for a section in a
 UICollectionView. Uses a supplementary view of UICollectionElementKindSectionHeader to display the header. Is of type
 ExpandableSectionHeaderDelegate.
 */
open class BaseExpandableSectionController: ListSectionController {
    // MARK: Static Properties
    public static let ExpandTriggerNotification: Notification.Name = Notification.Name("ExpandTriggerNotification")

    // MARK: Initializer
    public override init() {
        super.init()
        self.inset = UIEdgeInsets.zero
        self.minimumLineSpacing = 0.0
        self.minimumInteritemSpacing = 0.0
        self.supplementaryViewSource = self
    }

    // MARK: Stored Properties
    private var _expandableItem: ExpandableItem!
    private var _isExpanded: Bool = false
    private var definedSize: CGSize = CGSize.zero

    // MARK: Overidden ListSectionController Methods
    open override func didUpdate(to object: Any) {
        guard let object = object as? ExpandableItem else { return }
        self._expandableItem = object
    }

    open override func sizeForItem(at index: Int) -> CGSize {

        switch self._isExpanded {
            case true:
                let size: CGSize

                if let cell = self.collectionContext!.cellForItem(at: index, sectionController: self) as? BaseCell {

                    self.definedSize = CGSize(
                        width: max(self.definedSize.width, cell.item.sizeForCell.width),
                        height: max(self.definedSize.height, cell.item.sizeForCell.height)
                    )

                    size = CGSize(
                        width: max(cell.item.sizeForCell.width, self.definedSize.width),
                        height: cell.item.sizeForCell.height
                    )

                } else {
                    switch definedSize.height == 0.0 {
                        case true:
                            size = CGSize(
                                width: self.collectionContext!.containerSize(for: self).width,
                                height: 55.0
                            )

                        case false:
                            size = CGSize(
                                width: self.collectionContext!.containerSize(for: self).width,
                                height: self.definedSize.height
                            )
                    }
                }

                return size

            case false:
                return CGSize.zero
        }
    }

    open override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = self.collectionContext!.dequeueReusableCell(
            of: self._expandableItem.items[index].cellType.self,
            for: self,
            at: index
        ) as! BaseCell // swiftlint:disable:this force_cast
        cell.index = index
        cell.configure(with: self._expandableItem.items[index])
        return cell
    }

    open override func numberOfItems() -> Int {
        switch self._isExpanded {
            case true:
                return self._expandableItem.items.count

            case false:
                return 0
        }
    }
}

// MARK: - ListSupplementaryViewSource Methods
extension BaseExpandableSectionController: ListSupplementaryViewSource {
    open func supportedElementKinds() -> [String] {
        return [UICollectionElementKindSectionHeader]
    }

    open func viewForSupplementaryElement(ofKind elementKind: String, at index: Int) -> UICollectionReusableView {
        let header: ExpandableSectionHeader = self.collectionContext!.dequeueReusableSupplementaryView(
            ofKind: UICollectionElementKindSectionHeader,
            for: self,
            class: ExpandableSectionHeader.self,
            at: index
            ) as! ExpandableSectionHeader // swiftlint:disable:this force_cast
        header.delegate = self
        header.section = index
        header.configure(with: self._expandableItem)
        return header
    }

    open func sizeForSupplementaryView(ofKind elementKind: String, at index: Int) -> CGSize {
        return CGSize(
            width: self.collectionContext!.containerSize.width,
            height: 100.0
        )
    }
}

// MARK: - ExpandableSectionHeaderDelegate Properties & Methods
extension BaseExpandableSectionController: ExpandableSectionHeaderDelegate {
    open var isExpanded: Bool {
        return self._isExpanded
    }

    open func sectionTapped(_ section: Int) {
        self._isExpanded = !self._isExpanded
        self._expandableItem.isExpanded = self._isExpanded

        DispatchQueue.main.async {
            self.collectionContext?.performBatch(
                animated: true,
                updates: { [unowned self] (context: ListBatchContext) -> Void in
                    context.reload(self)
                },
                completion: { (isComplete: Bool) -> Void in
                    switch isComplete {
                        case true:
                            self.collectionContext?.invalidateLayout(for: self)
                        case false:
                            break
                    }

                    NotificationCenter.default.post(
                        name: BaseExpandableSectionController.ExpandTriggerNotification,
                        object: self._isExpanded
                    )
                }
            )
        }
    }
}
