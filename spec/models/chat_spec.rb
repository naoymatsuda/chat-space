require 'rails_helper'

describe Chat do
  describe '#create' do
    it "is valid with a body of chat" do
      chat = create(:chat, image: nil)
      expect(chat).to be_valid
    end
  end

  describe '#create' do
    it "is valid with a body of image" do
      chat = create(:chat, text: nil)
      expect(chat).to be_valid
    end
  end

  describe '#create' do
    it "is valid with a body of chas and image" do
      chat = create(:chat)
      expect(chat).to be_valid
    end
  end

  describe '#create' do
    it "is valid without a chat and image" do
      chat = create(:chat)
      chat.text = nil
      chat.image = nil
      chat.valid?
      expect(chat.errors[:text_or_image]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "is valid without a group_id" do
      chat = create(:chat)
      chat.group_id = nil
      chat.valid?
      expect(chat.errors[:group_id]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "is valid without a user_id" do
      chat = create(:chat)
      chat.user_id = nil
      chat.valid?
      expect(chat.errors[:user_id]).to include("can't be blank")
    end
  end

end