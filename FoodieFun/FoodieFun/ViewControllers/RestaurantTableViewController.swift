//
//  RestaurantListTableViewController.swift
//  FoodieFun
//
//  Created by Jerry haaser on 1/6/20.
//  Copyright © 2020 Jerry haaser. All rights reserved.
//

import UIKit
import CoreData

class ReviewsTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {

    //MARK: - Properties
    @IBOutlet weak var visitDateTextfield: UITextField!
    @IBOutlet weak var ratingTextfield: UITextField!
    @IBOutlet weak var reviewTextView: UITextView!
    var foodieFunController: FoodieFunController?
    var restaurant: Restaurant?
    
    lazy var fetchedResultsController: NSFetchedResultsController<Review> = {
             let fetchRequest: NSFetchRequest<Review> = Review.fetchRequest()
             fetchRequest.sortDescriptors = [NSSortDescriptor(key: "rating", ascending: true)]
             let moc = CoreDataStack.shared.context
             let frc = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: moc, sectionNameKeyPath: "rating", cacheName: nil)
             frc.delegate = self
             try! frc.performFetch()
             return frc
         }()

    override func viewDidLoad() {
        super.viewDidLoad()
        reviewTextView.text = ""
    }
    
    @IBAction func saveReviewButton(_ sender: UIButton) {
        saveReview()
    }
    
    //MARK: - helper methods
   private func saveReview() {
        guard let date = visitDateTextfield.text, !date.isEmpty,
        let rating = ratingTextfield.text, !rating.isEmpty,
        let review = reviewTextView.text, !review.isEmpty else { return }
        foodieFunController?.addReview(withRating: rating, visitDate: date, review: review)
        tableView.reloadData()
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
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath) as? ReviewTableViewCell else { return UITableViewCell() }
        let review = fetchedResultsController.object(at: indexPath)
        cell.textLabel?.text = review.rating
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
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
