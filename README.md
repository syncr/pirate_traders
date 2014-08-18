Pirate Traders
==============

Imagine if the high seas were regulated by a Pirate mafia protecting trading routes and ports.

Not too likely, but it makes a more interesting project. So there...

Tech: Ruby and PostgreSQL

##Tables
Ports (id, name)
Routes (id, name)
Route_details (id, port_id, route_id)

Many-to-Many: Multiple ports, may pair with multiple routes and vice versa.
Join Table: All ports contained within a route.

##Functions covered:

CRUD methods for Ports, Routes

UI support:
* add a port
* delete a port
* view all ports
* add a route
* view all routes
* add a port to a route
* show all ports associated with a route

Author: Jeremy Whitaker
