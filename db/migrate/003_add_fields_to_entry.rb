migration 3, :add_fields_to_entry do
  up do
    modify_table :entries do
      add_column :checked, "BOOLEAN"
    end
  end

  down do
    modify_table :entries do
      drop_column :checked
    end
  end
end
