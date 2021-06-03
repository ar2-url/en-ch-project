//
//  CaseStudyViewModel.swift
//  EngineeringChallenge
//
//  Created by Artur on 02/06/21.
//

import Foundation
import UIKit

protocol CaseStudyProtocal {
    var caseStudiesCount:Int { get }
    func fetchCaseStudies()
    func getCaseStudyDetail(for row:Int)-> (teaser:String, item:Item?)
    func onCaseStudyClick(for row:Int)
}
class CaseStudyViewModel {
    
    weak private var delegate:CaseStudyViewProtocal!
    weak var coordinator: Coordinator?        // Coordinator
    
    let service:Servicable!

    private var caseStudyResponse:CaseStudyResponse?
    
    var caseStudiesCount: Int {
        return caseStudyResponse?.caseStudies.count ?? 0
    }
    /* Injecting Dependencies of delegate and service class ,
     Service class is default params */
    
    init(delegate:CaseStudyViewProtocal,
         coordinator:Coordinator,
         service:Servicable = Service()) {
        
         self.delegate = delegate
         self.service = service
         self.coordinator = coordinator
    }
}

extension CaseStudyViewModel: CaseStudyProtocal {

    func fetchCaseStudies() {
        service.fetchData(networkClient:NetworkClient(baseUrl:EndPoints.baseUrl.rawValue, path:Path.caseStudies.rawValue, params:"", method:"get"), type:CaseStudyResponse.self) { [weak self] (result) in
            
            switch result {
            case .success(let result):
                self?.caseStudyResponse = result
                DispatchQueue.main.async {
                    self?.delegate?.updateUI()
                }
            case .failure(_):
                self?.caseStudyResponse = nil
                DispatchQueue.main.async {
                    self?.delegate?.showError()
                }
            }
        }
    }
    
    func getCaseStudyDetail(for row: Int) -> (teaser: String, item: Item?) {
        guard let caseStudies = caseStudyResponse?.caseStudies,
              caseStudies.count > row,
              row >= 0 else {
            return ("", nil)
        }
        let caseStudy = caseStudies[row]
        let item = Item(image:UIImage(), url:URL(string:caseStudy.heroImage)!)
        return (caseStudy.teaser, item)
    }
    
    func onCaseStudyClick(for row: Int) {
        guard let caseStudy = getCaseStudy(for: row) else { return }
        coordinator?.goToCaseStudyDetails(caseStudy:caseStudy)
    }
    
    func getCaseStudy(for index: Int)-> CaseStudy? {
        return caseStudyResponse?.caseStudies[index]
    }
}
