//
//  ViewController.swift
//  Todoey
//
//  Created by Ram Jondhale on 14/10/23.
//

import UIKit

class TodoListViewController: UITableViewController {

    var todoItems = [
        "Find Mike",
        "Buy Eggos",
        "Destroy Demogorgons"
    ]

    static let userDefaultKey = "TodoListArray"

    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        // Update local todo list array with data from user defaults
        if let storedItems = defaults.array(forKey: Self.userDefaultKey) as? [String] {
            todoItems = storedItems
        }
    }

    // MARK: - TableView DataSource Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = todoItems[indexPath.row]
        return cell
    }

    // MARK: - TableView Delegate Methods

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = cell?.accessoryType == UITableViewCell.AccessoryType.none ? .checkmark : .none

        tableView.deselectRow(at: indexPath, animated: true)
    }

    // MARK: - Add Action

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {

        let alertController = UIAlertController(title: "Add New Todoey Item", message: nil, preferredStyle: .alert)

        var todoTextField = UITextField()
        alertController.addTextField { textField in
            textField.placeholder = "Create new item"
            todoTextField = textField
        }

        let addAction = UIAlertAction(title: "Add Item", style: .default) { action in
            if let todoItem = todoTextField.text {
                self.todoItems.append(todoItem)

                // Store new todo list in the user defaults
                self.defaults.set(self.todoItems, forKey: Self.userDefaultKey)

                self.tableView.reloadData()
            }
        }
        alertController.addAction(addAction)

        present(alertController, animated: true)
    }

}

