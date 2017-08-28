** userテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

*** association
has_many chats
has_many groups,through: :user_groups

** chatテーブル
|------|----|-------|
|user_id|string|-------|
|text|string|null: false|
|image|string|-------|
|chat_id|string|-------|
|group_id|string|-------|

*** association
belongs_to user
belongs_to group

** groupテーブル
|------|----|-------|
|name|string|null: false, unique: true|

*** association
has_many users,through: :user_groups
has_many chats

** user_groupテーブル
|------|----|-------|
|user_id|string|-------|
|group_id|string|-------|

*** association
belongs_to user
belongs_to group
