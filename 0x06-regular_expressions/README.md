#!/usr/bin/env bash
Introduction to Regular Expression using ruby:

Character Token
[A-Z] - Matches any capital letter between A to Z
[a-z] - Matches any small letter between a to z
[a-zA-Z] - Matches all letters
[a-zA-Z0-9] - Matches alphanumeric characters
[0-9] - Matches only numbers

Repetition Token
{m, n} - Match exact occurence of a character/token
? - Matches 0 or 1 occurrence of a token
+ - Matches 1 or more occurrence of a token
* - Matches 0 or more occurene of a token

Anchor Token
^ - Matches the position of first character at the beginning of each line
$ - Matches the position of last character at the end of a line
\A - Matches the position of character(s) at only the beginning of the first line in the whole page (either single or multiple lines)
\Z - Matches the position of character(s) at only the end of the last line in the whole page (either single or multiple lines)

Shortcut Character Token
\d - Matches any digit
\s - Matches any whitespace character
\w - Matches any word character i.e letters, numbers
\D, \S, \W - Matches opposite of the 3 above classes
