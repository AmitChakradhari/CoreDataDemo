//
//  ViewController.swift
//  CoreData

import UIKit
import CoreData
var devices: [Device] = []
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func addClicked(_ sender: Any) {
        performSegue(withIdentifier: "Add", sender: self)
    }
    var managedObjectContext: NSManagedObjectContext!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        loadData()
        
    }
    func loadData(){
        let presentRequest: NSFetchRequest<Device> = Device.fetchRequest()
        do {
            devices = try  managedObjectContext.fetch(presentRequest)
            tableView.reloadData()
        }catch{
            print("error: \(error.localizedDescription)")
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return devices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = devices[indexPath.row].modelName
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        performSegue(withIdentifier: "cellClicked", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cellClicked"{
            if let indexPath = self.tableView.indexPathForSelectedRow{
                let controller = segue.destination as! InfoView
                controller.labelValue1 = devices[indexPath.row].company!
                controller.labelValue2 = devices[indexPath.row].modelName!
                controller.indexPath = indexPath.row
            }
        }
    }
}


