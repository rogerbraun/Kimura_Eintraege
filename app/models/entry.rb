class Entry

  include DataMapper::Resource
  # property <name>, <type>
  property :id, Serial
  property :lemma, String
  property :kanji, String
  property :body, Text
  property :checked, Boolean
  property :xml, Text
  property :in_bearbeitung, Boolean, :default => false

  belongs_to :account, :required => false

end
