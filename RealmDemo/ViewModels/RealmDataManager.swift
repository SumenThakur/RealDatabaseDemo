//
//  RealmDataManager.swift
//  RealmDemo
//
//  Created by Sumendra on 15/05/22.
//

import RealmSwift
import Foundation

class RealmDataManager{
    
    let realm = try! Realm()
    
    
    func SavaDataToRealm(object:Person){
        // Persist your data easily with a write transaction
        try! realm.write {
            realm.add(object)
            debugPrint("Object saved")
        }
    }
    
    func getDataFromRealm<T:Object>(objectType:T.Type)->[T]{
        // Get all persons in the realm
        let objects = realm.objects(objectType.self)
        //convert all result<type> to expected model array
        return objects.toArray(ofType: objectType.self)
        
    }
    
    func deleteDataFromRealm<T:Object>(objectType:T.Type){
        // Get all persons in the realm
        let objects = realm.objects(objectType.self)
        try! realm.write {
            realm.delete(objects)
            debugPrint("Objects deleted")
        }
    }
}

extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for i in 0 ..< count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }
        return array
    }
}



