#!/usr/bin/python3
"""Extend task #0 python script to export data in the CSV"""

import csv
import requests
from sys import argv

if __name__ == '__main__':
    # since we're interested in the employees name and todo,
    # we'll need both TODOS and USERNAME:
    user_url = "https://jsonplaceholder.typicode.com/users"
    todo_url = "https://jsonplaceholder.typicode.com/todos"
    user_id = argv[1]

    try:
        users_names = requests.get(f'{user_url}?id={user_id}').json()
        users_todos = requests.get(f'{todo_url}').json()

        username = users_names[0].get("username")

        tasks = []
        for todos in users_todos:
            if todos.get("userId") == int(user_id):
                tasks.append((todos.get("title"),
                              todos.get("completed")))

    except Exception as e:
        pass

    csv_file = user_id + ".csv"
    with open(csv_file, "w", encoding="utf-8") as file:
        writer = csv.writer(file, quoting=csv.QUOTE_ALL)
        for task in tasks:
            writer.writerow([
                user_id, username,
                task[1], task[0]
            ])
