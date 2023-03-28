module Mutations
  class CreateBook < BaseMutation
    argument :title, String, required: true
    argument :price, Float, required: true
    argument :author_id, ID, required: true

    type Types::BookType

    def resolve(title:, author_id:, price:)
      author = Author.find(author_id)
      author.books.create!(title: title, price: price)
    end
  end
end

# mutation {
#   createBook(input:{ title: "The Great Book", authorId: 1, price: 2.0 }) {
#     id
#     title
#     author {
#       name
#     }
#   }
# }
