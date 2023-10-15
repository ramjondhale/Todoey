//
//  ViewController.swift
//  Todoey
//
//  Created by Ram Jondhale on 14/10/23.
//

import UIKit

class TodoListViewController: UITableViewController {

    var todoItems = [
        TodoItem(title: "Find Mike"),
        TodoItem(title: "Buy Eggos"),
        TodoItem(title: "Destroy Demogorgons")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - TableView DataSource Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let todoItem = todoItems[indexPath.row]
        cell.textLabel?.text = todoItem.title
        cell.accessoryType = todoItem.done ? .checkmark : .none
        return cell
    }

    // MARK: - TableView Delegate Methods

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        todoItems[indexPath.row].done.toggle()
        tableView.reloadData()
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
            if let todoTitle = todoTextField.text {
                self.todoItems.append(TodoItem(title: todoTitle))
                self.tableView.reloadData()
            }
        }
        alertController.addAction(addAction)

        present(alertController, animated: true)
    }
}
