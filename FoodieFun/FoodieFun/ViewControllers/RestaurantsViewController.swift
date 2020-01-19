//
//  RestaurantsViewController.swift
//  FoodieFun
//
//  Created by Jerry haaser on 1/19/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import UIKit
import CoreData

class RestaurantsTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {

    //MARK: - Properties
    var foodieFunController = FoodieFunController()
    lazy var fetchedResultsController: NSFetchedResultsController<Restaurant> = {
             let fetchRequest: NSFetchRequest<Restaurant> = Restaurant.fetchRequest()
             fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
             let moc = CoreDataStack.shared.context
             let frc = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: moc, sectionNameKeyPath: "name", cacheName: nil)
             frc.delegate = self
             try! frc.performFetch()
             return frc
         }()
    override func viewDidLoad() {
        super.viewDidLoad()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell", for: indexPath)
        let restaurant = fetchedResultsController.object(at: indexPath)
        cell.textLabel?.text = restaurant.name
        return cell
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddRestaurantSegue" {
           guard let addRestaurantVC = segue.destination as? AddRestaurantViewController else { return}
            addRestaurantVC.foodieFunController = foodieFunController
        } else if segue.identifier == "ReviewSegue" {
            guard let reviewsTVC = segue.destination as? ReviewsTableViewController,
                let indexPath = tableView.indexPathForSelectedRow else { return }
            reviewsTVC.foodieFunController = foodieFunController
            reviewsTVC.restaurant = fetchedResultsController.object(at: indexPath)
        }
    }
    

    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
                 tableView.beginUpdates()
             }
             
             func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
                 tableView.endUpdates()
             }
             
             func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
                 switch type {
                 case .insert:
                     tableView.insertSections(IndexSet(integer: sectionIndex), with: .automatic)
                 case .delete:
                     tableView.deleteSections(IndexSet(integer: sectionIndex), with: .automatic)
                 default:
                     break
                 }
             }
             
             func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
                 switch type {
                 case .insert:
                     guard let newIndexPath = newIndexPath else { return }
                     tableView.insertRows(at: [newIndexPath], with: .automatic)
                 case .update:
                     guard let indexPath = indexPath else { return }
                     tableView.reloadRows(at: [indexPath], with: .automatic)
                 case .move:
                     guard let oldIndexPath = indexPath,
                         let newIndexPath = newIndexPath else { return }
                     tableView.deleteRows(at: [oldIndexPath], with: .automatic)
                     tableView.insertRows(at: [newIndexPath], with: .automatic)
                 case .delete:
                     guard let indexPath = indexPath else { return }
                     tableView.deleteRows(at: [indexPath], with: .automatic)
                 @unknown default:
                     break
                 }
             }
}
