require "pp"
require_relative "../../application/most_loyal_user_command"
require_relative "../../application/most_sold_item_command"
require_relative "../../application/total_spent_by_user_command"
require_relative "../../application/total_spent_by_user_request"


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