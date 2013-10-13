#!/usr/bin/env ruby

require './sh/env'

client = Etcd::Client.test_client(:heartbeat_freq => 1)
key    = "/production/mongodb/master"
puts "observing #{key}"

obs = client.observe(key) do |v,k,info|
  puts "switching mongo master to #{v}"
  #puts "v #{v}, k: #{k}, info: #{info}"
end

while true
  sleep 1
end


#### test the communication from a console
# client = Etcd::Client.test_client
# key    = "/production/mongodb/master"
# client.set(key, "10.0.0.10:9999")