require "test_helper"

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save Task without task_name" do
    task = Task.new
    task.task_name = nil
    task.task_body = 'Camera to-dos'

    assert_not task.save
  end

  test "should not save Task without task_body" do
    task = Task.new
    task.task_name = 'Cameras'
    task.task_body = nil

    assert_not task.save
  end

end
