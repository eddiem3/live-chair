options = ["Fades", "Designer", "Eyebrows", "Beards", "Shaves", "Line-ups"]
options.map do |option|
  SkillList.find_or_create_by(skill: option)
end
