# Robot Warehouse Coding Test

## Solution

This solution treats the warehouse as a grid itself. Robots utilize the warehouse to move. Robots accept commands 
from the controller which initialize them.

## Installation 

Clone the project from github `https://github.com/J-Kavanagh-Personal/mindful_chef_test.git`

Install ruby 3.0.1 can be found here https://www.ruby-lang.org/en/news/2021/04/05/ruby-3-0-1-released/

Install bundler if it isn't already install

Install rspec for tests via `bundle install`

## Running the code

Make sure that run.rb is executable this can be done by chmod + x on linux and MacOS systems but on windows you 
might have to set the file properties to be executable in the permissions.

To change different commands and different starting positions and to change size of warehouse change the code or add 
code to run.rb.

`warehouse = Warehouse.new(max_dimensions: [10, 10])` <- This creates a warehouse it contains the dimensions.

`controller = Controller.new(starting_position: [0, 0], warehouse: warehouse)` <- This sets the starting position of 
the robot

`controller.run(commands: 'N,E,N,E,N,E,N,E')` <- This is how you enter in commands for the robot to follow.

To run code
`ruby run.rb`


To run tests
`bundle exec rspec`