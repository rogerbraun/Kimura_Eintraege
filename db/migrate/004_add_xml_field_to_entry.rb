migration 4, :add_xml_field_to_entry do
  up do
    modify_table :entries do
      add_column :xml, "TEXT"
    end
  end

  down do
    modify_table :entries do
      drop_column :xml
    end
  end
end
