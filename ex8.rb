# creates the format that we can use multiple times
formatter = "%{first} %{second} %{third} %{fourth}"

# first variable then is set to 1 and second to 2 etc...
puts formatter % {first: 1, second: 2, third: 3, fourth: 4}
# same as above but given strings
puts formatter % {first: "one", second: "two", third: "three", fourth: "four"}
# same but set to true & false values
puts formatter % {first: true, second: false, third: true, fourth: false}
# puts the first value as the formatter on line 2, then does the same for the others
puts formatter % {first: formatter, second: formatter, third: formatter, fourth: formatter}


# longer string values are put in the formatter format
puts formatter % {
  first: "I had this thing.",
  second: "That you could type up right.",
  third: "But it didn't sing.",
  fourth: "So I said goodnight."
}
