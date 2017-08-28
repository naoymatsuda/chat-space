** usersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|-------|
|name|string|-------|
|mail|string|-------|
|password|string|-------|

*** association
user has_many chats
user has_many goups

** chatテーブル
|------|----|-------|
|user_id|string|-------|
|text|string|-------|
|chat_id|string|-------|
|created_at|timestamp|-------|

*** association
chat belong_to user
chat belong_to group

** groupテーブル
|------|----|-------|
|user_id|string|-------|
|name|string|-------|

*** association
group has_many users
group has_many chats
