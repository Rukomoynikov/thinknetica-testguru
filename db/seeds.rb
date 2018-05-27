User.destroy_all
Category.delete_all
Test.delete_all
Question.delete_all
Answer.delete_all

User.create([
  { name: 'John', email: 'john@mail.ru' },
  { name: 'Mary', email: 'mary@mail.ru' },
])

Category.create([
	{ title: 'html' },
	{ title: 'css' },
  { title: 'js' },
  { title: 'ruby' }
])

Test.create([
  { title: 'Ruby Language', author: User.first, category: Category.last }
])

Question.create([
  { body: 'Who author of Ruby lang?', test: Test.last },
  { body: 'Default value of instance variable?', test: Test.last }
])

Answer.create([
  { body: 'Matz', question: Question.first, correct: true },
  { body: 'Bill Gates', question: Question.first },
  { body: 'nil', question: Question.second, correct: true },
  { body: 'undefined', question: Question.second, correct: false },
])

# TestPassage.create([{ user_id: User.first.id, test_id: Test.first.id, finished: false }])
# TestPassage.create([{ user_id: User.first.id, test_id: Test.second.id, finished: true }])
# TestPassage.create([{ user_id: User.first.id, test_id: Test.third.id, finished: true }])
