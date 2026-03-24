# Categories
fiction = Category.create!(name: "Fiction", description: "Novels and stories from the imagination")
non_fiction = Category.create!(name: "Non-Fiction", description: "Real stories and factual accounts")
childrens = Category.create!(name: "Children's Books", description: "Books for young readers")
canadian = Category.create!(name: "Canadian Authors", description: "Stories from Canadian voices")

# Products
Product.create!([
  { title: "The Handmaid's Tale", author: "Margaret Atwood",
    description: "A dystopian novel set in the near-future Gilead, a totalitarian society where women are property of the state.",
    price_cents: 1699, stock_qty: 15, active: true, category: canadian },

  { title: "Anne of Green Gables", author: "L.M. Montgomery",
    description: "The beloved story of Anne Shirley, a red-haired orphan girl who comes to live on Prince Edward Island.",
    price_cents: 1299, stock_qty: 20, active: true, category: canadian },

  { title: "The Alchemist", author: "Paulo Coelho",
    description: "A magical story about Santiago, a young shepherd boy who dreams of finding treasure in Egypt.",
    price_cents: 1599, stock_qty: 12, active: true, category: fiction },

  { title: "To Kill a Mockingbird", author: "Harper Lee",
    description: "A powerful story of racial injustice and moral growth in the American South, seen through the eyes of young Scout Finch.",
    price_cents: 1499, stock_qty: 18, active: true, category: fiction },

  { title: "Sapiens", author: "Yuval Noah Harari",
    description: "A brief history of humankind, exploring how Homo sapiens came to dominate the Earth.",
    price_cents: 2199, stock_qty: 10, active: true, category: non_fiction },

  { title: "Educated", author: "Tara Westover",
    description: "A memoir about a young woman who grows up in a survivalist family and goes on to earn a PhD from Cambridge University.",
    price_cents: 1899, stock_qty: 8, active: true, category: non_fiction },

  { title: "Becoming", author: "Michelle Obama",
    description: "An intimate memoir by the former First Lady of the United States, tracing her journey from the South Side of Chicago to the White House.",
    price_cents: 2299, stock_qty: 14, active: true, category: non_fiction },

  { title: "Charlotte's Web", author: "E.B. White",
    description: "The classic tale of a pig named Wilbur and his friendship with a barn spider named Charlotte.",
    price_cents: 999, stock_qty: 25, active: true, category: childrens },

  { title: "The Very Hungry Caterpillar", author: "Eric Carle",
    description: "A beloved picture book following a caterpillar as he eats through a variety of foods before becoming a butterfly.",
    price_cents: 899, stock_qty: 30, active: true, category: childrens },

  { title: "In the Skin of a Lion", author: "Michael Ondaatje",
    description: "A lyrical novel set in Toronto in the early twentieth century, following immigrant workers who built the city.",
    price_cents: 1799, stock_qty: 9, active: true, category: canadian }
])

puts "Created #{Category.count} categories and #{Product.count} products!"AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?