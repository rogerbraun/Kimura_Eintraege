#encoding: utf-8
require "dm-core"
require "do_sqlite3"
require "app/models/entry.rb"

require "nokogiri"

DataMapper.setup(:default, "sqlite3:///home/roger/programme/florenz/db/development.db")

doc = Nokogiri::HTML(open("florenz.htm"))

doc.css(".paragraph").each do |x|
  unless x.content[/—   \d+ —/] or x.content.strip.empty?
then
  arr = x.content.split
  e =Entry.new({:lemma => arr[0].to_s, :kanji => "", :body => arr[1..-1].join(" ").to_s, :checked => false})
  puts e.save
  end
end
