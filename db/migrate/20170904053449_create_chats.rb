class CreateChats < ActiveRecord::Migration[5.0]
  def change
    create_table :chats do |t|
      t.string :user_id
      t.string :text
      t.string :image
      t.string :chat_id
      t.string :group_id

      t.timestamps
    end
  end
end
