require 'test_helper'

class BreedTest < ActiveSupport::TestCase
  def setup
    @breed = Breed.new(name: "Siamese")
  end

  test "should be valid" do
    assert @breed.valid?
  end

  test "name should be present" do
    @breed.name = "  "
    assert_not @breed.valid?
  end

  test "path should be set before create if not present" do
    @breed.save
    assert_equal @breed.name, @breed.path
  end

  test "path should not be overridden if already set" do
    @breed.path = "custom_path"
    @breed.save
    assert_equal "custom_path", @breed.path
  end
end
