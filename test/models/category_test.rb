require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save Category without category_name" do
    category = Category.new
    category.category_name = nil
    category.category_body = 'Camera to-dos'

    assert_not category.save
  end

  test "should not save Category without category_body" do
    category = Category.new
    category.category_name = 'Cameras'
    category.category_body = nil

    assert_not category.save
  end
  
end
