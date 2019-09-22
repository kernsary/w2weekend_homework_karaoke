class Room

  attr_reader :name, :capacity

  def initialize(name, capacity, drinks)

    @name = name
    @capacity = capacity
    @drinks = drinks
    @room_songs = []
    @room_guests = []

  end

  def get_drinks
    return @drinks    
  end

  def get_songs
    return @room_songs
  end

  def get_guests
    return @room_guests
  end

  def add_song(song)
    @room_songs.push(song)
  end

  def check_guest_in(guest)
    @room_guests.push(guest)
  end

  def check_guest_out(guest)
    @room_guests.delete(guest)
  end

  def at_capacity?
    return get_guests.count >= @capacity
  end

  def reset_room
    @room_songs = []
    @room_guests = []
  end

  def fav_songs_response
    song_titles = @room_songs.map{|song| song.title}
    @room_guests.each do |guest|
      if song_titles.include?(guest.fav_song)
        guest.guest_cheers
      end
    end
  end

end
