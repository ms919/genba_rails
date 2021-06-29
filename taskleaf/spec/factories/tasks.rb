FactoryBot.define do
  factory :task do
    name { 'テストタスク' }
    description { 'RSpec & Capybara & FactoryBot を準備する' }
    user
  end
end