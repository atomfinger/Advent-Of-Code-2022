defmodule ReadDataset do

  def read_dataset(file_name) do
    File.stream!("datasets/#{file_name}")
  end

end
