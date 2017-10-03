//
//  FFuFExpandableHeaderDelegate.swift
//  FFuFArchitecture
//
//  Created by Julio Alorro on 9/28/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation

/**
 The delegate to an ExpandableSectionHeaderDelegate
*/
public protocol ExpandableSectionHeaderDelegate: class {

    /**
     Indicated whether a section is expanded or not
    */
    var isExpanded: Bool { get }

    /**
     Method that triggers the expand/contract functionality for a section
    */
    func sectionTapped(_ section: Int)

}
