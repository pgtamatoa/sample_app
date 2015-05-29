content = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestiae aspernatur laudantium id aliquid? Quod et impedit error natus, ipsam, aspernatur dignissimos, nisi delectus asperiores doloribus repellendus veritatis ipsa. Deserunt, dolores.'
user = User.create!(name: 'John', email: 'john@hellojam.fr', password: 'azerty')
Post.create!(title: 'Article1', content: content, user_id: user.id)
Post.create!(title: 'Article2', content: content, user_id: user.id)
Post.create!(title: 'Article3', content: content, user_id: user.id)
Post.create!(title: 'Article4', content: content, user_id: user.id)
