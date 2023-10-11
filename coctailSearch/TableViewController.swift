//
//  TableViewController.swift
//  coctailSearch
//
//  Created by Alua Nurakhanova on 11.10.2023.
//

import UIKit
import Alamofire
import SVProgressHUD
import SwiftyJSON

class TableViewController: UITableViewController, UISearchBarDelegate {
    @IBOutlet weak var searchBar: UISearchBar!
    
    var charactersArray : [Character] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        searchBar.placeholder = "Search Character"
        searchCharacter(term: "Samwell")
    }
    
    func searchCharacter(term : String){
        let parameters = ["term" : term, "limit" : 25] as [String : Any]
        SVProgressHUD.show()
        
        AF.request("https://thronesapi.com/api/v2/Characters",method: .get, parameters: parameters).responseData{
            response in
            SVProgressHUD.dismiss()
            AF.request("https://thronesapi.com/api/v2/Characters", method: .get, parameters: parameters).responseData { response in
                SVProgressHUD.dismiss()
                if let data = response.data {
                    let json = JSON(data)
                    if let array = json.array {
                        for item in array {
                            let character = Character(json: item)
                            self.charactersArray.append(character)
                        }
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
//            var resultString = ""
//            if let data = response.data {
//                 resultString = String(data: data, encoding: .utf8)!
//                print(charactersArray)
//                print(resultString)
//                
//            }
//            if  response.response?.statusCode == 200{
//                let json = JSON(response.data!)
//                if let array = json["Characters"].array{
//                    for item in array{
//                        let characters = Character(json : item)
//                        self.charactersArray.append(characters)
//                    }
//                }
//                self.tableView.reloadData()
//            }
//        }
//    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        charactersArray.removeAll()
       tableView.reloadData()
        searchCharacter(term: searchBar.text!)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return charactersArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CoctailTableViewCell
        cell.setData(character: charactersArray[indexPath.row])

        // Configure the cell...

        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 154.0
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        vc.character = charactersArray[indexPath.row]
        navigationController?.show(vc, sender: self)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
