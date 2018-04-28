Category.create([
	{ title: 'html' },
	{ title: 'css' },
	{ title: 'js' }
])

Test.create([
	{ title: 'HTML LEVEL 1', level: 1, category_id: Category.first.id },
	{ title: 'HTML LEVEL 2', level: 2, category_id: Category.first.id },
	{ title: 'HTML LEVEL 3', level: 3, category_id: Category.first.id },
	{ title: 'CSS LEVEL 1', level: 1, category_id: Category.second.id },
	{ title: 'CSS LEVEL 2', level: 2, category_id: Category.second.id },
	{ title: 'CSS LEVEL 3', level: 3, category_id: Category.second.id },
	{ title: 'JS LEVEL 1', level: 1, category_id: Category.third.id },
	{ title: 'JS LEVEL 2', level: 2, category_id: Category.third.id },
	{ title: 'JS LEVEL 3', level: 3, category_id: Category.third.id }
])

Question.create([
	{ body: 'Tag of Header ?', test_id: Test.find(1).id },
	{ body: 'Tag of Header ?', test_id: Test.find(2).id },	
	{ body: 'Tag of Header ?', test_id: Test.find(3).id },	
	{ body: 'Tag of Header ?', test_id: Test.find(4).id },	
	{ body: 'Tag of Header ?', test_id: Test.find(5).id },	
	{ body: 'Tag of Header ?', test_id: Test.find(6).id },	
	{ body: 'Tag of Header ?', test_id: Test.find(7).id },		
	{ body: 'Tag of Header ?', test_id: Test.find(8).id },		
	{ body: 'Tag of Header ?', test_id: Test.find(9).id }
])

User.create([
	{ name: 'John' },
	{ name: 'Mary' }
])

Result.create([{ user_id: User.first.id, test_id: Test.first.id }])
