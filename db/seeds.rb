content = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestiae aspernatur laudantium id aliquid? Quod et impedit error natus, ipsam, aspernatur dignissimos, nisi delectus asperiores doloribus repellendus veritatis ipsa. Deserunt, dolores.'
user = User.create!(name: 'John', email: 'john@hellojam.fr', password: 'azerty')

4.times do |i|
  Post.create!(title: "Article #{i}", content: content, user_id: user.id)
end

3.times do |j|
  Comment.create!(text: "Cet article est génial !", user_id: user.id, post_id: Post.find_by(title: "Article 1").id)
end