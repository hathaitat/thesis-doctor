//
//  bookdoctor2ViewController.swift
//  bb
//
//  Created by hathaitat on 23/1/2563 BE.
//  Copyright © 2563 hathaitat. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI



class bookdoctor2ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
//

    @IBOutlet weak var tableDoc: UITableView!
    @IBOutlet weak var searchDoctor: UISearchBar!
    

    var doctor1:String!
    var filteredData = [String]()
    var inSearchMode = false
    var search: String!
    let db = Firestore.firestore()
    var ss = [String]()

    func getDoctorData() {
    db.collection("doctor").getDocuments { (snapshot, error) in
        if error == nil && snapshot != nil {
            for document in snapshot!.documents {
                if document.get("nameDoc") != nil && document.get("deptDoc") != nil {
                    let documentData = document.data()
                    let nameDoc = document.get("nameDoc") as! String
//                    let deptDoc = document.get("deptDoc") as! String
                    
                    self.ss.append(nameDoc)
//                    self.ss.append(deptDoc)
                    self.filteredData = self.ss
                                }
                            }
                        }
                        self.tableDoc.reloadData()
                    }
                }
            
    
    override func viewDidLoad() {
           super.viewDidLoad()
            getDoctorData()

           self.navigationItem.hidesBackButton = true

           self.tableDoc.separatorStyle = .none

           tableDoc.delegate = self

           tableDoc.dataSource = self

           searchDoctor.delegate = self

           searchDoctor.returnKeyType = UIReturnKeyType.done


       }


       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

           if inSearchMode {

               return ss.count
           }else{
            return filteredData.count
        }
//           return 0   // return data.count
       }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 257
    }

       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

           if let cell = tableDoc.dequeueReusableCell(withIdentifier: "bell",
               for: indexPath) as? book2 {
               var doctor1: String!
               if inSearchMode {
                cell.doctorName?.text = ss[indexPath.row]
//                cell.doctorDept?.text = filteredData[indexPath.row]
                doctor1 = self.filteredData[indexPath.row]
                print(doctor1)

            } else {
                cell.doctorName?.text = ss[indexPath.row]
                doctor1 = ""          //don't want to get and place all usernames in cells
               }
               return cell
            } else {
                return UITableViewCell()
           }
       }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
                   let vc = storyboard?.instantiateViewController(withIdentifier: "book2detail") as? book2detailViewController
    //               vc?.nameDoc = showdata2[indexPath.row]
    //               vc?.showTimeperiod2 = showTimeperiod
    //               vc?.showDayPick2 = showDayPick
    //               vc?.showDayPickTotal2 = showDayPickTotal
                   self.present(vc!, animated: true)
                   
               }


       func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//            var ss = [String]()
//            inSearchMode = true
           search = searchDoctor.text
//           db.collection("doctor").getDocuments { (snapshot, error) in
//              if error == nil && snapshot != nil {
//                  for document in snapshot!.documents {
//                     if document.get("nameDoc") != nil && document.get("deptDoc") != nil  {
//                     let documentData = document.data()
//                     let nameDoc = document.get("nameDoc") as! String
//                     let deptDoc = document.get("deptDoc") as! String
//
//
//                    self.filteredData.removeAll()   //remove irrelevant values
//                        self.filteredData.append(nameDoc)
//                        self.filteredData.append(deptDoc)
////                        print(self.filteredData)

                        self.ss = self.filteredData.filter({$0.prefix(searchText.count) == searchText})
                        print(self.ss)
//                        print(self.filteredData)
//                        if self.search == nameDoc {
////                            print(nameDoc)
//                        }
//                        ss = self.filteredData.filter({$0.prefix(searchText.count) == searchText})
//                        print(ss)
//                    }
//
//                      }
                self.inSearchMode = true

                self.tableDoc.reloadData()
                  }
//            print(self.ss)
                  }



//           }

               // here is where we get data and filter data




       func searchBarSearchButtonClicked(_ searchBar: UISearchBar)  {
           searchBar.resignFirstResponder()

       }
//


