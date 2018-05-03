ACTIVE RECORD:

-- To find today's task that are due today:
Task.where(:due_date => ["due_date IN (?)", ('2018-05-03 00:00:00').. ('2018-05-03 23:59:59')]).where.not(due_date: [nil,""])

Task.where("due_date > ? AND due_date < ?", Time.now, Time.now + 1.day)

Task.left_outer_joins(:comments).pluck('tasks.title, comments.content AS c_name')

Owner.group(:name).left_outer_joins(:credit_cards).where(name:'George').pluck('owners.name, sum(credit_cards.limit) AS total_limit')

Owner.group(:name).left_outer_joins(:credit_cards).where(name:'George').pluck('owners.name, sum(credit_cards.limit) AS total_limit')
