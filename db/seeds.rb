options = ["Regular Haircut", "Fade Haircut", "Fade Haircut w/ Beard/Mustche", "Regular Haircut w/ Beard/Mustche", "Bush Haircut", "Bush Haircut w/ Beard/Mustache", "Bald Head w/ Steam Towel", "Bald Head w/ Beard/Mustache", "Shape up", "Haircut w/ Bigen", "Mustache/ Beard w/ Bigen", "Specialty Haircut", "Haircut with Design"]
options.map do |option|
  SkillList.find_or_create_by(skill: option)
end
