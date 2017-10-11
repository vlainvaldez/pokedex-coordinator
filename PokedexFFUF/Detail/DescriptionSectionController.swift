//
//  DescriptionSectionController.swift
//  PokedexFFUF
//
//  Created by FFUF on 09/10/2017.
//  Copyright © 2017 FFUF. All rights reserved.
//

import IGListKit

class DescriptionSectionController: ListSectionController {
    
    fileprivate let desciptionModel: DescriptionModel
    
    init(descriptionModel: DescriptionModel) {
        self.desciptionModel = descriptionModel
    }
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext else { return .zero}
        
        return CGSize(width: context.containerSize.width, height: 500)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext?.dequeueReusableCell(of: DescriptionCell.self, for: self, at: index) as! DescriptionCell
        
        cell.configure(with: self.desciptionModel)
        
        return cell
    }
    
}




