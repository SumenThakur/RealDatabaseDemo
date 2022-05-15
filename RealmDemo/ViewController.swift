//
//  ViewController.swift
//  RealmDemo
//
//  Created by Sumendra on 15/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tblViewPerson: UITableView!

    let realm = RealmDataManager()
    
    var arrayPersons = [Person]()

    override func viewDidLoad() {
        super.viewDidLoad()
        deleteAllData()
        
        //Please change array names and department after first call
        //saveObjectToRealm(withNames: ["Sumendra","Amit","Varun","Hariom"], ofDepartment: "iOS")
        
        getObjects()
        // Do any additional setup after loading the view.
    }
    
    func saveObjectToRealm(withNames:[String],ofDepartment:String){
        // to add users in database accoding to you need change department so you have multiple department type persons
        for (_,obj) in withNames.enumerated(){
        let person = Person()
        let randomId = Int.random(in: 0..<10000)
        person.id = "\(randomId)"
        person.name = "\(obj)"
        person.department = "\(ofDepartment)"
        realm.SavaDataToRealm(object: person)
        }
    }
    
    func getObjects(){
        //Fetching all stored result from realm datdabase
        arrayPersons = realm.getDataFromRealm(objectType: Person.self)
        // Filtering data according to filter key , if key blank "" then it will return all data, change filter key to iOS, Flutter, Android etc.
        arrayPersons = getFilteredArray(array: arrayPersons, filterByDepartment: "")
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

