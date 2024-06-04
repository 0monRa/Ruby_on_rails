require 'test_helper'

class CatTest < ActiveSupport::TestCase
  def setup
    @breed = Breed.create(name: "Siamese")
    @cat = Cat.new(name: "Whiskers", breed: @breed)
  end

  test "should be valid" do
    assert @cat.valid?
  end

  test "name should be present" do
    @cat.name = "  "
    assert_not @cat.valid?
  end

  test "breed should be present" do
    @cat.breed = nil
    assert_not @cat.valid?
  end

  test "path should be set before create if not present" do
    @cat.save
    assert_equal @cat.name, @cat.path
  end

  test "path should not be overridden if already set" do
    @cat.path = "custom_path"
    @cat.save
    assert_equal "custom_path", @cat.path
  end
end
