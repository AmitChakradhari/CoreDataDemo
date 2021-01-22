//
//  DetailViewController.swift
//  CoreData


import UIKit
import  CoreData
class DetailViewController: UIViewController {
    @IBAction func saveClicked(_ sender: Any) {
        addCell()
        goBack()
    }
    @IBAction func cancelClicked(_ sender: Any) {
        goBack()
    }
    @IBOutlet weak var label1: UITextField!
    @IBOutlet weak var label2: UITextField!
    var managedObjectContext: NSManagedObjectContext!
    override func viewDidLoad() {
        super.viewDidLoad()
        managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        // Do any additional setup after loading the view.
    }
    
    func addCell(){
        let newItem = Device(context: managedObjectContext)
        newItem.company = label1.text!
        newItem.modelName = label2.text!
        devices.append(newItem)
    }

    func goBack() {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }

}
