module RoomsHelper

  def is_ready?(room)
    if !room.price.blank? && !room.photos.blank? && !room.room_name.blank? && !room.address.blank?
      return true
    end
  end
  
end
