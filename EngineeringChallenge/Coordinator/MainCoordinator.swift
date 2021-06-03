//
//  Coordinator.swift
//  EngineeringChallenge
//
//  Created by Artur on 02/06/21.
//

import Foundation
import UIKit

protocol Coordinator:class {
    var navigationController: UINavigationController { get set }
    func start()
    func goToCaseStudyDetails(caseStudy:CaseStudy)
}

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = CaseStudyViewController.instantiate()
        vc.viewModel = CaseStudyViewModel(delegate:vc, coordinator: self)
        navigationController.pushViewController(vc, animated: false)
    }
    
    func goToCaseStudyDetails(caseStudy:CaseStudy) {
        let vc = CaseStudyDetailsViewController.instantiate()
        vc.viewModel = CaseStudyDetailsViewModel(caseStudy:caseStudy)
        navigationController.pushViewController(vc, animated: false)
    }
}
