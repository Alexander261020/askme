# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

Question.destroy_all
User.destroy_all
User.create(username: 'user1', email: 'u1@mail.ru', password: '123', id: 101, color: 'black')
User.create(username: 'user2', email: 'u2@mail.ru', password: '123', id: 102, color: 'purple')
User.create(username: 'user3', email: 'u3@mail.ru', password: '123', id: 103)
User.create(username: 'user4', email: 'u4@mail.ru', password: '123', id: 104, color: 'blue')
User.create(username: 'user5', email: 'u5@mail.ru', password: '123', id: 105)
User.create(username: 'user6', email: 'u6@mail.ru', password: '123', id: 106)
User.create(username: 'user7', email: 'u7@mail.ru', password: '123', id: 107)
User.create(username: 'user8', email: 'u8@mail.ru', password: '123', id: 108, color: 'red')
User.create(username: 'user9', email: 'u9@mail.ru', password: '123', id: 109)
Question.create(id: 101, text: 'It is number 1', created_at: Date.parse('27.03.2016'), answer: 'Answer 1', user_id: 101, author_id: 105)
Question.create(id: 102, text: 'It is number 2', created_at: Date.parse('27.03.2016'), answer: 'Answer 2', user_id: 101, author_id: 102)
Question.create(id: 103, text: 'It is number 3', created_at: Date.parse('27.03.2016'), answer: 'Answer 3', user_id: 102, author_id: 106)
Question.create(id: 104, text: 'It is number 4', created_at: Date.parse('27.03.2016'), answer: 'Answer 4', user_id: 102, author_id: 106)
Question.create(id: 105, text: 'It is number 5', created_at: Date.parse('27.03.2016'), answer: 'Answer 5', user_id: 102, author_id: 109)
Question.create(id: 106, text: 'It is number 6', created_at: Date.parse('27.03.2016'), answer: 'Answer 6', user_id: 102, author_id: 103)
Question.create(id: 107, text: 'It is number 7', created_at: Date.parse('27.03.2016'), answer: 'Answer 7', user_id: 106, author_id: 103)
Question.create(id: 108, text: 'It is number 8', created_at: Date.parse('27.03.2016'), answer: 'Answer 8', user_id: 106)
Question.create(id: 109, text: 'It is number 9', created_at: Date.parse('27.03.2016'), answer: 'Answer 9', user_id: 107)
