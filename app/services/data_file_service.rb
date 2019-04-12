module DataFileService
  extend self

  def load(name)
    file_path = File.join(Rails.root, 'data_files', "#{name}.yml")
    file = File.read(file_path)
    YAML.load(file)
  end
end
