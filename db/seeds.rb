User.create!(name: 'Mitchel Kuijpers', email: 'mitchel@gmail.com', password: 'ontwikkeling', password_confirmation: 'ontwikkeling')
User.create!(name: 'Gieljon Kievelaar', email: 'gieljon@gmail.com', password: 'ontwikkeling', password_confirmation: 'ontwikkeling')
User.create!(name: 'Patrick Buiting', email: 'patrick@gmail.com', password: 'ontwikkeling', password_confirmation: 'ontwikkeling')
User.create!(name: 'Michell Pouwels', email: 'michelle@gmail.com', password: 'ontwikkeling', password_confirmation: 'ontwikkeling')

wiki = Wiki.create!(title: 'VeleVerhalen', description: 'Militie registers')

Page.create!(wiki_id: wiki.id, title: 'Cornelis Lely')