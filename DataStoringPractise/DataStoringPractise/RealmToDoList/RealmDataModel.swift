//
//  RealmDataModel.swift
//  DataStoringPractise
//
//  Created by Даниил Алексеев on 06.12.2020.
//
import RealmSwift
import Foundation

class ToDoListItem: Object{
    @objc dynamic var item: String = ""
    @objc dynamic var date: Date = Date()
}
