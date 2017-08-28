** userテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

*** association
has_many chats
has_many goups

** chatテーブル
|------|----|-------|
|user_id|string|-------|
|text|string|null: false|
|chat_id|string|-------|
|group_id|string|-------|

*** association
belongs_to user
belongs_to group

** imageテーブル
|------|----|-------|
|user_id|string|-------|
|image|string|-------|
|chat_id|string|-------|

*** association
belongs_to chat

** groupテーブル
|------|----|-------|
|name|string|null: false|

*** association
has_many users
has_many chats

** user_groupテーブル
|------|----|-------|
|user_id|string|-------|
|group_id|string|-------|
