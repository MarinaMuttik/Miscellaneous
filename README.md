# Miscellaneous

A small collection of Ruby tests done throughout learning.

## Files

### projeuler22 (and supporting file names.txt)

A Project Euler 22 challenge to organise a list of names, assign scores according to alphabetical value, and return a total score for the list.
This was set up as a class, and the project can be run from the command line or in text editor using
```
$ NameCalculator.new('path/to/name/file.txt').perform
```
with the file path - e.g.
```
NameCalculator.new("names.txt")
```
This returns the total score for the entire list, formatted within a string, along with the time taken to run. Other text name files can also be used instead of that supplied by the challenge.

NB: Requires gem 'pry' - this is in order to use the individual class methods such as name_scores to confirm that 'COLIN' has the score 49714 as in the file. It is not required to run the file and can be taken out if needed.

### each_count

A CodeWars challenge which required a method to be created under the class array to return a count of discrete elements, when provided with an array that could also have a method, method and block, or block. The original challenge can be found [here](https://www.codewars.com/kata/array-number-each-count/ruby).

In my solution I returned custom errors to allow the program to continue running.

When the file is run, the results for all examples given are returned.

### number (and supporting file numbergamedata.csv)

A small program containing an addition numbers game, allowing custom rounds, and recording name, time, and score in a CSV file.

NB: Requires gem 'csv' to record to the file.


### Fitzdare's Shop

A challenge to create a convenience store ruby application, containing items, codes, and prices along with a checkout system to calculate totals and apply discounts.

The full specification is contained in the folder.

### contacts and pstoretest

Small programs designed to test pstore functionality. Contacts will display a menu when run and allow contacts to be added, listed, birthdays retrieved, and to exit. pstoretest simply tests the functionality and displays the info put into the file.

NB: Requires gem 'pstore'

## Acknowledgments

* [CodeWars](https://www.codewars.com/users/marinamuttik) - my CodeWars account including the each_count challenge amongst other solutions
* [Project Euler](https://projecteuler.net/) - a collection of challenges
