#!/usr/bin/python3
"""Extend task #0 python script to export data in JSON format
for all employees
"""

import json
import requests


if __name__ == '__main__':
    # since we're interested in the employees name and todo,
    # we'll need both TODOS and USERNAME:
    user_url = "https://jsonplaceholder.typicode.com/users"
    todo_url = "https://jsonplaceholder.typicode.com/todos"

    try:
        users_names = requests.get(f'{user_url}').json()
        users_todos = requests.get(f'{todo_url}').json()

        _dict = {}  # will contain key(id): value
        for user in users_names:
            value = []  # stores value of each user
            for todos in users_todos:
                if todos.get("userId") == user.get("id"):
                    value.append(
                        {"username": user.get("username"),
                         "task": todos.get("title"),
                         "completed": todos.get("completed"),
                         }
                    )
            _dict[user.get("id")] = value

        json_file = "todo_all_employees.json"
        with open(json_file, "w", encoding="utf-8") as file:
            json.dump(_dict, file)

    except Exception as e:
        pass
