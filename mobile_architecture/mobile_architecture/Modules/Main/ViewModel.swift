//
//  ViewModel.swift
//  mobile_architecture
//
//  Created by Ferdinand on 17/11/20.
//


import Foundation
import UIKit.UIImage

public class ViewModel {
    
    private let networkLayer = Networking()
    
    // MARK: Binding View
    var roles: Box<[String]> = Box([])
    var heroesResponse: Box<[HeroesResponse]> = Box([])
    
    func fetchListHeroStat(completion: @escaping (() -> Void)) {
        
        networkLayer.getRequestData(urlRequest: ApiConstant.API_HERO_STATS, headers: nil, parameters: nil, successHandler: { (heroes: [HeroesResponse]) in
            
            self.sortRoles(heroes)
            completion()
        }) { (error: String) in
            print(error)
        }
        
    }
    
    func sortRoles(_ listOfHeroes: [HeroesResponse]) {
        self.heroesResponse.value = listOfHeroes
        
        roles.value.append("All")
        for obj in listOfHeroes {
            guard let roles = obj.roles else { return }
            for objRole in roles {
                self.roles.value.append(objRole)
            }
        }
        self.roles.value = roles.value.removingDuplicates()
    }    
}
