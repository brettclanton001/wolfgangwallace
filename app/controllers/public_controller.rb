class PublicController < ApplicationController

  def home
    redirect_to music_path
  end

  def music
    @soundcloud_tracks = load_data_file :soundcloud_tracks
  end

  def videos
    @facebook_videos = load_data_file :facebook_videos
  end

  def schedule
    @scheduled_shows = load_data_file :scheduled_shows
  end

  def contact
  end

  private

  def load_data_file(name)
    ::DataFileService.load(name)
  end
end
