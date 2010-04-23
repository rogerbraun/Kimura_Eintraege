migration 1, :create_entries do
  up do
    create_table :entries do
      column :id, Integer, :serial => true
      column :lemma, String
      column :kanji, String
      column :body, "TEXT"
    end
  end

  down do
    drop_table :entries
  end
end
