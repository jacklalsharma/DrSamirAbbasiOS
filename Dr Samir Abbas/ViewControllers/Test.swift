//
//  Test.swift
//  Dr Samir Abbas
//
//  Created by Anurag on 21/04/18.
//  Copyright © 2018 Anurag. All rights reserved.
//

import Foundation
import UIKit

class Test : AccordionTableViewController, SectionViewControllerDelegate, AccordionTableViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        oneSectionAlwaysOpen = false
        sections = allSetions()
        delegate = self
        openAnimation = .fade
        closeAnimation = .fade
    }
    
    private func allSetions() -> [Section] {
        return [Section.sectionOne(view: view), Section.sectionTwo(view: view)]
    }
    
    func sectionViewControllerDidLayoutSubViews(size: CGSize) {
        let section = self.sections[2]
        section.view!.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        
        if openedSection?.sectionIndex == 2 {
            self.reloadOpenedSection()
        }
    }
    
    func accordionTableViewControllerSectionDidClose(section: Section) {
        print(#function)
    }
    
    func accordionTableViewControllerSectionDidOpen(section: Section) {
        print(#function)
    }
    
}
