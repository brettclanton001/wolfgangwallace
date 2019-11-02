class PublicController < ApplicationController

  def home
    redirect_to videos_path
  end

  def music
    @soundcloud_tracks = load_data_file :soundcloud_tracks
  end

  # Temp page
  def murder
    @soundcloud_tracks = load_data_file :murder_soundcloud_tracks
  end

  def videos
    @youtube_videos = load_data_file :youtube_videos
  end

  def shows
    @scheduled_shows = Show.where("date > ?", Date.yesterday).order("date ASC")
  end

  def contact
  end

  private

  def load_data_file(name)
    ::DataFileService.load(name)
  end
end
