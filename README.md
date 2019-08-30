# README

<p align="center"><img src="https://www.netsetsoftware.com/images2/logonetset.png"></p>
<h1>Rails api demo standard</h1>


# Why use rails api?                    

1. Reloading: Rails applications support transparent reloading. This works even if your application gets big and restarting the server for every request becomes non-viable.
2. Development Mode: Rails applications come with smart defaults for development, making development pleasant without compromising production-time performance.
3. Test Mode: Ditto development mode.
4. Logging: Rails applications log every request, with a level of verbosity appropriate for the current mode. Rails logs in development include information about the request environment, database queries, and basic performance information.
5. Security: Rails detects and thwarts IP spoofing attacks and handles cryptographic signatures in a timing attack aware way. Don't know what an IP spoofing attack or a timing attack is? Exactly.
6. Parameter Parsing: Want to specify your parameters as JSON instead of as a URL-encoded String? No problem. Rails will decode the JSON for you and make it available in params. Want to use nested URL-encoded parameters? That works too.
7. Conditional GETs: Rails handles conditional GET (ETag and Last-Modified) processing request headers and returning the correct response headers and status code. All you need to do is use the stale? check in your controller, and Rails will handle all of the HTTP details for you.
8. HEAD requests: Rails will transparently convert HEAD requests into GET ones, and return just the headers on the way out. This makes HEAD work reliably in all Rails APIs.

# Configuration:

Ruby version 2.3.0
Rails version 5.1.3
Postgres 

# Run the following commands on terminal

 1. bundle 
 2. rake db:create
 3. rake db:migrate
 4. rails s

You can access the api : http://localhost:3000/api/v1
