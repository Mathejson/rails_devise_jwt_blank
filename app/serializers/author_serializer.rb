class AuthorSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name
  has_many :books
end

#usage of serializer
# AuthorSerializer.new(author).serialized_json
# AuthorSerializer.new(authors).serialized_json
