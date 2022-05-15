//
//  Person.swift
//  RealmDemo
//
//  Created by Sumendra on 15/05/22.
//
import RealmSwift
import Foundation

class Person: Object{
    @Persisted var id: String
    @Persisted var name: String
    @Persisted var salary: Int
    @Persisted var department: String
}

func getFilteredArray(array:[Person],filterByDepartment:String)->[Person]{
    if filterByDepartment != ""{
    let arrayfinal = array.filter { person in
        return person.department == filterByDepartment
       }
        return arrayfinal
    }
    return array
}

