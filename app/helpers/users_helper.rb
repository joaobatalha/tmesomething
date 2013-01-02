module UsersHelper
	def increment_score(user_id)
		user = User.find(user_id)
		user.score += 1
		user.save
	end
end
