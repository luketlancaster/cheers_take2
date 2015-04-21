# cheers_take2
The Ruby cheers exercise (see: luketlancaster/cheers), this time 3 weeks into learning Ruby, with tests.

## Instructions
(What we're supposed to do)

## Specifications, for non-interactive version of cheers

### Help Usage

Run the program by running `/.cheers.rb`

The program will print out:

> I'd cheer for you, if onlu I knew who you were :\

> Try again with `./cheers.rb [Name] [MM/DD Birthday]`

### Regular Usage

Run the program by running `./cheers.rb Luke 03/15`

The first argument is the user's name. The seconds argument is the
user's birthday.

The proogram outputs a cheer in the following format:

> Give me a... L

> Give me an... U

> Give me a... K

> Give me an... E

> Luke’s just GRAND!


* Follow the proper grammatial for "a" and "an". The rule is based on
  weather the spelling of a letter would begin with a vowel.
* Ignore all special characters (i.e. non-word characters) when
  printing the cheer
* Print the user's name as it was originally input for final cheer


After printing the cheer, the program outputs the number of days
until the user's birthday:

> Awesome! Your birthday is in 132 days! Happy birthday in advance!

If there was no input for birthday, the program instead says:

> I would wish you a Happy Birthday if I knew when that was!

* If there was input that couldn't be parsed, the program says:

> I couldn't understand that. Could you give that to me in mm/dd format next time?


## Specifications, for interactive version of cheers

Start the program by running `./cheers.rb`

The program should ask:

> Hello, what is your name?

The user types in their name, for example:

> Luke

The proogram outputs a cheer in the following format:

> Give me a... L

> Give me an... U

> Give me a... K

> Give me an... E

> Luke’s just GRAND!

* If there was no input, ask again unitl valid input is provided
* Follow the proper grammatial for "a" and "an". The rule is based on
  weather the spelling of a letter would begin with a vowel.
* Ignore all special characters (i.e. non-word characters) when
  printing the cheer
* Print the user's name as it was originally input for final cheer

After printing out ther user's cheer, the program asks:

> Hey, Luke, what's your birthday? (mm/dd)

The user types in their birthdate

> 03/15

* If there was no input, asks again until valid input is provided
* If there was input that couldn't be parsed, the program tries
  again, but with the prompt:

> I couldn't understand that. Could you give that to me in mm/dd
> format?

The program then outputs the number of days until the user's birthday

> Awesome! Your birthday is in 132 days! Happy birthday in advance!
