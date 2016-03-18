require "pry"

# Runs all password verification methods to check for a valid password
#
# +password: string representing the password to be verified
#
# Returns true if the password passes all the method checks, false if it fails
def valid_password?(password)
  at_least_one_caps?(password) &&
  at_least_eight_characters?(password) &&
  at_least_one_lower_case?(password) &&
  at_least_one_number?(password) &&
  at_least_one_non_alpha_numeric?(password) &&
  check_for_password_string?(password)
end

# Tests to see if a string has at least one capital letter
#
# +password: string representing the password to be verified
#
# Returns true or false depending on if the string has at least one capital
def at_least_one_caps?(password)
  letters = password.gsub(/[^A-Z]/,"")
  letters.length != 0
end

# Tests to see if a string has 8 or more characters
#
# +password: string representing the password to be verified
#
# Returns true or false depending on if the string 8 or more characters
def at_least_eight_characters?(password)
  password.length >= 8
end

# Tests to see if a string has at least one lower case character
#
# +password: string representing the password to be verified
#
# Returns true or false depending on if the string has one or more lower case character
def at_least_one_lower_case?(password)
  letters = password.gsub(/[^a-z]/,"")
  letters.length != 0
end

# Tests to see if a string has at least one number
#
# +password: string representing the password to be verified
#
# Returns true or false depending on if the string has one or more numbers
def at_least_one_number?(password)
  numbers = password.gsub(/[^0-9]/,"")
  numbers.length != 0
end

# Tests to see if a string has at least one non-alpha-numeric character
#
# +password: string representing the password to be verified
#
# Returns true or false depending on if the string at least one non-alpha-numeric character
def at_least_one_non_alpha_numeric?(password)
  characters = password.gsub(/[A-Za-z0-9]/,"")
  characters.length != 0
end

# Tests to see if a string contains 'password' in any combination of capitalization
#
# +password: string representing the password to be verified
#
# Returns true or false depending on if the string contains 'password' in any
# combination of capitalization
def check_for_password_string?(password)
  !password.downcase.include?("password")
end
