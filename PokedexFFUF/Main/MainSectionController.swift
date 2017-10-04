//
//  MainSectionController.swift
//  PokedexFFUF
//
//  Created by FFUF on 04/10/2017.
//  Copyright © 2017 FFUF. All rights reserved.
//

import Foundation
import Rapid
import IGListKit

final class MainSectionController<Cell: UICollectionViewCell, Object: ListDiffable> : ListSectionController where Cell: Configurable, Cell.Object == Object {
    
    fileprivate var object: Object!
    let spacing = CGFloat(20)
    
    override init() {
        super.init()
        
        self.minimumInteritemSpacing = 1
        self.minimumLineSpacing = 1
    }
    
    
    override func sizeForItem(at index: Int) -> CGSize {
        let width = ((collectionContext?.containerSize(for: self).width)! / 3) - 2
        let height = 100
        
   
        return CGSize(width: width, height: 100)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = self.collectionContext!.dequeueReusableCell(of: Cell.self, for: self, at: index) as! Cell
        // swiftlint:disable:previous force_cast        
        cell.configure(with: self.object)
        return cell
    }
    
    override func didUpdate(to object: Any) {
        guard let object = object as? Object else { return }
        self.object = object
    }
    
    override func didSelectItem(at index: Int) {
        guard let cell = self.collectionContext?.cellForItem(at: index, sectionController: self) as? Cell
            else { return }        
    }
}



