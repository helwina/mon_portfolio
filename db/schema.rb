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

ActiveRecord::Schema.define(version: 0) do

  create_table "articles", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title",   limit: 75
    t.text   "content", limit: 4294967295
    t.text   "preview", limit: 4294967295
  end

  create_table "articles_categories", primary_key: ["articles_id", "categories_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "articles_id",   null: false, unsigned: true
    t.integer "categories_id", null: false, unsigned: true
    t.index ["articles_id"], name: "fk_articles_has_categories_articles1_idx", using: :btree
    t.index ["categories_id"], name: "fk_articles_has_categories_categories1_idx", using: :btree
  end

  create_table "articles_tags", primary_key: ["articles_id", "tags_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "articles_id", null: false, unsigned: true
    t.integer "tags_id",     null: false, unsigned: true
    t.index ["articles_id"], name: "fk_articles_has_tags_articles1_idx", using: :btree
    t.index ["tags_id"], name: "fk_articles_has_tags_tags1_idx", using: :btree
  end

  create_table "categories", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 45
  end

  create_table "coments", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "pseudo",      limit: 75
    t.string  "mail",        limit: 75
    t.text    "content",     limit: 4294967295
    t.integer "articles_id",                    null: false, unsigned: true
    t.index ["articles_id"], name: "fk_coment_articles1_idx", using: :btree
  end

  create_table "tags", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 75
  end

  add_foreign_key "articles_categories", "articles", column: "articles_id", name: "fk_articles_has_categories_articles1"
  add_foreign_key "articles_categories", "categories", column: "categories_id", name: "fk_articles_has_categories_categories1"
  add_foreign_key "articles_tags", "articles", column: "articles_id", name: "fk_articles_has_tags_articles1"
  add_foreign_key "articles_tags", "tags", column: "tags_id", name: "fk_articles_has_tags_tags1"
  add_foreign_key "coments", "articles", column: "articles_id", name: "fk_coment_articles1"
end
