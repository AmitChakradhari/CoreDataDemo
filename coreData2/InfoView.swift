//
//  InfoView.swift
//  coreData2

import UIKit
import CoreData
var deleteRow: Bool = false
class InfoView: UIViewController {
    @IBAction func deleteButton(_ sender: Any) {
        managedObjectContext.delete(devices[indexPath])
        deleteRow = true
        goBack()
    }
    @IBAction func doneButton(_ sender: Any) {
        goBack()
    }
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    var labelValue1: String = ""
    var labelValue2: String = ""
    var indexPath: Int!
    var managedObjectContext: NSManagedObjectContext!
    override func viewDidLoad() {
        super.viewDidLoad()
        managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        label1.text = labelValue1
        label2.text = labelValue2
        // Do any additional setup after loading the view.
    }
    func goBack() {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
}
