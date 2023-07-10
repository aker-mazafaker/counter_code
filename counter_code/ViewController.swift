//
//  ViewController.swift
//  counter_code
//
//  Created by Akerke on 04.07.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var count = 0
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Counter"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 50)
        return label
    }()
    
    let countLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 70)
        return label
    }()
    
    
    let pluseButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        button.tintColor = .systemGreen
        button.clipsToBounds = true
        button.layer.cornerRadius = 60
        button.addTarget(self, action: #selector(incrementButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let minusButtton: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        button.tintColor = .systemRed
        button.clipsToBounds = true
        button.layer.cornerRadius = 35
        button.addTarget(self, action: #selector(decrementButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    let resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("reset", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        button.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        button.tintColor = .systemPink
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupScene()
        makeConstraints()
    }
}

private extension ViewController {
    
    func setupScene(){
        view.addSubview(pluseButton)
        view.addSubview(minusButtton)
        view.addSubview(resetButton)
        view.addSubview(nameLabel)
        view.addSubview(countLabel)
    }
    
    func makeConstraints() {
        //plusButton
        NSLayoutConstraint.activate([
            pluseButton.widthAnchor.constraint(equalToConstant: 120),
            pluseButton.heightAnchor.constraint(equalToConstant: 120),
            pluseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pluseButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        //minusButton
        NSLayoutConstraint.activate([
            minusButtton.widthAnchor.constraint(equalToConstant: 70),
            minusButtton.heightAnchor.constraint(equalToConstant: 70),
            minusButtton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            minusButtton.topAnchor.constraint(equalTo: pluseButton.bottomAnchor, constant: 10),
        ])
        //resetButton
        NSLayoutConstraint.activate([
            resetButton.widthAnchor.constraint(equalToConstant: 90),
            resetButton.heightAnchor.constraint(equalToConstant: 40),
            resetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resetButton.topAnchor.constraint(equalTo: minusButtton.bottomAnchor, constant: 70),
        ])
        //  nameLabel
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
        ])
        //countLabel
        NSLayoutConstraint.activate([
            countLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200)
        ])
        
    }
    
    @objc func incrementButtonTapped() {
        count += 1
        countLabel.text = "\(count)"
        
    }
    
    @objc func decrementButtonTapped() {
        if let count = Int(countLabel.text ?? ""){
            var trueCount = count - 1
            if trueCount < 0 {
                trueCount = 0
            }
            countLabel.text = "\(trueCount)"
        }
    }
    
    @objc func resetButtonTapped() {
        count = 0
        countLabel.text = "\(count)"
    }
}






