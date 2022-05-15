//
//  ViewController.swift
//  RealmDemo
//
//  Created by Sumendra on 15/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tblViewPerson: UITableView!
    @IBOutlet weak var lblNoPerson: UILabel!


    let realm = RealmDataManager()
    
    var arrayPersons = [Person]()

    override func viewDidLoad() {
        super.viewDidLoad()
        //In first launch it will save all data to realm database then from second launch you will get data according filter
         
        //deleteAllData()
        
        // Filtering data according to filter key , if key blank "" then it will return all data, change filter key to iOS, Flutter, Android etc.
        getObjects(byDepartment: "")
        if arrayPersons.count > 0 {
        }else{
            saveObjectToRealm(withNames: PersonData.personArray)
        }
        // Do any additional setup after loading the view.
    }
    
        func saveObjectToRealm(withNames:[[String:String]]){
        // to add users in database accoding to you need change department so you have multiple department type persons
        for (_,obj) in withNames.enumerated(){
        let person = Person()
        let randomId = Int.random(in: 0..<10000)
        person.id = "\(randomId)"
            person.name = "\(obj["name"] ?? "")"
        person.department = "\(obj["department"] ?? "")"
        realm.SavaDataToRealm(object: person)
        }
    }
    
    func getObjects(byDepartment:String){
        //Fetching all stored result from realm datdabase
        arrayPersons = realm.getDataFromRealm(objectType: Person.self)
        arrayPersons = getFilteredArray(array: arrayPersons, filterByDepartment: byDepartment)
        lblNoPerson.isHidden = !arrayPersons.isEmpty
        tblViewPerson.reloadData()
    }
    
    func deleteAllData(){
        // delete of data object from realm of person type
        realm.deleteDataFromRealm(objectType: Person.self)
    }

}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayPersons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as! PersonCell
        let data = arrayPersons[indexPath.row]
        cell.SetCellData(data: data)
        return cell
    }
}

