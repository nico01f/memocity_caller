require 'pg'
require 'date'

hoy = Time.now.strftime("%Y-%m-%d")
conn = PG.connect :dbname => 'd814pral4f35oh', :user => 'fwgussdvvrmoia', :host=> 'ec2-54-83-3-38.compute-1.amazonaws.com', :password => 'wja1vjCs2pWx-EiKBaggGxo5eq'


result = conn.exec("select reminders.user_id, reminders.when_activate, reminders.content, users.mobile_num from reminders join users on reminders.user_id = users.id where when_activate::text like '#{hoy}%';")

result.each do |row|
  puts "----"
  print "User id: ", row['user_id'], "\n"
  print "contenido: ", row['content'], "\n"
  print "cuando llamar: ", row['when_activate'], "\n"
  print "numero a llamar: ", row['mobile_num'], "\n"
end
