//
//  CaseStudyDetailsViewModel.swift
//  EngineeringChallenge
//
//  Created by Artur on 03/06/21.
//

import Foundation
import UIKit

protocol CaseStudyDetailsProtocal {
    var title:String { get }
    var item:Item { get }
    var numberOfSections:Int { get }
    func numberOfRows(for section:Int)-> Int
    func headerTitle(for section:Int)-> String
    func getBodyElements(for section:Int, for row:Int)-> (title:String?, item:Item?)
}

class CaseStudyDetailsViewModel {
    
    private var caseStudy:CaseStudy?
    
    var numberOfSections: Int {
        return caseStudy?.sections.count ?? 0
    }
    
    var title: String {
        return caseStudy?.title ?? ""
    }
    
    var item: Item {
        return Item(image:UIImage(), url:URL(string:caseStudy!.heroImage)!)
    }
    
    init(caseStudy:CaseStudy?) {
        self.caseStudy = caseStudy
    }
}

extension CaseStudyDetailsViewModel: CaseStudyDetailsProtocal {
    
    func getBodyElements(for section: Int, for row: Int) -> (title: String?, item: Item?) {
        guard  let bodyElement =  caseStudy?.sections[section].bodyElements[row] else {
            return ("", nil)
        }
        switch bodyElement {
        case .bodyElementClass(let x):
            return (nil , Item(image:UIImage(), url:URL(string:x.imageURL)!) )
        case .string(let x):
            return (x , nil)
        }
    }
    
    func headerTitle(for section: Int) -> String {
        return caseStudy?.sections[section].title ?? ""
    }
    
    func numberOfRows(for section: Int) -> Int {
        return caseStudy?.sections[section].bodyElements.count ?? 0
    }
}
