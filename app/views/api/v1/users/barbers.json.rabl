collection @barbers
attributes :id, :fname, :lname

child :profile do
      attributes :id, :user_id
end

