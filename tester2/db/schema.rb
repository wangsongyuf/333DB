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

ActiveRecord::Schema.define(version: 20160506060220) do

  create_table "CRate", id: false, force: :cascade do |t|
    t.integer "CID",     limit: 4
    t.integer "UUID",    limit: 4
    t.integer "Rating",  limit: 4
    t.varchar "Comment", limit: 50
  end

  create_table "College", primary_key: "CID", force: :cascade do |t|
    t.varchar "Name",                         limit: 50
    t.integer "Ranking",                      limit: 4
    t.money   "Tuition",                                  precision: 19, scale: 4
    t.varchar "FundingOption",                limit: 50
    t.integer "AverageStandardizedTestScore", limit: 4
    t.varchar "InState",                      limit: 20
    t.varchar "AtAddress",                    limit: 500
  end

  create_table "Department", primary_key: "DID", force: :cascade do |t|
    t.varchar "Name",  limit: 50
    t.varchar "Phone", limit: 15
    t.varchar "Email", limit: 50
    t.integer "CID",   limit: 4
  end

  create_table "FRate", id: false, force: :cascade do |t|
    t.integer "FID",     limit: 4
    t.integer "UUID",    limit: 4
    t.integer "Rating",  limit: 4
    t.varchar "Comment", limit: 50
  end

  create_table "Faculty", primary_key: "FID", force: :cascade do |t|
    t.varchar "Name",  limit: 50
    t.varchar "Area",  limit: 500
    t.varchar "Email", limit: 50
  end

  create_table "Program", primary_key: "PID", force: :cascade do |t|
    t.varchar "Name",                   limit: 500
    t.integer "USNewsRanking",          limit: 4
    t.integer "PrincetonReviewRanking", limit: 4
    t.integer "CID",                    limit: 4
    t.integer "DID",                    limit: 4
  end

  create_table "Supervise", id: false, force: :cascade do |t|
    t.integer "FID", limit: 4
    t.integer "PID", limit: 4
  end

  create_table "ThisUser", primary_key: "UUID", force: :cascade do |t|
    t.varchar "Username",      limit: 50
    t.varchar "UPassword",     limit: 50
    t.varchar "CurrentStatus", limit: 50
    t.integer "AtYear",        limit: 4
    t.string  "firstname",     limit: 4000
  end

  create_table "WorkIn", id: false, force: :cascade do |t|
    t.integer "FID", limit: 4
    t.integer "DID", limit: 4
  end

  create_table "tester2s", force: :cascade do |t|
    t.string   "Name",       limit: 4000
    t.string   "username",   limit: 4000
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "first_name",      limit: 4000
    t.string   "last_name",       limit: 4000
    t.string   "email",           limit: 4000
    t.string   "password_digest", limit: 4000
    t.string   "username",        limit: 4000
    t.string   "CurrentStatus",   limit: 4000
    t.integer  "AtYear",          limit: 4
  end

  add_foreign_key "CRate", "College", column: "CID", primary_key: "CID", name: "FK__CRate__CID__0C50D423"
  add_foreign_key "CRate", "ThisUser", column: "UUID", primary_key: "UUID", name: "FK__CRate__UUID__0D44F85C"
  add_foreign_key "Department", "College", column: "CID", primary_key: "CID", name: "FK__Department__CID__02C769E9"
  add_foreign_key "FRate", "Faculty", column: "FID", primary_key: "FID", name: "FK__FRate__FID__0F2D40CE"
  add_foreign_key "FRate", "ThisUser", column: "UUID", primary_key: "UUID", name: "FK__FRate__UUID__10216507"
  add_foreign_key "Program", "College", column: "CID", primary_key: "CID", name: "FK__Program__CID__05A3D694"
  add_foreign_key "Program", "Department", column: "DID", primary_key: "DID", name: "FK__Program__DID__0697FACD"
  add_foreign_key "Supervise", "Faculty", column: "FID", primary_key: "FID", name: "FK__Supervise__FID__14E61A24"
  add_foreign_key "Supervise", "Program", column: "PID", primary_key: "PID", name: "FK__Supervise__PID__15DA3E5D"
  add_foreign_key "WorkIn", "Department", column: "DID", primary_key: "DID", name: "FK__WorkIn__DID__12FDD1B2"
  add_foreign_key "WorkIn", "Faculty", column: "FID", primary_key: "FID", name: "FK__WorkIn__FID__1209AD79"
end
