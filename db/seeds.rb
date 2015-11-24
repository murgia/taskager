# yay seed data!
Group.destroy_all
groups = Group.create([
  {title:"GADC-WDI", photo_url: "https://avatars0.githubusercontent.com/u/6361298?v=3&s=200"},
  {title:"Family", photo_url:"http://images.clipartpanda.com/clipart-family-clip-art-pictures-family.jpg"}
])

Member.destroy_all
members = Member.create([
{name: "Matthew", image_url: "http://www.classicfilmjerks.com/wp-content/uploads/2013/11/600full-the-grapes-of-wrath-poster.jpg"},
{name: "Siddhartha", image_url: "http://ecx.images-amazon.com/images/I/41drZBnWSzL._SY344_BO1,204,203,200_.jpg"}
])

Membership.destroy_all
memberships = Membership.create([
  {group_id:1 , member_id:1},
  {group_id:2 , member_id:2}
  ])

Task.destroy_all
tasks = Task.create([
  {task: "Finish group controllers", comment: "finish the controllers for groups", due_by:"November 15", membership_id:1},
  {task: "Preach love and happiness", comment: "make sure you get every room", due_by:"Always", membership_id:2}
  ])
