module RoomsHelper

  def is_ready?(room)
    !room.price.blank? && !room.photos.blank? && !room.room_name.blank? && !room.address.blank?
  end
  
end
