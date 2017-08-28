** userテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

*** association
has_many chats
has_many groups,through: :user_groups
has_many user_groups

** chatテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|string|null: false|
|text|string||
|image|string||
|chat_id|string|null: false|
|group_id|string|null: false|

*** association
belongs_to user
belongs_to group

** groupテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

*** association
has_many users,through: :user_groups
has_many user_groups

** user_groupテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|string|null: false,foreign_key: true|
|group_id|string|null: false,foreign_key: true|

*** association
belongs_to user
belongs_to group
