#!/usr/bin/python3
"""Extend task #0 python script to export data in JSON format
for given employee id
"""

import json
import requests
from sys import argv

if __name__ == '__main__':
    # since we're interested in the employees name and todo,
    # we'll need both TODOS and USERNAME:
    user_url = "https://jsonplaceholder.typicode.com/users"
    todo_url = "https://jsonplaceholder.typicode.com/todos"

    try:
        user_id = argv[1]
        users_names = requests.get(f'{user_url}?id={user_id}').json()
        users_todos = requests.get(f'{todo_url}').json()

        username = users_names[0].get("username")

        json_data = []
        for todos in users_todos:
            if todos.get("userId") == int(user_id):
                json_data.append(
                    {"task": todos.get("title"),
                     "completed": todos.get("completed"),
                     "username": username
                    }
                )

        json_file = user_id + ".json"
        with open(json_file, "w", encoding="utf-8") as file:
            json.dump({user_id: json_data}, file)

    except Exception as e:
        pass
