
## Space for improvements:

1. This project consume data from an Web API. From my point of view it would be interesting to think about adding a caching system to relax the load of that API.
2. This project fetch User aggregates. Each user aggregate references an order stream that contains a list of orders owned by the user. The persistence scenario that we have is the one in which these "users" and "orders" are in different stores (different web API endpoints), so our repository consume from both and assembly our User aggregate accordingly. For this reason it would be interesting to think about adding Promises instead of waiting to consume from each Web API synchronosly, which might produce some problems in performance from our side.


## Example to test it:

```
ruby lib/presentation/cli/app.rb most_loyal
ruby lib/presentation/cli/app.rb most_sold
ruby lib/presentation/cli/app.rb total_spend travis_kshlerin@wunsch.net
```
