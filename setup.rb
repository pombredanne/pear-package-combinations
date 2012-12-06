#!/usr/bin/env ruby

def get_pear_channel_list
  result = {}
  `pear list-channels | tail -n +4 | grep '^[^_ ]' | awk -F' ' 'BEGIN{OFS=" "} {print $1, $2}'`.lines.each { |line|
    channel, name = line.chomp.split(' ', 2)
    result[name] = channel
  }
  result
end

