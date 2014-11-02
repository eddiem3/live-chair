child :reviews do
  attributes :comment, :rating, :user_id
end

collection @profile
attributes :id, :shop_name, :phone, :address, :avatar, :state, :city, :zip
