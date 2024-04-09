#!/usr/bin/python3
"""Query the Reddit API ('https://www.reddit.com/dev/api')"""

import requests


def recurse(subreddit, hot_list=[], after="null"):
    """prints titles of the all hot posts listed for
    a given subreddit
    """
    """since, there is pagination, "after (next)" is used as an anchor
    to the next page. So, if anchor isn't null, then there will be
    next page. For testing, pass "subscribers" as an argument
    """

    headers = {"User-Agent": "Linux 6.2.0-39-generic/vscode:v1.88.0\
               (by /u/rashisky)"}
    url = "https://www.reddit.com/r/{}/hot.json?limit=100&after={}"\
        .format(subreddit, after)

    resp = requests.get(url=url, headers=headers, allow_redirects=False)

    if (resp.status_code == requests.codes.ok):
        json_resp = resp.json()
        num_of_children = json_resp['data']['dist']
        children = json_resp['data']['children']
        for i in range(num_of_children):
            hot_list.append(children[i]['data']['title'])

        if json_resp['data']['after']:  # if after != None
            recurse(subreddit, hot_list, json_resp['data']['after'])

        return (hot_list)
    return (None)
