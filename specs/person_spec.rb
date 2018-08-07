require("minitest/autorun")
require("minitest/rg")
require_relative("../person.rb")

class PersonTest < MiniTest::Test

  def test_person_has_name
    p1 = Person.new("Bob", 25)
    assert_equal("Bob", p1.name)
  end

  def test_person_has_age
    p1 = Person.new("Bob", 25)
    assert_equal(25, p1.age)
  end

end
