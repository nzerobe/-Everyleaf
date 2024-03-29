require 'rails_helper'

# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)
RSpec.feature "Task management function", type: :feature do
  # In scenario (alias of it), write the processing of the test for each item you want to check.
  background do
    # Task.create!(title: 'Student', content: 'Is a good student')
    # Task.create!(title: 'Accountant', content: 'Balance money')
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
  end
  scenario "Test task list" do    
    
  # visit to tasks_path (transition to task list page)
  visit tasks_path

  # write a test to verify that the string "" testtesttest "" samplesample "is included when accessing the task list page using have_content method

  expect(page).to have_content 'Student'
  expect(page).to have_content 'Accountant'
  end

  scenario "Test task creation" do
    # 1.Write the process to visit new_task_path here
    visit new_task_path
    # 2.Write the process to fill_in (input) the contents in the input field of label name "task name" here
   
    # 3.Write the process to fill_in (input) the contents in the input column of the label name "task details" here
    fill_in 'Title', with: 'Student'
    fill_in 'Content', with: 'A good student'
    click_button '登録する'
    visit tasks_path
    expect(page).to have_content 'Student'
    expect(page).to have_content 'A good student'    
  end

  scenario "Test task details" do
    # Task.create!(title: 'Employee', content: 'Is a good student')
    visit tasks_path
    click_link 'Show'
    expect(page).to have_content 'A good student'
  end

  scenario "Test whether tasks are arranged in descending order of creation date" do
    
  end


scenario "sort in  order " do
assert Task.order('created ASC')
end

end