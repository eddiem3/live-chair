collection @barbers
attributes :id, :fname, :lname

child :profile do
      attributes :id, :avatar, :shop_name, :address, :state, :city, :zip, :phone, :skill_list_ids
end

