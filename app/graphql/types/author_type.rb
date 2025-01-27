module Types
  class AuthorType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :books, [Types::BookType], null: false
  end
end

# query {
#   authors {
#     id
#     name
#     books {
#       id
#       title
#       price
#     }
#   }
# }