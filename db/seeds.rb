# db/seeds.rb

# Students
User.create!(
  email: 'student1@nitk.edu.in',
  password: 'password123',
  name: 'Student One',
  roll_number: '221NITK001',
  role: 'student'
)

User.create!(
  email: 'student2@nitk.edu.in',
  password: 'password123',
  name: 'Student Two',
  roll_number: '221NITK002',
  role: 'student'
)

User.create!(
  email: 'student3@nitk.edu.in',
  password: 'password123',
  name: 'Student Three',
  roll_number: '221NITK003',
  role: 'student'
)

User.create!(
  email: 'student4@example.com',
  password: 'password123',
  name: 'Student Four',
  roll_number: '221NITK004',
  role: 'student'
)

User.create!(
  email: 'student5@example.com',
  password: 'password123',
  name: 'Student Five',
  roll_number: '221NITK005',
  role: 'student'
)

# Conveners
User.create!(
  email: 'convener1@example.com',
  password: 'password123',
  name: 'Convener One',
  roll_number: '221NITK101',
  role: 'convener'
)

User.create!(
  email: 'convener2@example.com',
  password: 'password123',
  name: 'Convener Two',
  roll_number: '221NITK102',
  role: 'convener'
)

User.create!(
  email: 'convener3@example.com',
  password: 'password123',
  name: 'Convener Three',
  roll_number: '221NITK103',
  role: 'convener'
)

User.create!(
  email: 'convener4@example.com',
  password: 'password123',
  name: 'Convener Four',
  roll_number: '221NITK104',
  role: 'convener'
)

User.create!(
  email: 'convener5@example.com',
  password: 'password123',
  name: 'Convener Five',
  roll_number: '221NITK105',
  role: 'convener'
)
