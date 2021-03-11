# Table Design

## users table

| Column          | Type    | Options     |
| --------        | ------  | ----------- |
| name            | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| favorite_sports | text    | null: false |
| age             | integer | null: false |
| tag             | string  | null: false |

### Association

- has_many :room_users
- has_many :rooms, through: room_users
- has_many :messages
- has_many :tags, through: tag_users
- has_many :tag_users
- has_many :posts
- has_many :comments


## rooms table

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many   :room_users
- has_many   :users, through: room_users
- has_many   :messages
- belongs_to :tag


## room_users table

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user


## messages table

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user


## Tags table

| Column | Type       | Options                        |
| ------ | ------     | -----------                    |
| name   | string     | null: false                    |
| post   | references | null: false, foreign_key: true |

### Association

- has_one :room
- has_many :users, through: tag_users
- has_many :tag_users
- has_many :posts, through: tag_posts
- has_many :tag_posts


## tag_users table

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| tag    | references | null: false, foreign_key: true |

### Association

- belongs_to :tag
- belongs_to :user


## tag_posts table

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| post   | references | null: false, foreign_key: true |
| tag    | references | null: false, foreign_key: true |

### Association

- belongs_to :tag
- belongs_to :post

## Posts Table

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| title   | string     | null: false                    |
| concept | text       | null: false                    |
| user    | references | null: false, foreign_key: true |

### Association

- has_many :tags, through :tag_posts
- has_many :tag_posts
- belongs_to :user
- has_many :comments


## comments table

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | string     | null: false                    |
| post    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :post
- belongs_to :user
