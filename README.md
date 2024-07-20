# Mastermind

This is my implementation of the [Mastermind](https://www.theodinproject.com/lessons/ruby-mastermind) project assigned in the [OOP Basics](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby#object-oriented-programming-basics) section of the [Ruby Course](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby) which is part of the [Full Stack Ruby on Rails](https://www.theodinproject.com/paths/full-stack-ruby-on-rails) curriculum from the [The Odin Project](https://www.theodinproject.com).

## Project Description

This simple Ruby application is a mastermind game which is played by running `ruby main.rb` in the console. It is a single player game against the cpu in which the player can have the role of the `code maker` or `code breaker`. There are `6` different number-to-color combinations to choose from when creating a code:
* `1` maps to `red`
* `2` maps to `green`
* `3` maps to `yellow`
* `4` maps to `blue`
* `5` maps to `magenta`
* `6` maps to `cyan`

The `code maker` will choose `4` of these number-to-color combinations to create a `secret code` (e.g. `1,1,3,6`). Note that there can be more than one of the same number-to-color combination in a single code. In order to win, the `code breaker` must guess the secret code in `12` turns or less. After each guess, the `code breaker` will be given a set of up to `4` `red` or `white` clues:
* A `red` clue means the code breaker selected the right number-to-color combination and placed it in the right spot
* A `white` clue means the code breaker selected the right number-to-color combination but placed it in the wrong spot

To continue the above example, using the secret code `1,1,3,6`, a guess of `1,3,2,6` would yield these clues:
* A `red` clue because the `1` is in the correct spot
* A `red` clue because the `6` is in the correct spot
* A `white` clue because the `3` is in the wrong spot

## Skills Applied

The goal of this project was to apply everything learned in the [OOP Basics](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby#object-oriented-programming-basics) section of the [Ruby Course](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby). There are many ways in which these concepts could be applied on a practical project such as this, but my implementation specifically applied the following:
* Creating several classes
    * `MastermindGame` runs the main game loop, has instances of `CodeBreaker` and `CodeMaker`, and detects game over conditions
    * `CodeMaker` has an instance of `Code` which is the secret code and gives clues after every code guess
    * `CodeBreaker` gets user input code guess each turn
    * `Code` represents a code and compares a code guess to the secret code to generate exact (`red`) or partial (`white`) match clues
* Creating a `GameIO` module with utility methods used to get user input or display output via the console

## Retrospective

While my implementation of the [Mastermind](https://www.theodinproject.com/lessons/ruby-mastermind) project meets the minimum requirements, there are still some areas which I feel could be significantly improved.

#### Object-Oriented Design

I found myself struggling to get started with this project just trying to think about how I would code this in an object-oriented way. While I think that the classes I created in this project do capture the main objects that would be needed to code a mastermind game, I also understand that the state and behavior of each class would probably look a lot different if a more seasoned programmer were to implement this from scratch.

Clearly, I still have a lot to learn about object-oriented system design in terms of developing a better feel for modeling object relationships and interactions. As with many things, this is something that will need to be studied, practiced, and improved on iteratively.

#### Ruby

There are still a lot of "Ruby-isms" that I am trying to drill into my head. The Ruby way of doing things is a bit different than what I am used to doing in languages such as JavaScript and Java. I do like how there seems to be a "Ruby way" of doing specific things, which makes it simpler for someone like me who is still learning because it removes a lot of the guess work that comes with developing a natural feel for doing things in a new language. Regardless, I still feel like there are many instances where I am not doing things the Ruby way and perhaps the remedy is just a matter of studying more Ruby code written by people who have more experience than I do.

#### Project Extensions

One area where I feel I could significantly improve the project, outside of the OOD aspect, is with the cpu intelligence when it is the code breaker. As the project currently stands, the cpu will simply generate a random guess each turn without consideration for the clues given. Due to this implementation, it is very unlikely that the cpu will ever guess the code within the 12 turns. Perhaps some day I will revisit this and improve my solution.