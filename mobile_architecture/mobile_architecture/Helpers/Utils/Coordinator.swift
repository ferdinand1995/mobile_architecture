//
//  Coordinator.swift
//  mobile_architecture
//
//  Created by Ferdinand on 17/11/20.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func mainView()
}
