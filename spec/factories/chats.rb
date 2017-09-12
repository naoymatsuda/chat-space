FactoryGirl.define do
  factory :chat do
    text "aaa"
    image Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/image.jpg'))
    user_id 1
    group_id 1
  end
end