class CreateInitialSchema < ActiveRecord::Migration

  def change
    create_table :people do |t|
      t.string      :first_name
      t.string      :last_name
      t.string      :middle_name
      t.string      :prefix
      t.string      :suffix
      t.string      :abbreviation
      t.date        :birth
      t.date        :death
      t.timestamps
    end

    create_table :works do |t|
      t.string      :title
      t.string      :abbreviation
      t.text        :description
      t.string      :hammond_number
      t.timestamps
    end

    create_table :authorships do |t|
      t.references  :works
      t.references  :people
    end

    create_table :editions do |t|
      t.string      :name
      t.text        :description
      t.string      :hammond_number
      t.string      :publisher
      t.string      :language
      t.integer     :publication_year
      t.string      :publication_city
      t.string      :publication_country
      t.date        :published_on
      t.integer     :printings
      t.string      :price
      t.hstore      :format  # cover, size, dustjacket, material, slipcase
      t.hstore      :links   # amazon, abebooks, etc.
      t.references  :work
    end
    add_index :editions, :work_id
    add_index :editions, :publication_year

    create_table :edition_volumes do |t|
      t.string      :isbn
      t.string      :lccn
      t.string      :title
      t.string      :hammond_number
      t.integer     :volume_number
      t.references  :edition
    end
    add_index :edition_volumes, :edition_id

    # editorships, illustratorships, forward authors, cover art
    create_table :contributions do |t|
      t.references  :edition
      t.references  :person
      t.string      :type
    end
    add_index :contributions, :edition_id
    add_index :contributions, :person_id
    add_index :contributions, :type
  end

end
