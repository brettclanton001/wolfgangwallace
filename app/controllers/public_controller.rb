class PublicController < ApplicationController

  def home
    redirect_to music_path
  end

  def music
    @distrokid_releases = load_data_file :distrokid_releases
  end

  def videos
    @youtube_videos = load_data_file :youtube_videos
  end

  def shows
    @scheduled_shows = Show.where("date > ?", Date.yesterday).order("date ASC")
  end

  def press
    @press_articles = load_data_file :press_articles
  end

  def contact
  end

  private

  def load_data_file(name)
    ::DataFileService.load(name)
  end
end
