def json_fixture(path)
  JSON.parse(file_fixture(path).read).with_indifferent_access
rescue
  JSON.parse(file_fixture(path).read)
end