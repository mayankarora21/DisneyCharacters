//
//  ViewController.swift
//  DisneyCharacters
//
//  Created by user224841 on 7/27/22.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var selectedRowIndex = 0
    var disneyCharactersViewModel = DisneyCharactersViewModel()
    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "CharacterCell", bundle: nil), forCellReuseIdentifier: "CharacterCell")
        tableView.dataSource = self
        tableView.delegate = self
        
        self.title = "Disney Characters"
        
        getDisneyCharactersData()
    }
    
    func getDisneyCharactersData(){        
        disneyCharactersViewModel.reloadTable = {
            [weak self] in
            self?.tableView.reloadData()
        }
        disneyCharactersViewModel.getDisneyCharactersData()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        disneyCharactersViewModel.characters.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
        return 100.0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currCell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as! CharacterCell
        currCell.character = disneyCharactersViewModel.characters[indexPath.row]
        currCell.loadCell()
        
//        if indexPath.row % 2 == 0 {
//            currCell.label.text = "hello world ashdkdsljaldowd.asmsalkdakdoipuoijpoksd;lasd,;l'l'las;l,x;amkd;kd;la'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
//        }
        return currCell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRowIndex = indexPath.row
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "navigateToDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "navigateToDetails" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.character = disneyCharactersViewModel.characters[selectedRowIndex]
        }
    }
}
