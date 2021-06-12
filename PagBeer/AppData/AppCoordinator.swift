//
//  AppCoordinator.swift
//  PagBeer
//
//  Created by Guilherme de Assis dos Santos on 11/06/21.
//

import UIKit

class AppCoordinator {
    let window: UIWindow
    let mainCoordinator = BeerCoordinator()
    
    init(_ window: UIWindow) {
        self.window = window
    }
    
    func start() {
        window.rootViewController = mainCoordinator.start()
        window.makeKeyAndVisible()
    }
}
