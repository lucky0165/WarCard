//
//  ViewController.swift
//  WarCard
//
//  Created by Łukasz Rajczewski on 14/02/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playerScore: UILabel!
    @IBOutlet weak var cpuScore: UILabel!
    @IBOutlet weak var playerView: UIView!
    @IBOutlet weak var cpuView: UIView!
    @IBOutlet weak var cpuCard: UIImageView!
    @IBOutlet weak var playerCard: UIImageView!
    @IBOutlet weak var playerTitle: UILabel!
    @IBOutlet weak var cpuTitle: UILabel!
    
    var playerScr = 0
    var cpuScr = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerView.layer.cornerRadius = 10
        cpuView.layer.cornerRadius = 10
        
        playerView.backgroundColor = .clear
        cpuView.backgroundColor = .clear
        
    }
    
    
    
    @objc func updateUI() {
        playerView.backgroundColor = .clear
        cpuView.backgroundColor = .clear
    }
    
    func timer() {
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }

    @IBAction func dealButtonTapped(_ sender: UIButton) {
        
        let playerNumber = Int.random(in: 2...14)
        let cpuNumber = Int.random(in: 2...14)
        
        playerCard.image = UIImage(named: "card\(playerNumber)")
        cpuCard.image = UIImage(named: "card\(cpuNumber)")
        
        
        if playerNumber > cpuNumber {
            
            
            playerView.backgroundColor = .green
            playerScr += 1
            
            timer()
            
        } else if playerNumber < cpuNumber {
            
            
            cpuView.backgroundColor = .green
            cpuScr += 1
            
            timer()
            
        } else {
            
            playerView.backgroundColor = .orange
            cpuView.backgroundColor = .orange
            
            timer()
            
        }
        
        
        playerScore.text = "\(playerScr)"
        cpuScore.text = "\(cpuScr)"
        
        
        if playerScr > cpuScr {
            playerTitle.textColor = .green
            cpuTitle.textColor = .black
        } else if playerScr < cpuScr {
            cpuTitle.textColor = .green
            playerTitle.textColor = .black
        } else {
            playerTitle.textColor = .orange
            cpuTitle.textColor = .orange
        }
        
        
        
    }
    
}

