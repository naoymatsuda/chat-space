FactoryGirl.define do
  factory :group do
  	id 1
  	name Faker::Lorem.sentence
  	created_at Faker::Time.between(2.days.ago, Time.now, :all)
  	updated_at Faker::Time.between(2.days.ago, Time.now, :all)
  end
end