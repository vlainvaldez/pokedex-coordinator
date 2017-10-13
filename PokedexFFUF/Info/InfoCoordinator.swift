//
//  InfoCoordinator.swift
//  PokedexFFUF
//
//  Created by FFUF on 13/10/2017.
//  Copyright © 2017 FFUF. All rights reserved.
//

import UIKit
import Rapid
import FSwiftNetworking
import FSwiftParser
import BrightFutures
import FFuFArchitecture

public final class InfoCoordinator: AbstractCoordinator {
    
    fileprivate unowned let navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
        super.init()
    }
    
    public override func start() {
        let vc: InfoVC = InfoVC(items: [
            TextItem(text: "Filet mignon strip steak ham, short ribs pastrami short loin tenderloin chicken rump frankfurter picanha ball tip cupim. Bresaola beef filet mignon chicken shoulder ham hock. Tail ribeye meatball t-bone short ribs kielbasa. Pastrami burgdoggen beef ribs frankfurter, picanha capicola ham hock bresaola rump t-bone ground round sirloin ham. Bacon picanha jowl drumstick short ribs biltong landjaeger kielbasa ribeye pork loin meatloaf sausage sirloin shankle. Pastrami meatball andouille short ribs shoulder alcatra porchetta hamburger ham.\n\nSausage bresaola meatball pig pork belly porchetta ham hock frankfurter hamburger pork loin meatloaf flank shoulder ground round t-bone. Jowl andouille ribeye pig t-bone. Alcatra pork loin shankle short ribs swine bacon shank flank turducken tongue. Cupim kevin tail frankfurter biltong sausage."),
            // swiftlint:disable:next line_length
            TextItem(text: "Filet mignon strip steak ham, short ribs pastrami short loin tenderloin chicken rump frankfurter picanha ball tip cupim. Bresaola beef filet mignon chicken shoulder ham hock. Tail ribeye meatball t-bone short ribs kielbasa. Pastrami burgdoggen beef ribs frankfurter, picanha capicola ham hock bresaola rump t-bone ground round sirloin ham. Bacon picanha jowl drumstick short ribs biltong landjaeger kielbasa ribeye pork loin meatloaf sausage sirloin shankle. Pastrami meatball andouille short ribs shoulder alcatra porchetta hamburger ham.\n\nSausage bresaola meatball pig pork belly porchetta ham hock frankfurter hamburger pork loin meatloaf flank shoulder ground round t-bone. Jowl andouille ribeye pig t-bone. Alcatra pork loin shankle short ribs swine bacon shank flank turducken tongue. Cupim kevin tail frankfurter biltong sausage."),
            ExpandableItem(
                title: "A First Title",
                items: [
                    // swiftlint:disable:next line_length
                    TextItem(text: "Bacon ipsum dolor amet venison jowl turducken, swine tail chicken kielbasa ham hock sausage. Landjaeger chuck swine alcatra pancetta sausage. Ham ball tip jowl jerky short ribs turducken sirloin chicken doner andouille tongue cow. Brisket pork chop jerky chicken, pork loin tri-tip ground round venison kielbasa drumstick beef tail landjaeger ball tip."),
                    // swiftlint:disable:next line_length
                    TextItem(text: "Filet mignon strip steak ham, short ribs pastrami short loin tenderloin chicken rump frankfurter picanha ball tip cupim. Bresaola beef filet mignon chicken shoulder ham hock. Tail ribeye meatball t-bone short ribs kielbasa. Pastrami burgdoggen beef ribs frankfurter, picanha capicola ham hock bresaola rump t-bone ground round sirloin ham. Bacon picanha jowl drumstick short ribs biltong landjaeger kielbasa ribeye pork loin meatloaf sausage sirloin shankle. Pastrami meatball andouille short ribs shoulder alcatra porchetta hamburger ham.\n\nSausage bresaola meatball pig pork belly porchetta ham hock frankfurter hamburger pork loin meatloaf flank shoulder ground round t-bone. Jowl andouille ribeye pig t-bone. Alcatra pork loin shankle short ribs swine bacon shank flank turducken tongue. Cupim kevin tail frankfurter biltong sausage."),
                    // swiftlint:disable:next line_length
                    TextItem(text: "Bacon ipsum dolor amet venison jowl turducken, swine tail chicken kielbasa ham hock sausage. Landjaeger chuck swine alcatra pancetta sausage. Ham ball tip jowl jerky short ribs turducken sirloin chicken doner andouille tongue cow. Brisket pork chop jerky chicken, pork loin tri-tip ground round venison kielbasa drumstick beef tail landjaeger ball tip.\n\nFilet mignon strip steak ham, short ribs pastrami short loin tenderloin chicken rump frankfurter picanha ball tip cupim. Bresaola beef filet mignon chicken shoulder ham hock. Tail ribeye meatball t-bone short ribs kielbasa. Pastrami burgdoggen beef ribs frankfurter, picanha capicola ham hock bresaola rump t-bone ground round sirloin ham. Bacon picanha jowl drumstick short ribs biltong landjaeger kielbasa ribeye pork loin meatloaf sausage sirloin shankle. Pastrami meatball andouille short ribs shoulder alcatra porchetta hamburger ham.\n\nSausage bresaola meatball pig pork belly porchetta ham hock frankfurter hamburger pork loin meatloaf flank shoulder ground round t-bone. Jowl andouille ribeye pig t-bone. Alcatra pork loin shankle short ribs swine bacon shank flank turducken tongue. Cupim kevin tail frankfurter biltong sausage.\n\nDrumstick cupim shank boudin andouille. Bresaola flank pig capicola cow ribeye. Picanha shankle pancetta, short loin chuck porchetta t-bone pork belly tenderloin leberkas chicken jowl. Drumstick boudin salami, meatball cow sirloin cupim biltong meatloaf bacon shoulder corned beef frankfurter.\n\nRibeye drumstick pork belly tenderloin, swine bresaola corned beef. Pancetta pork chop porchetta bacon, landjaeger chuck filet mignon strip steak sausage tri-tip. Pig brisket chicken shankle. Pork loin rump pig andouille corned beef swine biltong turducken alcatra bresaola.\n\nDoes your lorem ipsum text long for something a little meatier? Give our generator a try… it’s tasty!")
                ]
            ),
            ExpandableItem(
                title: "A Second Title",
                items: [
                    // swiftlint:disable:next line_length
                    TextItem(text: "Bacon ipsum dolor amet venison jowl turducken, swine tail chicken kielbasa ham hock sausage. Landjaeger chuck swine alcatra pancetta sausage. Ham ball tip jowl jerky short ribs turducken sirloin chicken doner andouille tongue cow. Brisket pork chop jerky chicken, pork loin tri-tip ground round venison kielbasa drumstick beef tail landjaeger ball tip."),
                    // swiftlint:disable:next line_length
                    TextItem(text: "Filet mignon strip steak ham, short ribs pastrami short loin tenderloin chicken rump frankfurter picanha ball tip cupim. Bresaola beef filet mignon chicken shoulder ham hock. Tail ribeye meatball t-bone short ribs kielbasa. Pastrami burgdoggen beef ribs frankfurter, picanha capicola ham hock bresaola rump t-bone ground round sirloin ham. Bacon picanha jowl drumstick short ribs biltong landjaeger kielbasa ribeye pork loin meatloaf sausage sirloin shankle. Pastrami meatball andouille short ribs shoulder alcatra porchetta hamburger ham.\n\nSausage bresaola meatball pig pork belly porchetta ham hock frankfurter hamburger pork loin meatloaf flank shoulder ground round t-bone. Jowl andouille ribeye pig t-bone. Alcatra pork loin shankle short ribs swine bacon shank flank turducken tongue. Cupim kevin tail frankfurter biltong sausage."),
                    // swiftlint:disable:next line_length
                    TextItem(text: "Bacon ipsum dolor amet venison jowl turducken, swine tail chicken kielbasa ham hock sausage. Landjaeger chuck swine alcatra pancetta sausage. Ham ball tip jowl jerky short ribs turducken sirloin chicken doner andouille tongue cow. Brisket pork chop jerky chicken, pork loin tri-tip ground round venison kielbasa drumstick beef tail landjaeger ball tip.\n\nFilet mignon strip steak ham, short ribs pastrami short loin tenderloin chicken rump frankfurter picanha ball tip cupim. Bresaola beef filet mignon chicken shoulder ham hock. Tail ribeye meatball t-bone short ribs kielbasa. Pastrami burgdoggen beef ribs frankfurter, picanha capicola ham hock bresaola rump t-bone ground round sirloin ham. Bacon picanha jowl drumstick short ribs biltong landjaeger kielbasa ribeye pork loin meatloaf sausage sirloin shankle. Pastrami meatball andouille short ribs shoulder alcatra porchetta hamburger ham.\n\nSausage bresaola meatball pig pork belly porchetta ham hock frankfurter hamburger pork loin meatloaf flank shoulder ground round t-bone. Jowl andouille ribeye pig t-bone. Alcatra pork loin shankle short ribs swine bacon shank flank turducken tongue. Cupim kevin tail frankfurter biltong sausage.\n\nDrumstick cupim shank boudin andouille. Bresaola flank pig capicola cow ribeye. Picanha shankle pancetta, short loin chuck porchetta t-bone pork belly tenderloin leberkas chicken jowl. Drumstick boudin salami, meatball cow sirloin cupim biltong meatloaf bacon shoulder corned beef frankfurter.\n\nRibeye drumstick pork belly tenderloin, swine bresaola corned beef. Pancetta pork chop porchetta bacon, landjaeger chuck filet mignon strip steak sausage tri-tip. Pig brisket chicken shankle. Pork loin rump pig andouille corned beef swine biltong turducken alcatra bresaola.\n\nDoes your lorem ipsum text long for something a little meatier? Give our generator a try… it’s tasty!")
                ]
            )
            
        ])
        
        vc.view.backgroundColor = UIColor.white
        self.navigationController.pushViewController(vc, animated: true)
    }
}
