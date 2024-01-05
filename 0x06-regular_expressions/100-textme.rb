#!/usr/bin/env ruby
# Requirements:
# Your script should output: [SENDER], [RECEIVER], [FLAGS]
# The sender phone number or name (including country code if present)
# The receiver phone number or name (including country code if present)
# The flags that were used. The log file is "text_messages.log"

puts ARGV[0].scan(/(?<=from:|to:|flags:)[a-zA-Z0-9\+-:]+/).join(',')
