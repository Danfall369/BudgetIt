user = User.create(id: 1, name: 'User1', email: "user1@email.com", password: "123456", password_confirmation: "123456")

service = Service.create(author_id: '1', name: 'Internet', icon: "https://d1nhio0ox7pgb.cloudfront.net/_img/g_collection_png/standard/128x128/wifi.png")

bill = Bill.create(author_id: 1, name: "Netflix", amount: 123.0)