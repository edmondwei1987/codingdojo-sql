select users.first_name,users.last_name,
users2.first_name as friend_first_name,
users2.last_name as friend_last_name
from users
left join friendships on users.id=friendships.user_id
left join users as users2 on friendships.friend_id=users2.id
order by friend_last_name 