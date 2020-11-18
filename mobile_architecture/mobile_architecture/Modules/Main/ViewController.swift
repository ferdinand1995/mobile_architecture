//
//  ViewController.swift
//  mobile_architecture
//
//  Created by Ferdinand on 17/11/20.
//

import UIKit
import CoreData

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    
    private let viewModel = ViewModel()
    
    let cellHeroIdentifier = "listHeroesCell"
    let cellFilterIdentifier = "filterCell"
    let headerIdentifier = "headerCellId"
    
    private var dialogTransitioningDelegate: DialogTransitioningDelegate?
    
    //MARK: Initialize View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.collectionView.register(UINib.init(nibName: "HeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        self.collectionView.register(UINib(nibName: "FilterRoleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellFilterIdentifier)
        self.collectionView.register(UINib(nibName: "ListHeroesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellHeroIdentifier)
        
        let layout =  StretchyHeaderViewFlowLayout()
        self.collectionView.collectionViewLayout = layout
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        if #available(iOS 13.0, *) {
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let sceneDelegate = windowScene.delegate as? SceneDelegate else { return }
            
            sceneDelegate.reachability.whenReachable = { reachability in
                self.viewModel.fetchListHeroStat(completion: {
                    
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                })
            }
            
            sceneDelegate.reachability.whenUnreachable = { reachability in
                
                let informationDialog = InformationDialog()

                self.dialogTransitioningDelegate = DialogTransitioningDelegate(from: self, to: informationDialog)
                informationDialog.modalPresentationStyle = .custom
                informationDialog.transitioningDelegate = self.dialogTransitioningDelegate

                self.present(informationDialog, animated: true, completion: nil)
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    //MARK: CollectionView Delegate
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //MARK: Header Cell
    
    @available(iOS 11.0, *)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.safeAreaLayoutGuide.layoutFrame.width, height: 240)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            
            let header: HeaderCollectionReusableView  = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath) as! HeaderCollectionReusableView
            
            return header            
        default:
            fatalError("Unexpected element kind")
        }
    }
    
    //MARK: Content Cell
    
    @available(iOS 11.0, *)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.item == 0 {
            return CGSize(width: view.safeAreaLayoutGuide.layoutFrame.width, height: 96)
        }else {
            return CGSize(width: collectionView.frame.size.width, height: collectionView.safeAreaLayoutGuide.layoutFrame.size.height)
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellFilterIdentifier, for: indexPath) as! FilterRoleCollectionViewCell
            
            cell.viewModelDelegate = viewModel
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellHeroIdentifier, for: indexPath) as! ListHeroesCollectionViewCell
            
            cell.viewModelDelegate = viewModel
            return cell
            
        }
    }
    /*
     override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     
     coordinator?.detailDescription()
     }*/
}
