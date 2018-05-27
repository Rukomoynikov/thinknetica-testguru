User.destroy_all
Category.destroy_all
Test.destroy_all
Question.destroy_all
Answer.destroy_all

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
	{ title: 'HTML LEVEL 1', level: 1, category_id: Category.first.id, author_id: User.first.id },
	{ title: 'HTML LEVEL 2', level: 2, category_id: Category.first.id, author_id: User.first.id },
	{ title: 'HTML LEVEL 3', level: 3, category_id: Category.first.id, author_id: User.first.id },
	{ title: 'CSS LEVEL 1', level: 1, category_id: Category.second.id, author_id: User.first.id },
	{ title: 'CSS LEVEL 2', level: 2, category_id: Category.second.id, author_id: User.first.id },
	{ title: 'CSS LEVEL 3', level: 3, category_id: Category.second.id, author_id: User.first.id },
	{ title: 'JS LEVEL 1', level: 1, category_id: Category.third.id, author_id: User.first.id },
	{ title: 'JS LEVEL 2', level: 2, category_id: Category.third.id, author_id: User.first.id },
  { title: 'JS LEVEL 3', level: 3, category_id: Category.third.id, author_id: User.first.id },
  { title: 'Ruby Language', author: User.first, category: Category.last }
])

Question.create([
  { body: 'Who author of Ruby lang?', test: Test.last },
  { body: 'Default value of instance variable?', test: Test.last }
])

Answer.create([
  { body: 'Yes', question_id: Question.first.id },
  { body: 'No', question_id: Question.first.id },
  { body: 'Maybe', question_id: Question.first.id },
  { body: 'Correct', question_id: Question.first.id, correct: true },
  { body: 'Matz', question: Question.first, correct: true },
  { body: 'Bill Gates', question: Question.first, correct: false },
  { body: 'nil', question: Question.last, correct: true },
  { body: 'undefined', question: Question.last, correct: false },
])

# TestPassage.create([{ user_id: User.first.id, test_id: Test.first.id, finished: false }])
# TestPassage.create([{ user_id: User.first.id, test_id: Test.second.id, finished: true }])
# TestPassage.create([{ user_id: User.first.id, test_id: Test.third.id, finished: true }])
