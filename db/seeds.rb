# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

Question.destroy_all
User.destroy_all
Tag.destroy_all
QuestionTag.destroy_all
User.create(username: 'user1', email: 'u1@mail.ru', password: '123', id: 1001, color: 'black')
User.create(username: 'user2', email: 'u2@mail.ru', password: '123', id: 1002, color: 'purple')
User.create(username: 'user3', email: 'u3@mail.ru', password: '123', id: 1003)
User.create(username: 'user4', email: 'u4@mail.ru', password: '123', id: 1004, color: 'blue')
User.create(username: 'user5', email: 'u5@mail.ru', password: '123', id: 1005)
User.create(username: 'user6', email: 'u6@mail.ru', password: '123', id: 1006)
User.create(username: 'user7', email: 'u7@mail.ru', password: '123', id: 1007)
User.create(username: 'user8', email: 'u8@mail.ru', password: '123', id: 1008, color: 'red')
User.create(username: 'user9', email: 'u9@mail.ru', password: '123', id: 1009)
Question.create(id: 1001, text: 'It is number 1', created_at: Date.parse('27.03.2016'), answer: 'Answer 1', user_id: 1001, author_id: 1005)
Question.create(id: 1002, text: 'It is number 2', created_at: Date.parse('27.03.2016'), answer: 'Answer 2', user_id: 1001, author_id: 1002)
Question.create(id: 1003, text: 'It is number 3', created_at: Date.parse('27.03.2016'), answer: 'Answer 3', user_id: 1002, author_id: 1006)
Question.create(id: 1004, text: 'It is number 4', created_at: Date.parse('27.03.2016'), answer: 'Answer 4', user_id: 1002, author_id: 1006)
Question.create(id: 1005, text: 'It is number 5', created_at: Date.parse('27.03.2016'), answer: 'Answer 5', user_id: 1002, author_id: 1009)
Question.create(id: 1006, text: 'It is number 6', created_at: Date.parse('27.03.2016'), answer: 'Answer 6', user_id: 1002, author_id: 1003)
Question.create(id: 1007, text: 'It is number 7', created_at: Date.parse('27.03.2016'), answer: 'Answer 7', user_id: 1006, author_id: 1003)
Question.create(id: 1008, text: 'It is number 8', created_at: Date.parse('27.03.2016'), answer: 'Answer 8', user_id: 1006)
Question.create(id: 1009, text: 'It is number 9', created_at: Date.parse('27.03.2016'), answer: 'Answer 9', user_id: 1007)
