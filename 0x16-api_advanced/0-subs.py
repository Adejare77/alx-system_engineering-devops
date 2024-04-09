#!/usr/bin/python3
"""Query the Reddit API ('https://www.reddit.com/dev/api')"""

import requests
from sys import argv


def number_of_subscribers(subreddit):
    """returns the number of subscriber
    (not active users but total subscrbers)
    """
    headers = {"User-Agent": "Linux 6.2.0-39-generic/vscode:v1.88.0\
               (by /u/rashisky)"}
    url = "https://www.reddit.com/r/{}/about.json".format(argv[1])

    resp = requests.get(url=url, headers=headers, allow_redirects=False)

    if (resp.status_code == requests.codes.ok):
        json_resp = resp.json()
        get_data_subscribers = json_resp.get('data').get('subscribers')
        return get_data_subscribers
    else:
        return 0
