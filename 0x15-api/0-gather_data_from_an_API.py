#!/usr/bin/python3
"""
A Python script that, using this REST API
(https://jsonplaceholder.typicode.com/),for a given employee ID, returns
information about his/her TODO list progress
"""
import requests
from sys import argv

if __name__ == '__main__':
    # since we're interested in the employees name and todo:
    # Method 1 (inefficient)
    users_names = requests.get("https://jsonplaceholder.typicode.com/users")
    users_todos = requests.get("https://jsonplaceholder.typicode.com/todos")

    if (users_names.status_code == users_todos.status_code == 200):
        for user in users_names.json():
            if user.get("id") == int(argv[1]):
                user = user.get("name")
                break
        total_tasks = [todos for todos in users_todos.json()
                       if todos.get("userId") == int(argv[1])]
        cmpltd_tasks = [todos for todos in users_todos.json()
                        if todos.get("userId") == int(argv[1]) and
                        todos.get("completed")]
        task_title = [todos.get("title") for todos in users_todos.json()
                      if todos.get("userId") == int(argv[1]) and
                      todos.get("completed")]

        print(f'Employee {user} is done with tasks \
({len(cmpltd_tasks)}/{len(total_tasks)}):')
        [print("\t", task) for task in task_title]
