user = User.create(id: 1, name: 'User1', email: "user1@email.com", password: "123456", password_confirmation: "123456")

service = Service.create(author_id: '1', name: 'Internet', icon: "https://d1nhio0ox7pgb.cloudfront.net/_img/g_collection_png/standard/128x128/wifi.png")
service2 = Service.create(author_id: '1', name: 'Water', icon: "https://www.iconexperience.com/_img/g_collection_png/standard/128x128/water_tap.png")

bill = Bill.create(author_id: 1, service_id: 1,  name: "Netflix", amount: 123.0)
bill2 = Bill.create(author_id: 1, service_id: 1, name: "HBO Max", amount: 123.0)


bill3 = Bill.create(author_id: 1, service_id: 2,  name: "Minalba", amount: 1.50)
bill4 = Bill.create(author_id: 1, service_id: 2, name: "Cielo", amount: 1.0)