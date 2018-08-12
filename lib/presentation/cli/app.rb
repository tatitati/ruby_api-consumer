require "pp"

commands = ['most_sold', 'total_spend', 'most_loyal']
command = ARGV[0]

if ARGV.length > 1
  parameter = ARGV[1]
end


case command
when "most_sold"
    repo = MostSoldItemCommand.new()
    pp repo
when "total_spend"
  
when "most_loyal"
  
else
  puts "PARAMETER NOT RECONGNIZED"
end