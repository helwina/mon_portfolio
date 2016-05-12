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

  create_table "admin", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "pseudo", limit: 45
    t.string "psw",    limit: 45
  end

  create_table "articles", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "title",    limit: 75
    t.text    "content",  limit: 4294967295
    t.text    "preview",  limit: 4294967295
    t.date    "date"
    t.integer "admin_id",                    null: false, unsigned: true
    t.index ["admin_id"], name: "fk_articles_admin1_idx", using: :btree
  end

  create_table "articles_has_categories", primary_key: ["articles_id", "categories_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "articles_id",   null: false, unsigned: true
    t.integer "categories_id", null: false, unsigned: true
    t.index ["articles_id"], name: "fk_articles_has_categories_articles_idx", using: :btree
    t.index ["categories_id"], name: "fk_articles_has_categories_categories1_idx", using: :btree
  end

  create_table "articles_has_tags", primary_key: ["articles_id", "tags_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "articles_id", null: false, unsigned: true
    t.integer "tags_id",     null: false, unsigned: true
    t.index ["articles_id"], name: "fk_articles_has_tags_articles1_idx", using: :btree
    t.index ["tags_id"], name: "fk_articles_has_tags_tags1_idx", using: :btree
  end

  create_table "categories", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nom", limit: 75
  end

  create_table "coments", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "pseudo",      limit: 75
    t.string  "mail"
    t.text    "content",     limit: 4294967295
    t.date    "date"
    t.integer "articles_id",                    null: false, unsigned: true
    t.integer "admin_id",                       null: false, unsigned: true
    t.integer "users_id",                       null: false, unsigned: true
    t.index ["admin_id"], name: "fk_coments_admin1_idx", using: :btree
    t.index ["articles_id"], name: "fk_coments_articles1_idx", using: :btree
    t.index ["users_id"], name: "fk_coments_users1_idx", using: :btree
  end

  create_table "tags", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nom", limit: 75
  end

  create_table "users", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "pseudo", limit: 75
    t.string "mail",   limit: 75
    t.string "psw",    limit: 75
  end

  add_foreign_key "articles", "admin", name: "fk_articles_admin1"
  add_foreign_key "articles_has_categories", "articles", column: "articles_id", name: "fk_articles_has_categories_articles"
  add_foreign_key "articles_has_categories", "categories", column: "categories_id", name: "fk_articles_has_categories_categories1"
  add_foreign_key "articles_has_tags", "articles", column: "articles_id", name: "fk_articles_has_tags_articles1"
  add_foreign_key "articles_has_tags", "tags", column: "tags_id", name: "fk_articles_has_tags_tags1"
  add_foreign_key "coments", "admin", name: "fk_coments_admin1"
  add_foreign_key "coments", "articles", column: "articles_id", name: "fk_coments_articles1"
  add_foreign_key "coments", "users", column: "users_id", name: "fk_coments_users1"
end
