//
//  JLCardViewController.swift
//  DeckOfCardObjC
//
//  Created by Jordan Lamb on 10/8/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

import UIKit

class JLCardViewController: UIViewController {

    var cards: [JLCard] = []
    

    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var suitLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func drawNewCardButtonTapped(_ sender: Any) {
        drawCard()
    }
    
    // MARK: - Functions
    func drawCard() {
        JLCardController.drawNewCard(1) { (cards) in
            guard let card = cards else { return }
            self.cards = card
            let singleCard = card[0]
            JLCardController.fetchImage(from: singleCard, completion: { (image) in
                guard let image = image else { return }
                DispatchQueue.main.async {
                    self.suitLabel.text = singleCard.suit
                    self.cardImageView.image = image
                }
            })
        }
    }
    
    
}

