#!/usr/bin/python3
"""Query the Reddit API ('https://www.reddit.com/dev/api')"""

import requests
from sys import argv


def count_words(subreddit, word_list, after="", **kwargs):
    """ recursive function that queries the Reddit API,
    parses the title of all hot articles (posts) prints a sorted count of
    given keywords (case-insensitive, delimeter by spaces. example:
    Java should count as java but not Javascript)
    """

    headers = {"User-Agent": "Linux 6.2.0-39-generic/vscode:v1.88.0\
               (by /u/rashisky)"}
    url = "https://www.reddit.com/r/{}/hot.json?limit=100&after={}"\
        .format(subreddit, after)

    resp = requests.get(url=url, headers=headers, allow_redirects=False)

    if not kwargs:
        for word in word_list:
            kwargs[word] = 0

    if (resp.status_code == requests.codes.ok):
        json_resp = resp.json()
        num_of_children = json_resp['data']['dist']
        children = json_resp['data']['children']

        for i in range(num_of_children):
            child_title = (children[i]['data']['title']).lower().split()
            for word in word_list:
                if word.lower() in child_title:
                    kwargs[word.lower()] += 1

        if json_resp['data']['after']:  # if after != None
            return count_words(subreddit, word_list,
                               json_resp['data']['after'], **kwargs)

        sorted_kwargs = dict(sorted(kwargs.items(),
                                    key=lambda item: (-item[1], item[0])))
        {print(f'{k}: {v}') for k, v in sorted_kwargs.items() if v}
