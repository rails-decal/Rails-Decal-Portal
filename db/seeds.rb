# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

## Correct Order of creation

# 1. Semester, Admins
# 2. Students, Weeks
# 3. Resources, Assignments, Attendances
# 4. Submissions, student_submissions
NUM_SEMESTER = 2
NUM_ADMIN = 5
NUM_STUDENT = 20
NUM_WEEK = 10
NUM_RESOURCE = 23
NUM_ASSIGNMENT = 8
NUM_ATTENDANCES = 70
NUM_SUBMISSIONS = 50

def make_semesters
	Semester.delete_all
	1.upto(NUM_SEMESTER) do |n|
		s = Semester.create(
			title: "Spring " + (2015 + n).to_s,
			active: n == NUM_SEMESTER,
		)
		s.id = n
		s.save
	end
end

def make_admins
	Admin.delete_all
	1.upto(NUM_ADMIN) do |n|
		a = Admin.create(
			active: true,
			email: Faker::Internet.unique.email,
			name: Faker::Name.unique.name,
			office_hours: Faker::RickAndMorty.quote,
			picture: Faker::Avatar.image,
		)
		a.id = n
		a.save
	end
end

def make_students
	Student.delete_all
	1.upto(NUM_STUDENT) do |n|
		s = Student.create(
			name: Faker::Name.unique.name,
			email: Faker::Internet.unique.email,
			picture: Faker::Avatar.image,
			semester_id: n % NUM_SEMESTER + 1,
		)
		s.semester = Semester.find(s.semester_id)
		s.id = n
		s.save
	end
end

def make_weeks
	Week.delete_all
	initial_date = Faker::Date.between(2.days.ago, Date.today)
	1.upto(NUM_WEEK) do |n|
		w = Week.create(
			date: initial_date + n.weeks,
			title: Faker::Educator.course,
			description: Faker::Friends.quote,
			week_number: n,
			semester_id: n % NUM_SEMESTER + 1,
		)
		w.semester = Semester.find(w.semester_id)
		w.id = n
		w.save
	end
end

def make_resources
	Resource.delete_all
	1.upto(NUM_RESOURCE) do |n|
		r = Resource.create(
			link: "https://" + Faker::Internet.domain_word + "." + Faker::Internet.domain_suffix,
			title: ["Lecture", "Demo", "Reading"].sample,
			description: Faker::Hipster.sentences(2),
			week_id: n % NUM_WEEK + 1,
		)
		r.week = Week.find(r.week_id)
		r.id = n
		r.save
	end
end

def make_assignments
	Assignment.delete_all
	1.upto(NUM_ASSIGNMENT) do |n|
		a = Assignment.create(
			title: Faker::Hipster.sentence(3),
			description: Faker::Hipster.paragraph,
			link: "https://" + Faker::Internet.domain_word + "." + Faker::Internet.domain_suffix,
			week_id: n % NUM_WEEK + 1,
			points: 5,
		)
		a.week = Week.find(a.week_id)
		a.due_date = a.week.date + 5.days
		a.id = n
		a.save
	end
end

def make_attendances
	Attendance.delete_all
	1.upto(NUM_ATTENDANCES) do |n|
		a = Attendance.create(
			status: n % 4,
			comment: Faker::Hipster.paragraph,
			week_id: n % NUM_WEEK + 1,
			student_id: n % NUM_STUDENT + 1,
		)
		a.week = Week.find(a.week_id)
		a.student = Student.find(a.student_id)
		a.id = n
		a.save
	end
end

def make_submissions
	Submission.delete_all
	1.upto(NUM_SUBMISSIONS) do |n|
		s = Submission.create(
			score: [n % 6, nil].sample,
			assignment_id: n % NUM_ASSIGNMENT + 1,
			admin_id: n % NUM_ADMIN + 1,
		)
		s.admin = Admin.find(s.admin_id)
		s.assignment = Assignment.find(s.assignment_id)
		s.date = s.assignment.week.date + (n % 7).days
		s.graded = s.score != nil
		s.comment = s.graded ? Faker::Hipster.paragraph : nil
		s.id = n
		s.save
	end
end

# Currently assuming no group projects
def make_student_submissions
	StudentSubmission.delete_all
	1.upto(NUM_SUBMISSIONS) do |n|
		s = StudentSubmission.create(
			student_id: n % NUM_STUDENT + 1,
			submission_id: n % NUM_SUBMISSIONS + 1,
		)
		s.student = Student.find(s.student_id)
		s.submission = Submission.find(s.submission_id)
		s.id = n
		s.save
	end
end

# 1. Semester, Admins
# 2. Students, Weeks
# 3. Resources, Assignments, Attendances
# 4. Submissions, student_submissions
make_semesters
make_admins
make_students
make_weeks
make_resources
make_assignments
make_attendances
make_submissions
make_student_submissions


