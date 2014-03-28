require 'rest_client'
require 'colors'

URL = "http://localhost:4567/calc2"
SYNTAX_ERROR = "syntax error"
DIV_BY_0 = "division by zero"

test_no = 0

#   __
#  /  \
# | () |
#  \__/

r = RestClient.delete URL
if r.code != 204
  puts "(#{test_no}) wrong http code"
else
  puts "(#{test_no})".hl(:green)
end

test_no += 1

#  _
# / |
# | |
# |_|

r = RestClient.get URL

unless r.body.empty?
  puts "(#{test_no}) server should not contain any records".hl(:red)
else
  puts "(#{test_no})".hl(:green)
end

test_no += 1

#  ___
# |_  )
#  / /
# /___|

r = RestClient.post URL, {:equation => "1&1&+"}
if r.code != 201
  puts "(#{test_no}) wrong http code (#{r.code})".hl(:red)
else
  puts "(#{test_no})".hl(:green)
end
id = r.body

test_no += 1

#  ____
# |__ /
#  |_ \
# |___/

r = RestClient.get "#{URL}/#{id}"
if r.body.to_f != 2
  puts "(#{test_no}) wrong result (#{r.body})".hl(:red)
else
  puts "(#{test_no})".hl(:green)
end

test_no += 1

#  _ _
# | | |
# |_  _|
#   |_|

r = RestClient.put "#{URL}/#{id}", {:equation => "1&ACC&+"}
if r.code != 200
  puts "(#{test_no}) wrong http code (#{r.code})".hl(:red)
else
  puts "(#{test_no})".hl(:green)
end

test_no += 1

#  ___
# | __|
# |__ \
# |___/

r = RestClient.get "#{URL}/#{id}"
if r.body.to_f != 3
  puts "(#{test_no}) wrong result (#{r.body})".hl(:red)
else
  puts "(#{test_no})".hl(:green)
end

test_no += 1

#   __
#  / /
# / _ \
# \___/

r = RestClient.get URL
unless r.body.split(',').length == 1
  puts "(#{test_no}) server should not contain one record".hl(:red)
else
  puts "(#{test_no})".hl(:green)
end

test_no += 1

#  ____
# |__  |
#   / /
#  /_/

r = RestClient.post URL, {:equation => "32.48&44.96&-&71.55&55.86&*&+&53.83&:&44.81&+"}
if r.code != 201
  puts "(#{test_no}) wrong http code (#{r.code})".hl(:red)
else
  puts "(#{test_no})".hl(:green)
end
id = r.body

test_no += 1

#  ___
# ( _ )
# / _ \
# \___/

r = RestClient.get "#{URL}/#{id}"
if r.body.to_f.round(2) != 118.83
  puts "(#{test_no}) wrong result (#{r.body})".hl(:red)
else
  puts "(#{test_no})".hl(:green)
end

test_no += 1

#  ___
# / _ \
# \_, /
#  /_/

r = RestClient.get URL
unless r.body.split(',').length == 2
  puts "(#{test_no}) server should not contain two records instead of #{r.body.split(',').length}".hl(:red)
else
  puts "(#{test_no})".hl(:green)
end
