# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# Character.create(name: 'Luke', movie: movies.first)
categories = Category.create([
  { name: "History"},
  { name: "Politics"},
  { name: "Current Affairs"},
  { name: "Sports"},
  { name: "Economics"}
])

# questions = Question.create([ 
#   { 
#     title: "Who among the following introduced the subsidiary alliance system in India?",
#     answer: "Lord Wellesley", 
#     category_id: 1
#   },
#   { 
#     title: "Who among the following signed the Treaty of Bassein in 1802 with the British East India Company ?",
#     answer: "Baji Rao II", 
#     category_id: 1
#   },
#   { 
#     title: "Which among the following was the first municipal corporation set up in India in the year 1687 ?",
#     answer: "Madras Municipal Corporation", 
#     category_id: 1
#   },
#   { 
#     title: "Which among the following events took place immediately before the massacre at Jallianwalla Bagh?",
#     answer: "Passage of the Rowlatt Act", 
#     category_id: 1
#   },
#   { 
#     title: "In 1953, under whose chairmanship was the first OBC Commission formed ?",
#     answer: "Kaka Kalelkar", 
#     category_id: 2
#   },
#   { 
#     title: "Which among the following books was authored by Mahatma Gandhi?",
#     answer: "Hind Swaraj",
#     category_id: 2
#   },
#   { 
#     title: " In which year, first census was conducted in India ?",
#     answer: "1872",
#     category_id: 2
#   },
#   { 
#     title: "Martyrdom of Chandrashekhar Azad took place on which among the following dates?",
#     answer: "February 17, 1931",
#     category_id: 3
#   },
#   { 
#     title: "In which of the following languages was the Ghadar Journal was first published ?",
#     answer: "Urdu",
#     category_id: 3
#   },
#   { 
#     title: "Springing Tiger: A Study of a Revolutionary” is a biographical work on __?",
#     answer: "Subhas Chandra Bose",
#     category_id: 4
#   },
#   { 
#     title: "The first Indian woman to preside a session of Indian National Congress was__?",
#     answer: "Sarojini Naidu",
#     category_id: 4
#   },        
#   { 
#     title: "The Congress and Muslim League had most cordial relationships in between which among the following years?",
#     answer: "1916 to 1922",
#     category_id: 5
#   },
#   { 
#     title: "Kumaran Asan is associated with the social renaissance in which among the following current states?",
#     answer: "Kerala",
#     category_id: 5
#   },
#   { 
#     title: "Which among the following regions was most affected by the Revolution of 1857 ?",
#     answer: "Avadh",
#     category_id: 5
#   },
#   { 
#     title: "Mahalwari System of Revenue Settlement was introduced in which of the following?",
#     answer: "North Western Provinces",
#     category_id: 3
#   },
#   { title: "On which among the following dates, Jallianwala Bagh Massacre took place ?",
#     answer: "April 13,1919",
#     category_id: 4
#   },
# ])
