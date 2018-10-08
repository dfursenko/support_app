require 'nokogiri'
require 'open-uri'

Role.destroy_all     if Role.any?
User.destroy_all     if User.any?
Ticket.destroy_all   if Ticket.any?
Tag.destroy_all      if Tag.any?
Category.destroy_all if Category.any?
Article.destroy_all  if Article.any?
Comment.destroy_all  if Comment.any?
Mark.destroy_all     if Mark.any?

# # Roles
admin_role = Role.create! name: 'admin', code: 1
moder_role = Role.create! name: 'moderator', code: 2
user_role  = Role.create! name: 'user', code: 3

# Users
admin = User.create! email: 'admin@mail.ru', password: 12341234, role: admin_role
moder = User.create! email: 'moder@mail.ru', password: 12341234, role: moder_role
user  = User.create! email: 'user@mail.ru',  password: 12341234, role: user_role

# Tickets
10.times do |i|
  Ticket.create user_id: 3, body: "Запрос №#{i}", moderator: moder, status: true
end

# Tags
30.times { |i| Tag.create name: "Тег_#{i}" }

# Categories and articles
%w[registration settings letters ab security mailer].each do |link|
  page = Nokogiri::HTML(open("https://help.mail.ru/mail-help/#{link}"))
  category_name = page.css('.h-header.margin_top_8').css('.h-header__text').text.strip
  category = Category.create! title: category_name, level: 0, parent: nil, published: true
  page.css('.h-header__text.link-holder.color-blue').each do |item|
    article_page = Nokogiri::HTML(open("https://help.mail.ru#{item['href']}"))
    title = item.text.strip
    body = article_page.css('.h-text.margin_bottom_24').text
    tag_ids = [Tag.all.sample.id, Tag.all.sample.id, Tag.all.sample.id]
    Article.create! user: admin, category: category, title: title, body: body, published: true, tag_ids: tag_ids
  end
end

# Comments
Ticket.all.each do |ticket|
10.times do |i|
  body = "Комментарий №#{i} к тикету '#{ticket.id}'"
  Comment.create! commentable: ticket, user: user, body: body
end
end
Article.all.each do |article|
  10.times do |i|
    body = "Комментарий №#{i} к статье '#{article.title}'"
    Comment.create! commentable: article, user: user, body: body
  end
end
