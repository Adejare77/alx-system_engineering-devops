#!/usr/bin/python3
"""Query the Reddit API ('https://www.reddit.com/dev/api')"""

import requests


def top_ten(subreddit):
    """prints titles of the first 10 hot posts listed for
    a given subreddit
    """
    headers = {"User-Agent": "Linux 6.2.0-39-generic/vscode:v1.88.0\
               (by /u/rashisky)"}
    url = "https://www.reddit.com/r/{}/hot.json".format(subreddit)

    resp = requests.get(url=url, headers=headers, allow_redirects=False)

    if (resp.status_code == requests.codes.ok):
        json_resp = resp.json()
        children = json_resp['data']['children']
        for i in range(10):
            print(children[i]['data']['title'])
    else:
        print("None")
