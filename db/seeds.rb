Category.create([
	{ title: 'html' },
	{ title: 'css' },
	{ title: 'js' }
])

Test.create([
	{ title: 'HTML LEVEL 1', level: 1, category_id: 1 },
	{ title: 'HTML LEVEL 2', level: 2, category_id: 1 },
	{ title: 'HTML LEVEL 3', level: 3, category_id: 1 },
	{ title: 'CSS LEVEL 1', level: 1, category_id: 2 },
	{ title: 'CSS LEVEL 2', level: 2, category_id: 2 },
	{ title: 'CSS LEVEL 3', level: 3, category_id: 2 },
	{ title: 'JS LEVEL 1', level: 1, category_id: 3 },
	{ title: 'JS LEVEL 2', level: 2, category_id: 3 },
	{ title: 'JS LEVEL 3', level: 3, category_id: 3 }
])

Question.create([
	{ body: 'Tag of Header ?', test_id: 1 },
	{ body: 'Tag of Header ?', test_id: 2 },	
	{ body: 'Tag of Header ?', test_id: 3 },	
	{ body: 'Tag of Header ?', test_id: 4 },	
	{ body: 'Tag of Header ?', test_id: 5 },	
	{ body: 'Tag of Header ?', test_id: 6 },	
	{ body: 'Tag of Header ?', test_id: 7 },		
	{ body: 'Tag of Header ?', test_id: 8 },		
	{ body: 'Tag of Header ?', test_id: 9 }
])

User.create([
	{ name: 'John' },
	{ name: 'Mary' }
])

Result.create([{ user_id: 1, test_id: 1 }])
