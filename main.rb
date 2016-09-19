require 'pg'
require 'date'
require 'yaml'


hoy = Time.now.strftime("%Y-%m-%d")

config = YAML.load_file("database.yaml")

dbname = config["database"]["dbname"]
user = config["database"]["user"]
host = config["database"]["host"]
password = config["database"]["password"]


conn = PG.connect :dbname => "#{dbname}", :user => "#{user}", :host=> "#{host}", :password => "#{password}"


result = conn.exec("select reminders.when_activate, reminders.content, users.mobile_num from reminders join users on reminders.user_id = users.id where when_activate::text like '#{hoy}%';")

result.each do |row|
  puts "----"
  print "User id: ", row['user_id'], "\n"
  print "contenido: ", row['content'], "\n"
  print "cuando llamar: ", row['when_activate'], "\n"
  print "numero a llamar: ", row['mobile_num'], "\n"
end
