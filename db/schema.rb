# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 1) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "authorships", force: true do |t|
    t.integer "works_id"
    t.integer "people_id"
  end

  create_table "contributions", force: true do |t|
    t.integer "edition_id"
    t.integer "person_id"
    t.string  "type"
  end

  add_index "contributions", ["edition_id"], name: "index_contributions_on_edition_id"
  add_index "contributions", ["person_id"], name: "index_contributions_on_person_id"
  add_index "contributions", ["type"], name: "index_contributions_on_type"

  create_table "edition_volumes", force: true do |t|
    t.string  "isbn"
    t.string  "lccn"
    t.string  "title"
    t.string  "hammond_number"
    t.integer "volume_number"
    t.integer "edition_id"
  end

  add_index "edition_volumes", ["edition_id"], name: "index_edition_volumes_on_edition_id"

  create_table "editions", force: true do |t|
    t.string  "name"
    t.text    "description"
    t.string  "hammond_number"
    t.string  "publisher"
    t.string  "language"
    t.integer "publication_year"
    t.string  "publication_city"
    t.string  "publication_country"
    t.date    "published_on"
    t.integer "printings"
    t.string  "price"
    t.hstore  "format"
    t.hstore  "links"
    t.integer "work_id"
  end

  add_index "editions", ["publication_year"], name: "index_editions_on_publication_year"
  add_index "editions", ["work_id"], name: "index_editions_on_work_id"

  create_table "people", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.string   "prefix"
    t.string   "suffix"
    t.string   "abbreviation"
    t.date     "birth"
    t.date     "death"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "works", force: true do |t|
    t.string   "title"
    t.string   "abbreviation"
    t.text     "description"
    t.string   "hammond_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
