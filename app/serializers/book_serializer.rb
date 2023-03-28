class BookSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :title, :price
  belongs_to :author
end

#usage of serializer
# BookSerializer.new(book).serialized_json
# BookSerializer.new(books).serialized_json