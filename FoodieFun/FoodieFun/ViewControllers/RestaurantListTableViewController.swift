//
//  RestaurantListTableViewController.swift
//  FoodieFun
//
//  Created by Jerry haaser on 1/6/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import UIKit
import CoreData

protocol RestaurantListTableViewControllerDelegate {

}

class RestaurantListTableViewController: UITableViewController {
    
    var restaurantController: RestaurantController!
    var restaurant: Restaurant!
    
    var delegate: RestaurantListTableViewControllerDelegate?
    
    lazy var restaurantReviewFRC: NSFetchedResultsController<RestaurantReview> = {
        let fetchRequest: NSFetchRequest<RestaurantReview> = RestaurantReview.fetchRequest()
        
        fetchRequest.sortDescriptors = [
            NSSortDescriptor(key: "restaurantReviewName", ascending: true)
        ]
        
        let frc = NSFetchedResultsController(fetchRequest: fetchRequest,
                                             managedObjectContext: CoreDataStack.shared.mainContext,
                                             sectionNameKeyPath: "restaurantReviewName",
                                             cacheName: nil)
        
        do {
            try frc.performFetch()
        } catch {
            fatalError("Error performing fetch for frc: \(error)")
        }
        return frc
        
    }()
    
    lazy var fetchedResultsController: NSFetchedResultsController<Restaurant> = {
    
    let fetchRequest: NSFetchRequest<Restaurant> = Restaurant.fetchRequest()
        
        if let assignments = restaurantReviewFRC.fetchedObjects {
            let namesToFetch = assignments.map({ $0.review})
            fetchRequest.predicate = NSPredicate(format: "review IN %@", namesToFetch)
        }
        
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "userId", ascending: true),
                                        NSSortDescriptor(key: "restaurantName", ascending: true)
        ]
        
        let frc = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.shared.mainContext, sectionNameKeyPath: "restaurantName", cacheName: nil)
        
        frc.delegate = self
        
        do{
            try frc.performFetch()
        } catch {
            fatalError("Error peforming fetch for frc: \(error)")
        }
        
        return frc
    
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    @IBAction func restaurantListAddButton(_ sender: UIBarButtonItem) {
        
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        return fetchedResultsController.sections?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fetchedResultsController.sections?[section].numberOfObjects ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantListTableViewCell", for: indexPath) as? RestaurantListCustomTableViewCell else { return UITableViewCell() }

        cell.restaurant = fetchedResultsController.object(at: indexPath)

        return cell
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "RestaurantReviewTableViewShowSegue" {
            guard let detailVC = segue.destination as? RestaurantReviewTableViewController,
                let indexPath = tableView.indexPathForSelectedRow else { return }
            
            let restaurant = fetchedResultsController.object(at: indexPath)
            detailVC.restaurant = restaurant
            detailVC.restaurantController = restaurantController
            detailVC.delegate = delegate
            
        } else if segue.identifier == "AddRestaurantShowSegue" {
            guard let detailVC = segue.destination as? AddRestaurantViewController,
                let indexPath = tableView.indexPathForSelectedRow else { return }
            detailVC.restaurantController = restaurantController
            
        }
        
    }
    

}

//MARK: - May use this 
extension RestaurantListTableViewController: NSFetchedResultsControllerDelegate {

    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }

    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>,
                    didChange anObject: Any,
                    at indexPath: IndexPath?,
                    for type: NSFetchedResultsChangeType,
                    newIndexPath: IndexPath?) {

        switch type {
        case .insert:
            guard let newIndexPath = newIndexPath else { return }
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        case .delete:
            guard let indexPath = indexPath else { return }
            tableView.deleteRows(at: [indexPath], with: .automatic)
        case .move:
            guard let indexPath = indexPath,
                let newIndexPath = newIndexPath else { return }

            tableView.moveRow(at: indexPath, to: newIndexPath)
        case .update:
            guard let indexPath = indexPath else { return }
            tableView.reloadRows(at: [indexPath], with: .automatic)
        @unknown default:
            fatalError("Unknown Fetched Results Change Type.")
        }
    }

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>,
                    didChange sectionInfo: NSFetchedResultsSectionInfo,
                    atSectionIndex sectionIndex: Int,
                    for type: NSFetchedResultsChangeType) {

        let indexSet = IndexSet(integer: sectionIndex)

        switch type {
        case .insert:
            tableView.insertSections(indexSet, with: .automatic)
        case .delete:
            tableView.deleteSections(indexSet, with: .automatic)
        default:
            return
        }
    }
}

