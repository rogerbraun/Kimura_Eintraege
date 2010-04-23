require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe "Entry Model" do
  it 'can be created' do
    @entry = Entry.new
    @entry.should_not be_nil
  end
  it "can use every field" do
    @entry = Entry.new({:lemma => "test", :kanji => "kan", :body =>"lalala", :checked => true})
    @entry.save.should == true
  end
end
