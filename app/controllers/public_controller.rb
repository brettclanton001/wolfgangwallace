class PublicController < ApplicationController

  def home
    redirect_to videos_path
  end

  def music
    @soundcloud_tracks = load_data_file :soundcloud_tracks
  end

  def videos
    @youtube_videos = load_data_file :youtube_videos
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
