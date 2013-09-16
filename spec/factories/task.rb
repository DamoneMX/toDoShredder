FactoryGirl.define do
  factory :task do
    name "Sample Task"
    notes "Simple Notes"
    user
  end
end
