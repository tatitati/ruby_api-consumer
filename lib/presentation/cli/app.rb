require "pp"

commands = ['most_sold', 'total_spend', 'most_loyal']
command = ARGV[0]

if ARGV.length > 1
  parameter = ARGV[1]
end

case command
when "most_sold"
  pp MostSoldItemCommand.new.execute
when "total_spend"
  pp TotalSpentByUserCommand.new(
    TotalSpentByUserRequest.new(parameter)
    ).execute
when "most_loyal"
  pp MostLoyalUserCommand.new.execute
else
  puts "Nothing to do: PARAMETER not recognized"
end