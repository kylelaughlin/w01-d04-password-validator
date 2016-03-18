require "test_helper"
require_relative "../lib/password_validator.rb"

class PasswordValidatorTest < Minitest::Test
  # We'll try a password with all-lower-case-letters
  def test_rejects_all_lower_case_passwords
    result = at_least_one_caps?("1abjils&a")
    refute(result, "'1abjils&a' should be invalid because it contains no caps")
    #assert(result == false, ".same message as above")
  end

  # We try a password with a valid mix of upper and lower-case characters
  def test_accepts_mixed_case_passwords
    result = at_least_one_caps?("1Abjils&a")
    assert(result, "'1Abjils&a' should be valid because it is mixed case")
  end

  # We try a password of 8 characters, expecting success
  def test_accepts_password_of_8_characters
    result = at_least_eight_characters?("1Abjils&")
    assert(result, "'1ABjils&' has 8 characters, should be valid")
  end

  # We try a password of only 7 characters, expecting rejection
  def test_rejects_password_of_7_characters
    result = at_least_eight_characters?("1Abils&")
    refute(result, "'1ABils&' has 8 characters, should be valid")
  end

  def test_valid_password
    result = valid_password?("1Abjils&a")
    assert(result, "'1Abijls&a' should be valid")
  end

  def test_rejects_all_uppercase_passwords
    result = at_least_one_lower_case?("1ABJILS&A")
    refute(result, "'1ABJILS&A' should be invalid becuase it contains no lowercase")
  end

  def test_accepts_mixed_case_passwords_lowercase
    result = at_least_one_lower_case?("1AbJILS&A")
    assert(result, "'1AbJILS&A' should be valid becuase it is mixed case")
  end

  def test_rejects_no_number_password
    result = at_least_one_number?("Abjils&A")
    refute(result, "'Abjils&A' should be invalid becuase it does not contain a number")
  end

  def test_accepts_password_with_a_number
    result = at_least_one_number?("1Abjils&A")
    assert(result, "'1Abjils&A' should be valid becuase it contains at least one number")
  end

  def test_rejects_no_non_alpha_numeric_chars
    result = at_least_one_non_alpha_numeric?("1AbjilsA")
    refute(result, "'1AbjilsA' should be invalid becuase it does not contain any non-alpha-numeric chars")
  end

  def test_accepts_password_with_a_non_alpha_numeric_chars
    result = at_least_one_non_alpha_numeric?("1Abjils&A")
    assert(result, "'1Abjils&A' should be valid becuase it does contain at least one non-alpha-numeric chars")
  end

  def test_reject_password_with_password_included
    result = check_for_password_string?("pAssWord1Abjils&A")
    refute(result, "'pAssWord1Abjils&A' should be invalid becuase it contains the string 'password'")
  end

  def test_accepts_password_does_not_contain_password
    result = check_for_password_string?("1Abjils&A")
    assert(result, "'1Abjils&A' should be valid becuase it does not contain password")
  end

  def test_accepts_valid_password
    result = valid_password?("1Abjils&A")
    assert(result, "'1Abjils&A' should be valid becuase if follows all the password requirements")
  end

  def test_reject_password_no_uppercase
    result = valid_password?("1abjils&a")
    refute(result, "'1abjils&a' should be invalid becuase it does not have a capital letter")
  end
  



end
